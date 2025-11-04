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
    <title>Učenci - eKonferenca</title>
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
        <div class="brand">eKonferenca - Učenci</div>
        <nav class="nav">
            <span id="user-info" style="margin-right:12px;color:#c9d1d9;">
                <?php echo htmlspecialchars($user_name); ?>
                <span class="role-badge <?php echo $user_role; ?>"><?php echo $user_role; ?></span>
            </span>
            <a href="dashboard.php">Dashboard</a>
            <a href="predmeti.php">Predmeti</a>
            <a href="ucitelji.php">Učitelji</a>
            <a href="ucenci.php" class="active">Učenci</a>
            <a href="gradiva.php">Gradiva</a>
            <a href="naloge.php">Naloge</a>
            <a href="poizvedbe.php">Poizvedbe</a>
            <?php if ($user_role === 'ucitelj' || $user_role === 'uitelj'): ?>
            <a href="redovalnica.php">📊 Redovalnica</a>
            <?php endif; ?>
            <a href="logout.php">Odjava</a>
        </nav>
    </header>

    <main class="container">
        <section class="card">
            <h2>Učenci</h2>
            <p>Pregled vseh učencev v sistemu</p>
            <div id="tbl-ucenci" class="table"></div>
        </section>
    </main>

    <footer class="footer">
        © eKonferenca
    </footer>

    <script src="app.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Render ucenci table
            renderTable(
                "tbl-ucenci",
                [
                    { header: "ID", accessor: "idUčenca" },
                    { header: "Ime", accessor: "Ime" },
                    { header: "Priimek", accessor: "Priimek" }
                ],
                Ucenec
            );
        });
    </script>
</body>
</html>



