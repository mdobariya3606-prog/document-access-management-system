<?php 
require '../session.php';

/** @var mysqli $conn */
require '../../config/bootstrap.php';
require '../middleware/admin.php';
require '../functions/Helper.php';

$helper = new Helper($conn);
$id = $_GET['id'];

$user = $helper->getUserById($id);

$stmt = $conn->prepare("UPDATE user_info SET status = IF(status = 'ACTIVE', 'INACTIVE', 'ACTIVE') WHERE id = ?");
$stmt->bind_param('i', $id);
$stmt->execute();

header("Location: ../admin/dashboard.php");

?>