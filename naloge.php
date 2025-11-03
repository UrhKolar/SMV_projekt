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
    <title>Naloge - eKonferenca</title>
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
    </style>
</head>
<body>
    <header class="topbar">
        <div class="brand">eKonferenca - Naloge</div>
        <nav class="nav">
            <span id="user-info" style="margin-right:12px;color:#c9d1d9;">
                <?php echo htmlspecialchars($user_name); ?>
                <span class="role-badge <?php echo $user_role; ?>"><?php echo $user_role; ?></span>
            </span>
            <a href="dashboard.php">Dashboard</a>
            <a href="predmeti.php">Predmeti</a>
            <a href="ucitelji.php">Učitelji</a>
            <a href="ucenci.php">Učenci</a>
            <a href="gradiva.php">Gradiva</a>
            <a href="naloge.php" class="active">Naloge</a>
            <a href="poizvedbe.php">Poizvedbe</a>
            <?php if ($user_role === 'ucitelj' || $user_role === 'uitelj'): ?>
            <a href="redovalnica.php">📊 Redovalnica</a>
            <?php endif; ?>
            <a href="logout.php">Odjava</a>
        </nav>
    </header>

    <main class="container">
        <section class="card">
            <h2>Naloge</h2>
            <p>Pregled vseh nalog in ocen v sistemu</p>
            <div id="tbl-naloge" class="table"></div>
        </section>
    </main>

    <footer class="footer">
        © eKonferenca
    </footer>

    <script src="app.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Render naloge table with names
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
        });
    </script>
</body>
</html>



