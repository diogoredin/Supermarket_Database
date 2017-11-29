<?php
    try {

        /* Database Connection */
        $host = "db.ist.utl.pt";
        $user = "ist426011";
        $password = "gfso9907";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        /* Product to add */
        $ean = (int)$_REQUEST['ean'];
        $design = (string)$_REQUEST['design'];

        /* SQL Queries */
        $db->query("start transaction;");

        $sql = "UPDATE produto SET design = '$design' WHERE ean = $ean;";
        $db->query($sql);

        $db->query("commit;");

        /* Reset Connection */
        $db = null;

        /* Redirects to previous page */
        header('Location: products.php'); exit();

    } catch (PDOException $e) {
        $db->query("rollback;");
    	echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>