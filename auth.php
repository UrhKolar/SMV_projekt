<?php
session_start();
$email = isset($_POST['email']) ? trim($_POST['email']) : '';
$pass = isset($_POST['password']) ? $_POST['password'] : '';
// Preprosta baza uporabnikov (demo). V praksi bi bila baza in hashi.
$users = [
['email' => 'student@sola.si', 'password' => 'test1234'],
['email' => 'ana@sola.si', 'password' => 'geslo123']
];
$ok = false;
foreach ($users as $u) {
if (strcasecmp($u['email'], $email) === 0 && $u['password'] === $pass) {
$ok = true; break;
}
}
if ($ok) {
$_SESSION['user_email'] = $email;
header('Location: index.php');
exit;
} else {
header('Location: login.php?err=Napačen email ali geslo');
exit;
}