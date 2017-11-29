<?php
    try {
        /* Date of creation */
        $date = date('Y-m-d G:i:s');

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
        $categoria = (string)$_REQUEST['categoria'];

        /* Fornecedor */
        $nif = (int)$_REQUEST['nif'];
        $nome = (string)$_REQUEST['nome'];

        /* Fornecedor Secundario */
        $nif_sec = (int)$_REQUEST['nif_sec'];
        $nome_sec = (string)$_REQUEST['nome_sec'];

        echo($nif);
        /* SQL Queries */
        $db->query("start transaction;");

        $fornecedor_1_sql = "INSERT INTO fornecedor VALUES ($nif,'$nome');";
        $fornecedor_1 = $db->query($fornecedor_1_sql);

        $fornecedor_2_sql = "INSERT INTO fornecedor VALUES ($nif_sec,'$nome_sec');";
        $fornecedor_2 = $db->query($fornecedor_2_sql);

        $produto_sql = "INSERT INTO produto VALUES ($ean,'$design','$categoria',$nif,'$date');";
        $produto = $db->query($produto_sql);

        $fornecedor_sec_sql = "INSERT INTO fornece_sec VALUES ($nif_sec,$ean);";
        $fornecedor_sec = $db->query($fornecedor_sec_sql);

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