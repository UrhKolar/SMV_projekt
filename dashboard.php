<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_role = $_SESSION['user_role'];
$user_name = $_SESSION['user_name'];
$user_type = $_SESSION['user_type'];
?>
<!DOCTYPE html>
<html lang="sl">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>eKonferenca - Dashboard</title>
    <link rel="stylesheet" href="styles.css" />
    <style>
        body {
            background: url('ozadje.jpeg') center/cover no-repeat fixed;
            min-height: 100vh;
        }
        .role-badge {
            background: #1a8f9b;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }
        .role-badge.skrbnik { background: #d32f2f; }
        .role-badge.ucitelj { background: #1976d2; }
        .role-badge.ucenec { background: #388e3c; }
        .grade-input {
            display: none;
        }
        .grade-input.active {
            display: block;
        }
        .admin-panel {
            display: none;
        }
        .admin-panel.active {
            display: block;
        }
    </style>
</head>
<body>
    <header class="topbar">
        <div class="brand">eKonferenca</div>
        <nav class="nav">
            <span id="user-info" style="margin-right:12px;color:#c9d1d9;">
                <?php echo htmlspecialchars($user_name); ?>
                <span class="role-badge <?php echo $user_role; ?>"><?php echo $user_role; ?></span>
            </span>
            <a href="predmeti.php">Predmeti</a>
            <a href="ucitelji.php">Učitelji</a>
            <a href="ucenci.php">Učenci</a>
            <a href="gradiva.php">Gradiva</a>
            <a href="naloge.php">Naloge</a>
            <a href="poizvedbe.php">Poizvedbe</a>
            <?php if ($user_role === 'ucenec' || $user_role === 'uenec'): ?>
            <a href="#moje-ocene">👨‍🎓 Moje ocene</a>
            <?php endif; ?>
            <?php if ($user_role === 'ucitelj' || $user_role === 'uitelj'): ?>
            <a href="redovalnica.php">📊 Redovalnica</a>
            <?php else: ?>
            <!-- Debug: user_role is "<?php echo $user_role; ?>" - not showing teacher button -->
            <?php endif; ?>
            <?php if ($user_role === 'skrbnik'): ?>
            <a href="#admin-grades">🔧 Upravljanje ocen</a>
            <a href="#admin">Admin</a>
            <?php endif; ?>
            <a href="logout.php">Odjava</a>
        </nav>
    </header>

    <main class="container">
        <!-- Welcome message based on role -->
        <section class="card">
            <h2>Dobrodošli, <?php echo htmlspecialchars($user_name); ?>!</h2>
            <p>Vaša vloga: <strong><?php echo ucfirst($user_role); ?></strong></p>

            <?php if ($user_role === 'ucitelj' || $user_role === 'uitelj'): ?>
                <p>Kot učitelj lahko vnašate ocene in upravljate gradiva.</p>
            <?php elseif ($user_role === 'ucenec' || $user_role === 'uenec'): ?>
                <p>Kot učenec lahko pregledujete svoje ocene in gradiva.</p>
            <?php elseif ($user_role === 'skrbnik'): ?>
                <p>Kot skrbnik imate dostop do vseh funkcionalnosti sistema.</p>
            <?php endif; ?>
        </section>

        <!-- Grade input section ONLY for teachers -->
        <?php if ($user_role === 'ucitelj' || $user_role === 'uitelj'): ?>
        <section id="ocene" class="card grade-input">
            <h2>Vnos ocen - Samo za učitelje</h2>
            <p style="color: #1976d2; font-weight: bold; margin-bottom: 1rem;">
                🎓 Kot učitelj lahko vnašate ocene učencem za različne predmete
            </p>
            <form id="grade-form">
                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr auto; gap: 10px; align-items: end;">
                    <div>
                        <label>Učenec:</label>
                        <select id="student-select" required>
                            <option value="">Izberite učenec</option>
                        </select>
                    </div>
                    <div>
                        <label>Predmet:</label>
                        <select id="subject-select" required>
                            <option value="">Izberite predmet</option>
                        </select>
                    </div>
                    <div>
                        <label>Ocena:</label>
                        <select id="grade-select" required>
                            <option value="">Ocena</option>
                            <option value="1">1 - Nezadostno</option>
                            <option value="2">2 - Zadostno</option>
                            <option value="3">3">3 - Dobro</option>
                            <option value="4">4 - Prav dobro</option>
                            <option value="5">5 - Odlično</option>
                        </select>
                    </div>
                    <button type="submit" class="btn">Dodaj oceno</button>
                </div>
            </form>
            <div id="grade-success" style="display: none; color: green; margin-top: 10px; font-weight: bold;">
                ✅ Ocena uspešno dodana!
            </div>
        </section>
        <?php endif; ?>

        <!-- Admin grade management for skrbnik -->
        <?php if ($user_role === 'skrbnik'): ?>
        <section id="admin-grades" class="card">
            <h2>Upravljanje ocen - Admin</h2>
            <p style="color: #d32f2f; font-weight: bold; margin-bottom: 1rem;">
                🔧 Kot skrbnik imate dostop do vseh funkcionalnosti, vključno z vnosom ocen
            </p>
            <form id="admin-grade-form">
                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr auto; gap: 10px; align-items: end;">
                    <div>
                        <label>Učenec:</label>
                        <select id="admin-student-select" required>
                            <option value="">Izberite učenec</option>
                        </select>
                    </div>
                    <div>
                        <label>Predmet:</label>
                        <select id="admin-subject-select" required>
                            <option value="">Izberite predmet</option>
                        </select>
                    </div>
                    <div>
                        <label>Ocena:</label>
                        <select id="admin-grade-select" required>
                            <option value="">Ocena</option>
                            <option value="1">1 - Nezadostno</option>
                            <option value="2">2 - Zadostno</option>
                            <option value="3">3 - Dobro</option>
                            <option value="4">4 - Prav dobro</option>
                            <option value="5">5 - Odlično</option>
                        </select>
                    </div>
                    <button type="submit" class="btn">Dodaj oceno</button>
                </div>
            </form>
            <div id="admin-grade-success" style="display: none; color: green; margin-top: 10px; font-weight: bold;">
                ✅ Ocena uspešno dodana!
            </div>
        </section>
        <?php endif; ?>

        <!-- Admin panel for skrbnik -->
        <?php if ($user_role === 'skrbnik'): ?>
        <section id="admin" class="card admin-panel">
            <h2>Administracija</h2>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
                <button class="btn" onclick="showUserManagement()">Upravljanje uporabnikov</button>
                <button class="btn" onclick="showSystemStats()">Statistike sistema</button>
                <button class="btn" onclick="showBackup()">Varnostna kopija</button>
            </div>
            <div id="admin-content" style="margin-top: 20px;"></div>
        </section>
        <?php endif; ?>

        <!-- Student grades view (read-only) -->
        <?php if ($user_role === 'ucenec' || $user_role === 'uenec'): ?>
        <section id="moje-ocene" class="card">
            <h2>Moje ocene</h2>
            <p style="color: #388e3c; font-weight: bold; margin-bottom: 1rem;">
                👨‍🎓 Kot učenec lahko samo pregledujete svoje ocene - vnos ocen ni dovoljen
            </p>
            <div id="student-grades" class="table"></div>
        </section>
        <?php endif; ?>

        <!-- Regular content sections -->
        <section id="predmeti" class="card">
            <h2>Predmeti</h2>
            <div id="tbl-predmeti" class="table"></div>
        </section>

        <section id="ucitelji" class="card">
            <h2>Učitelji</h2>
            <div id="tbl-ucitelji" class="table"></div>
        </section>

        <section id="ucenci" class="card">
            <h2>Učenci</h2>
            <div id="tbl-ucenci" class="table"></div>
        </section>

        <section id="gradiva" class="card">
            <h2>Gradiva</h2>
            <div id="tbl-gradiva" class="table"></div>
        </section>

        <section id="naloge" class="card">
            <h2>Naloge</h2>
            <div id="tbl-naloge" class="table"></div>
        </section>

        <section id="poizvedbe" class="card">
            <h2>Poizvedbe (primeri)</h2>

            <div class="query">
                <h3>Gradiva za slovenščino (idPredmeta = 1)</h3>
                <div id="q-gradiva-slo" class="table"></div>
            </div>

            <div class="query">
                <h3>Prof. Valentina Hrastnik – naloge za slovenščino (idUčitelja=1, idPredmeta=1)</h3>
                <div id="q-naloge-valentina" class="table"></div>
            </div>

            <div class="query">
                <h3>Ocene dijakinje Ane Kovač (idUčenca=1)</h3>
                <div id="q-ocene-ana" class="table"></div>
            </div>

            <div class="query">
                <h3>Predmeti, ki jih poučuje učitelj z id=2</h3>
                <div id="q-predmeti-ucitelj-2" class="table"></div>
            </div>

            <div class="query">
                <h3>Učenci, ki obiskujejo predmet z id=5</h3>
                <div id="q-ucenci-predmet-5" class="table"></div>
            </div>

            <div class="query">
                <h3>Povprečna ocena nalog, ki jih je ocenil učitelj z id=1</h3>
                <div id="q-povprecna-ocena" class="metric"></div>
            </div>
        </section>
    </main>

    <footer class="footer">
        © eKonferenca
    </footer>

    <script src="app.js"></script>
    <script>
        // Role-based functionality
        const userRole = '<?php echo $user_role; ?>';
        const userType = '<?php echo $user_type; ?>';
        const userId = <?php echo $_SESSION['user_id']; ?>;

        // Show/hide sections based on role
        document.addEventListener('DOMContentLoaded', function() {
            // Show grade input for teachers only
            if (userRole === 'ucitelj' || userRole === 'uitelj') {
                const gradeInput = document.querySelector('.grade-input');
                if (gradeInput) {
                    gradeInput.classList.add('active');
                }
                loadGradeFormData('teacher');
            }

            // Show admin panel for skrbnik
            if (userRole === 'skrbnik') {
                const adminPanel = document.querySelector('.admin-panel');
                if (adminPanel) {
                    adminPanel.classList.add('active');
                }
                loadGradeFormData('admin');
            }

            // Show student grades for ucenec
            if (userRole === 'ucenec' || userRole === 'uenec') {
                loadStudentGrades();
            }
        });

        function loadGradeFormData(formType) {
            if (formType === 'teacher') {
                // Populate teacher form dropdowns
                const studentSelect = document.getElementById('student-select');
                const subjectSelect = document.getElementById('subject-select');
                
                if (studentSelect) {
                    Ucenec.forEach(student => {
                        const option = document.createElement('option');
                        option.value = student.idUčenca;
                        option.textContent = student.Ime + ' ' + student.Priimek;
                        studentSelect.appendChild(option);
                    });
                }

                if (subjectSelect) {
                    Predmet.forEach(subject => {
                        const option = document.createElement('option');
                        option.value = subject.idPredmeta;
                        option.textContent = subject.Ime_predmeta;
                        subjectSelect.appendChild(option);
                    });
                }
            } else if (formType === 'admin') {
                // Populate admin form dropdowns
                const adminStudentSelect = document.getElementById('admin-student-select');
                const adminSubjectSelect = document.getElementById('admin-subject-select');
                
                if (adminStudentSelect) {
                    Ucenec.forEach(student => {
                        const option = document.createElement('option');
                        option.value = student.idUčenca;
                        option.textContent = student.Ime + ' ' + student.Priimek;
                        adminStudentSelect.appendChild(option);
                    });
                }

                if (adminSubjectSelect) {
                    Predmet.forEach(subject => {
                        const option = document.createElement('option');
                        option.value = subject.idPredmeta;
                        option.textContent = subject.Ime_predmeta;
                        adminSubjectSelect.appendChild(option);
                    });
                }
            }
        }

        function loadStudentGrades() {
            // Filter grades for current student
            const studentGrades = Naloga.filter(grade => grade.idUčenca == userId);
            
            if (studentGrades.length === 0) {
                document.getElementById('student-grades').innerHTML = 
                    '<p style="text-align: center; color: #666; padding: 2rem;">Še nimate nobenih ocen.</p>';
                return;
            }

            // Render student grades table
            renderTable(
                "student-grades",
                [
                    { header: "Predmet", accessor: function (row) {
                        var p = najdiPredmetPoId(row.idPredmeta);
                        return p ? p.Ime_predmeta : row.idPredmeta;
                    } },
                    { header: "Naslov naloge", accessor: "Naslov" },
                    { header: "Datum oddaje", accessor: "Datum_oddaje" },
                    { header: "Ocena", accessor: function (row) {
                        const grade = row.Ocena;
                        let gradeClass = '';
                        if (grade >= 4) gradeClass = 'color: green; font-weight: bold;';
                        else if (grade >= 3) gradeClass = 'color: orange; font-weight: bold;';
                        else gradeClass = 'color: red; font-weight: bold;';
                        return `<span style="${gradeClass}">${grade}</span>`;
                    } },
                    { header: "Učitelj", accessor: function (row) {
                        var u = najdiUciteljaPoId(row.idUčitelja);
                        return u ? (u.Ime + " " + u.Priimek) : row.idUčitelja;
                    } }
                ],
                studentGrades
            );

            // Calculate average grade
            const totalGrades = studentGrades.reduce((sum, grade) => sum + (grade.Ocena || 0), 0);
            const averageGrade = totalGrades / studentGrades.length;
            
            // Add average grade display
            const avgDiv = document.createElement('div');
            avgDiv.style.cssText = 'margin-top: 1rem; padding: 1rem; background: #e8f4f8; border-radius: 8px; text-align: center;';
            avgDiv.innerHTML = `<strong>Povprečna ocena: <span style="color: #1a8f9b; font-size: 1.2em;">${averageGrade.toFixed(2)}</span></strong>`;
            document.getElementById('student-grades').appendChild(avgDiv);
        }

        // Teacher grade form submission
        const teacherForm = document.getElementById('grade-form');
        if (teacherForm) {
            teacherForm.addEventListener('submit', function(e) {
                e.preventDefault();
                handleGradeSubmission('teacher');
            });
        }

        // Admin grade form submission
        const adminForm = document.getElementById('admin-grade-form');
        if (adminForm) {
            adminForm.addEventListener('submit', function(e) {
                e.preventDefault();
                handleGradeSubmission('admin');
            });
        }

        function handleGradeSubmission(formType) {
            let studentId, subjectId, grade, successDiv;
            
            if (formType === 'teacher') {
                studentId = document.getElementById('student-select').value;
                subjectId = document.getElementById('subject-select').value;
                grade = document.getElementById('grade-select').value;
                successDiv = document.getElementById('grade-success');
            } else if (formType === 'admin') {
                studentId = document.getElementById('admin-student-select').value;
                subjectId = document.getElementById('admin-subject-select').value;
                grade = document.getElementById('admin-grade-select').value;
                successDiv = document.getElementById('admin-grade-success');
            }

            if (studentId && subjectId && grade) {
                // Get student and subject names for display
                const student = Ucenec.find(s => s.idUčenca == studentId);
                const subject = Predmet.find(p => p.idPredmeta == subjectId);
                const teacher = Ucitelj.find(t => t.idUčitelja == userId);

                // Add new grade to Naloga array
                const newGrade = {
                    idNaloge: Naloga.length + 1,
                    Naslov: `Ocena za ${subject ? subject.Ime_predmeta : 'predmet'}`,
                    Vsebina: `Ocena dodana s strani ${teacher ? teacher.Ime + ' ' + teacher.Priimek : 'učitelja'}`,
                    Datum_oddaje: new Date().toISOString().split('T')[0],
                    Ocena: parseInt(grade),
                    idUčenca: parseInt(studentId),
                    idUčitelja: userId,
                    idPredmeta: parseInt(subjectId)
                };

                Naloga.push(newGrade);
                
                // Refresh the naloge table
                renderTable(
                    "tbl-naloge",
                    [
                        { header: "Naslov", accessor: "Naslov" },
                        { header: "Datum oddaje", accessor: "Datum_oddaje" },
                        { header: "Ocena", accessor: "Ocena" },
                        { header: "Učenec", accessor: function (row) {
                            var u1 = najdiUcencePoId(row.idUčenca);
                            return u1 ? (u1.Ime + " " + u1.Priimek) : row.idUčenca;
                        } },
                        { header: "Učitelj", accessor: function (row) {
                            var u2 = najdiUciteljaPoId(row.idUčitelja);
                            return u2 ? (u2.Ime + " " + u2.Priimek) : row.idUčitelja;
                        } },
                        { header: "Predmet", accessor: function (row) {
                            var p2 = najdiPredmetPoId(row.idPredmeta);
                            return p2 ? p2.Ime_predmeta : row.idPredmeta;
                        } }
                    ],
                    Naloga
                );

                // Clear form and show success message
                if (formType === 'teacher') {
                    document.getElementById('grade-form').reset();
                } else {
                    document.getElementById('admin-grade-form').reset();
                }
                
                if (successDiv) {
                    successDiv.style.display = 'block';
                    setTimeout(() => {
                        successDiv.style.display = 'none';
                    }, 3000);
                }
            } else {
                alert('Prosimo, izpolnite vsa polja!');
            }
        }

        // Admin functions
        function showUserManagement() {
            document.getElementById('admin-content').innerHTML = `
                <h3>Upravljanje uporabnikov</h3>
                <p>Skupaj uporabnikov: ${Ucenec.length + Ucitelj.length}</p>
                <p>Učenci: ${Ucenec.length}</p>
                <p>Učitelji: ${Ucitelj.length}</p>
            `;
        }

        function showSystemStats() {
            document.getElementById('admin-content').innerHTML = `
                <h3>Statistike sistema</h3>
                <p>Skupaj predmetov: ${Predmet.length}</p>
                <p>Skupaj gradiv: ${Gradivo.length}</p>
                <p>Skupaj nalog: ${Naloga.length}</p>
                <p>Povprečna ocena: ${(Naloga.reduce((sum, n) => sum + (n.Ocena || 0), 0) / Naloga.length).toFixed(2)}</p>
            `;
        }

        function showBackup() {
            document.getElementById('admin-content').innerHTML = `
                <h3>Varnostna kopija</h3>
                <p>Zadnja kopija: ${new Date().toLocaleDateString('sl-SI')}</p>
                <button class="btn" onclick="alert('Varnostna kopija v teku...')">Ustvari kopijo</button>
            `;
        }
    </script>
</body>
</html>
