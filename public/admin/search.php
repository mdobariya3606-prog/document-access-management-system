<?php
require '../session.php';
require '../middleware/auth.php';
require '../middleware/admin.php';
require '../../config/bootstrap.php';
/** @var mysqli $conn */

$search = $_GET['search'];
$like = '%' . $search . '%';

$sql = 'select d.*, u.name, u.can_share
    from document_info d 
    join user_info u 
    on d.owner_id = u.id
    where u.id = ? and folder_id = ? and (d.original_name like ? or u.name like ? or d.extension like ?)';

$stmt = $conn->prepare($sql);
$stmt->bind_param('iisss', $_SESSION['user']['id'], $_SESSION['folder']['id'], $like, $like, $like);

$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {


    while ($file = $result->fetch_assoc()) { ?>

        <div class="file-box" id='file-row-<?php echo $file['document_id']; ?>'>
            <h3><?php echo $file['original_name'] ?></h3>

            <p>Type: <?php echo $file['extension']; ?></p>
            <p>Size: <?php echo round($file['file_size'] / (1024 * 1024), 2); ?> MB</p>
            <p>Owner: <?php echo $file['name']; ?></p>
            <p>Uploaded: <?php echo date('d-m-Y', strtotime($file['created_at'])); ?></p>

            <div class="actions">
                <a href="../files/rename.php?id=<?php echo $file['document_id']; ?>" class="btn">Rename</a>
                <a href="../files/download.php?id=<?php echo $file['document_id']; ?>" class="btn">Download</a>

                <button onclick="deleteDocument(<?php echo $file['document_id']; ?>)" class="btn delete">Delete</button>

                <?php if ($_SESSION['admin'] || $file['can_share'] == 'YES') { ?>
                    <a href="../files/share-file.php?id=<?php echo $file['document_id']; ?>" class="btn">Share</a>
                    <a href="../files/permissions.php?id=<?php echo $file['document_id']; ?>" class="btn">Permissions</a>
                <?php } ?>
            </div>
        </div>
<?php }
} else {
    echo "<h4 style='margin: 10px;'>No result found</h4>";
}

?>