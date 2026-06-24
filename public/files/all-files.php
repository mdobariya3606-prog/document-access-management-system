<?php
require '../session.php';
require '../functions/Helper.php';
require '../middleware/auth.php';
require '../middleware/status.php';
require '../../config/bootstrap.php';
include '../include/header.php';

/** @var mysqli $conn */
$helper = new Helper($conn);


if ($_SESSION['admin']) {
    $stmt = $conn->prepare('
    select d.*, u.name, u.can_share 
    from document_info d 
    join user_info u 
    on d.owner_id = u.id    
    order by u.id');
} else {
    $stmt = $conn->prepare('
    select d.*, u.name, u.can_share 
    from document_info d 
    join user_info u 
    on d.owner_id = u.id 
    where d.owner_id = ?');

    $stmt->bind_param('i', $_SESSION['user']['id']);
}
$stmt->execute();

$result = $stmt->get_result();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Files</title>
    <style>
        .search {
            padding: 10px;
            margin: 10px;
            width: 200px;
        }
    </style>
</head>

<body>
    <a href="../files/add-file.php" class="btn-add-file">Add File 📄</a>
    <input type="text" class="search" id="search" placeholder="search files/type/users">
    <div class="file-container" , id="file-container">
        <?php if ($result->num_rows > 0) {
            while ($file = $result->fetch_assoc()) { ?>
                <div class="file-box" id='file-row-<?php echo $file['document_id']; ?>'>
                    <h3><?php echo $file['original_name'] ?></h3>

                    <p>Type: <?php echo $file['extension']; ?></p>
                    <p>Size: <?php echo round($file['file_size'] / (1024 * 1024), 2); ?> MB</p>
                    <p>Owner: <?php echo $file['name']; ?></p>
                    <p>Uploaded: <?php echo date('d-m-Y', strtotime($file['created_at'])); ?></p>

                    <div class="actions">
                        <a href="rename.php?id=<?php echo $file['document_id']; ?>" class="btn">Rename</a>
                        <a href="download.php?id=<?php echo $file['document_id']; ?>" class="btn">Download</a>

                        <button onclick="deleteDocument(<?php echo $file['document_id']; ?>)" class="btn delete">Delete</button>

                        <?php if ($_SESSION['admin'] || $file['can_share'] == 'YES') { ?>
                            <a href="share-file.php?id=<?php echo $file['document_id']; ?>" class="btn">Share</a>
                            <a href="permissions.php?id=<?php echo $file['document_id']; ?>" class="btn">Permissions</a>
                        <?php } ?>
                    </div>
                </div>
        <?php  }
        } ?>
    </div>
</body>

<script>
    document.getElementById('search').addEventListener('keyup', function() {
        let keyword = this.value;

        fetch('../files/search.php?search=' + encodeURIComponent(keyword))
            .then(response => response.text())
            .then(data => {
                document
                    .getElementById('file-container')
                    .innerHTML = data;
            });
    })

    function deleteDocument(id) {
        if (confirm('delete this document?')) {
            fetch('delete-file.php?id=' + id)
                .then(response => response.text())
                .then(data => {
                    console.log(data);
                    if (data.trim() === 'success') {
                        document
                            .getElementById('file-row-' + id)
                            .remove();
                    }
                })
        }
    }
</script>

</html>