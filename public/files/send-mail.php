<?php 
require __DIR__ . '/../../config/bootstrap.php';
require __DIR__ .  '/../functions/Helper.php';
/** @var mysqli $conn */;
$helper = new Helper($conn);

$result = mysqli_query($conn, 'select * from email_queue where status = "PENDING"');

while($row = $result->fetch_assoc()) {
    $helper->sendInviteEmail($mail, $row['subject'], $row['body']);
}

$result = mysqli_query($conn, 'update email_queue set status = "SENT", sent_at = CURRENT_TIMESTAMP where status = "PENDING"');
?>