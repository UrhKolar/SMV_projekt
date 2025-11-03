<?php
session_start();

// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ekonferenca";

try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname;charset=utf8mb4", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    // Error handling - redirect to login with error
    header("Location: login.html?err=db");
    exit();
}

if ($_POST) {
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    // Check in Ucitelj table first
    $stmt = $conn->prepare("SELECT * FROM Ucitelj WHERE Email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user) {
        // User found in Ucitelj table
        $_SESSION['user_id'] = $user['idUčitelja'];
        $_SESSION['user_name'] = $user['Ime'] . ' ' . $user['Priimek'];
        $_SESSION['user_email'] = $user['Email'];
        $_SESSION['user_role'] = $user['Funkcija'];
        $_SESSION['user_type'] = 'ucitelj';
        
        // Special handling for Marija - preusmeri na main_ucitelj.html
        if ($email === 'marija.crepinsek@dijak.sc-celje.si') {
            $_SESSION['user_id'] = 6; // Marija's ID in JavaScript
            $_SESSION['user_role'] = 'ucitelj'; // Force teacher role
            header("Location: main_ucitelj.html");
            exit();
        }
        
        // Drugi učitelji na index.html
        header("Location: index.html");
        exit();
    }
    
    // Check in Ucenec table
    $stmt = $conn->prepare("SELECT * FROM Ucenec WHERE Email = ?");
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user) {
        // User found in Ucenec table
        $_SESSION['user_id'] = $user['idUčenca'];
        $_SESSION['user_name'] = $user['Ime'] . ' ' . $user['Priimek'];
        $_SESSION['user_email'] = $user['Email'];
        $_SESSION['user_role'] = $user['Funkcija'];
        $_SESSION['user_type'] = 'ucenec';
        
        // Special handling for Urh - preusmeri na glavna_stran.html
        if ($email === 'urh.kolar@dijak.sc-celje.si') {
            $_SESSION['user_id'] = 6; // Urh's ID in JavaScript
            $_SESSION['user_role'] = 'ucenec'; // Force student role
            header("Location: glavna_stran.html");
            exit();
        }
        
        // Drugi učenci na index.html
        header("Location: index.html");
        exit();
    }
    
    // No user found
    header("Location: login.html?err=1");
    exit();
}
?>
<!DOCTYPE html>
<html lang="sl">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Avtentifikacija - eKonferenca</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #1a8f9b, #156a7a);
            color: white;
            text-align: center;
            padding: 50px;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: rgba(255,255,255,0.1);
            padding: 30px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Avtentifikacija v teku...</h2>
        <p>Prosimo počakajte, medtem ko preverjamo vaše podatke.</p>
    </div>
</body>
</html>