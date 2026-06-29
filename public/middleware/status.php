<?php

require '../session.php';
require '../../config/bootstrap.php';

/** @var mysqli $conn */

if (!isset($_SESSION['user'])) {
    header('Location: /auth/login.php');
    exit;
}

$stmt = $conn->prepare("SELECT * FROM user_info WHERE id = ?");
if (!$stmt) {
    throw new Exception($conn->error);
}

$stmt->bind_param('i', $_SESSION['user']['id']);

if (!$stmt->execute()) {
    throw new Exception($stmt->error);
}

$result = $stmt->get_result();
$user = $result->fetch_assoc();

if (!$user) {
    session_destroy();
    header('Location: /auth/login.php');
    exit;
}

if ($user['status'] === 'INACTIVE') {
    session_destroy();
    die("Your account has been deactivated, please reach out to the admin.");
}
