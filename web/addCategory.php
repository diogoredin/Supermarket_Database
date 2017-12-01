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

		/* Category to add */
		$nome = (string)$_REQUEST['nome'];
		$supernome = (string)$_REQUEST['supernome'];

		/* SQL Queries */
		$db->query("start transaction;");

		$categoria_sql = "INSERT INTO categoria VALUES ('$nome');";
		$categoria = $db->query($categoria_sql);
		
		$categoria_simples_sql = "INSERT INTO categoria_simples VALUES ('$nome');";
		$categoria_simples = $db->query($categoria_simples_sql);
		
		if ($supernome != "(Nenhuma)") {
			$categoria_simples_sql = "DELETE FROM categoria_simples WHERE nome = '$supernome';";
			$categoria_simples = $db->query($categoria_simples_sql);

			$super_categoria_count_sql = "SELECT 'nome' FROM super_categoria WHERE nome = '$supernome';";
			$super_categoria_count = $db->query($super_categoria_count_sql);
		
			if (count($super_categoria_count->fetchAll()) == 0) {
				$super_categoria_sql = "INSERT INTO super_categoria VALUES ('$supernome');";
				$super_categoria = $db->query($super_categoria_sql);
			}
		
			$constituida_sql = "INSERT INTO constituida VALUES ('$supernome','$nome');";
			$constituida = $db->query($constituida_sql);
		}

		$db->query("commit;");

		/* Reset Connection */
		$db = null;

		/* Redirects to previous page */
		header('Location: categories.php'); exit();

	} catch (PDOException $e) {
		$db->query("rollback;");
		echo("<p>ERROR: {$e->getMessage()}</p>");
	}
?>