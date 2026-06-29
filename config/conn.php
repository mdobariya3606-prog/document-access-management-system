<?php

$conn = mysqli_connect(
    $_ENV['DB_HOST'],
    $_ENV['DB_USERNAME'],
    $_ENV['DB_PASSWORD'],
    $_ENV['DB_NAME'],
    $_ENV['DB_PORT']
);

if (!$conn) {
    die(mysqli_connect_errno());
}