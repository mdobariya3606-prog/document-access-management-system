<?php
require '../session.php';
require '../../config/bootstrap.php';
require '../functions/Helper.php';
include '../include/header.php';
/** @var mysqli $conn */
$helper = new Helper($conn);

$stmt = $conn->prepare('select * from document_info where owner_id = ?');
$stmt->bind_param('i', $_SESSION['user']['id']);
$stmt->execute();

$result = $stmt->get_result();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Files</title>
</head>

<body>
    <?php if ($result->num_rows > 0) {
        while ($file = $result->fetch_assoc()) { ?>
            <div class="file-box">
                <h3>Name: <?php echo $file['original_name']; ?></h3>
                <p>Size: <?php echo $file['file_size']; ?></p>
                <p>Extension: <?php echo $file['extension']; ?></p>
                <p>Uploaded at: <?php echo $file['created_at']; ?></p>
            </div>
    <?php  }
    } ?>
</body>

</html>