<?php
require '../session.php';
require '../../config/bootstrap.php';
require '../functions/Helper.php';
/** @var mysqli $conn */

$helper = new Helper($conn);

$id = $_GET['id'];
$result = $helper->getDocumentById($id);
$file = $result->fetch_assoc();


$path = '../../uploads/user/' . $file['owner_id'] . '/' . $file['file_name'] . '.' . $file['extension'];
// $path = '../../uploads/admin/' . $file['file_name'] . '.' . $file['extension'];

// echo $path;
if (file_exists($path)) {
    // if (ob_get_level()) {
    //     ob_end_clean();
    // }
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="' . $file['original_name'] . '"');
    header('Content-Length: ' . filesize($path));

    readfile($path);
    exit;
}
