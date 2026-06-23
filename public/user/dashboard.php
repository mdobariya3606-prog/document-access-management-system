<?php
require '../session.php';
include '../include/header.php';
require '../../config/bootstrap.php';
require '../functions/Helper.php';

/** @var mysqli $conn */
$helper = new Helper($conn);
$user_id = $_SESSION['user']['id'];

$stmt = $conn->prepare('select count(*) as total from document_info where owner_id = ?');
$stmt->bind_param('i', $user_id);
$stmt->execute();
$result = $stmt->get_result();
$total = $result->fetch_assoc();
$totalDocuments = $total['total'];

$stmt = $conn->prepare('
SELECT count(*) AS total
FROM document_user_permission p
JOIN document_info d
    ON p.document_id = d.document_id
JOIN user_info u
    ON d.owner_id = u.id
WHERE p.user_id = ? and d.owner_id != ?');

$stmt->bind_param('ii', $user_id, $user_id);
$stmt->execute();
$result = $stmt->get_result();
$total = $result->fetch_assoc();
$sharedFiles = $total['total'];

$storage = $helper->getStorageById($user_id);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div class="container">
        <div class="dashboard">
            <table class="profile-table">
                <tr>
                    <th>Description</th>
                    <th>Details</th>
                </tr>
                <tr>
                    <td>Total documents</td>
                    <td><?php echo $totalDocuments; ?></td>
                </tr>
                <tr>
                    <td>Shared files</td>
                    <td><?php echo $sharedFiles; ?></td>
                </tr>
                <tr>
                    <td>Storage Used</td>
                    <td><?php echo round($storage / (1024 * 1024), 2); ?>MB/400MB</td>
                </tr>
                <tr>
                    <td>Received Files</td>
                    <td><?php echo $sharedFiles; ?></td>
                </tr>
                <tr>
                    <td>Active Shares</td>
                    <td><?php echo $totalDocuments; ?></td>
                </tr>
                <tr>
                    <td>Last Upload</td>
                    <td><?php echo $totalDocuments; ?></td>
                </tr>
            </table>
        </div>
    </div>
</body>

</html>