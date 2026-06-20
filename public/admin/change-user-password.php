<link rel="stylesheet" href="../css/style.css">
<?php

require '../session.php';
require '../../config/bootstrap.php';
require '../functions/Helper.php';
require '../middleware/admin.php';
require '../include/header.php';
/** @var mysqli $conn */

$id = $idErr = $password = $passwordErr = "";
$helper = new Helper($conn);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $id = $_POST['user_id'];
    $password = $_POST['password'];

    if ($id == 0) {
        $idErr = "select user";
    }

    if (empty($password)) {
        $passwordErr = 'password required';
    }

    if (empty($passwordErr)) {
        if (strlen($password) < 5) {
            $passwordErr = "minimum 5 character required";
        }
    }

    if (empty($idErr) && empty($passwordErr)) {

        $helper->changePassword($id, $password);
        header('Location: ../admin/dashboard.php');
    }
}

$users = $helper->getAllUsers();

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset password</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <div class="change-pass">
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">

            <span class="error"><?php echo $idErr; ?></span>
            <select name="user_id" id="" class="select-user">
                <option value="0">--Select User--</option>
                <?php while ($user = $users->fetch_assoc()) { ?>
                    <option value="<?php echo $user['id']; ?>"><?php echo '[' . $user['id'] . '] ' . $user['name']; ?></option>
                <?php } ?>
            </select>

            <span class="error"><?php echo $passwordErr; ?></span>
            <input type="password" name="password" id="password" placeholder="New Password">
            <button type="submit">reset-password</button>
        </form>
    </div>
</body>

</html>