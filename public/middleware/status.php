<?php 
require '../session.php';
require '../../config/bootstrap.php';
/** @var mysqli $conn */

$stmt = $conn->prepare("select * from user_info where id = ?");
$stmt->bind_param('i', $_SESSION['user']['id']);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if ($user['status'] === 'INACTIVE') {
    session_destroy();
    die("Your account has been deactivated, please reach out the admin.");
}
?>