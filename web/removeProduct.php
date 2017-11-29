<?php
    try {

        /* Database Connection */
        $host = "db.ist.utl.pt";
        $user = "ist426011";
        $password = "gfso9907";
        $dbname = $user;

        $db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        /* Product to remove */
        $ean = $_REQUEST['ean'];

        /* SQL Queries */
        $db->query("start transaction;");

        $reposicao_sql = "DELETE FROM reposicao WHERE ean = $ean;";
        $resposicao = $db->query($reposicao_sql);

        $planograma_sql = "DELETE FROM planograma WHERE ean = $ean;";
        $planograma = $db->query($planograma_sql);

        $fornece_sec_sql = "DELETE FROM fornece_sec WHERE ean = $ean;";
        $fornece_sec = $db->query($fornece_sec_sql);

        $produto_sql = "DELETE FROM produto WHERE ean = $ean;";
        $produto = $db->query($produto_sql);            

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