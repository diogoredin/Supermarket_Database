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
		$parentCat = (string)$_REQUEST['cat'];

		/* SQL Queries */
		$db->query("start transaction;");

		
		$sql = "SELECT categoria FROM constituida WHERE super_categoria = '$parentCat';";
		$scats = $db->query($sql)->fetchAll();

		foreach($scats as $cat) {
			echo("<p>{$cat['categoria']}</p>");
			$sql = "SELECT categoria FROM constituida WHERE super_categoria = '$cat';";
			$scats = array_merge($scats, $db->query($sql)->fetchAll());
		}
		
		$db->query("commit;");

		/* Reset Connection */
		$db = null;

		/* Redirects to previous page */

	} catch (PDOException $e) {
		$db->query("rollback;");
		echo("<p>ERROR: {$e->getMessage()}</p>");
	}
?>