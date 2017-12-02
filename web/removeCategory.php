<?php
	try {

		/* Database Connection */
		$host = "db.ist.utl.pt";
		$user = "ist426011";
		$password = "gfso9907";
		$dbname = $user;

		$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
		$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		/* Category to remove */
		$nome = $_REQUEST['nome'];

		/* SQL Queries */
		$db->query("start transaction;");
		
		
		$check_supercategoria_sql = "SELECT super_categoria FROM constituida WHERE categoria = '$nome';";
		$check_supercategoria = $db->query($check_supercategoria_sql)->fetchAll();
		
		// Checks if the category is a sub-category
		if (count($check_supercategoria) != 0) {
			$supercategoria_nome = $check_supercategoria[0][super_categoria];
			
			$check_constituida_sql = "SELECT categoria FROM constituida WHERE super_categoria = '$supercategoria_nome';";
			$check_constituida = $db->query($check_constituida_sql)->fetchAll();
		}
		
		$constituida_sql = "DELETE FROM constituida WHERE categoria = '$nome' OR super_categoria = '$nome';";
		$constituida = $db->query($constituida_sql);
		
		$categoria_simples_sql = "DELETE FROM categoria_simples WHERE nome = '$nome';";
		$categoria_simples = $db->query($categoria_simples_sql);
		
		$super_categoria_sql = "DELETE FROM super_categoria WHERE nome = '$nome';";
		$super_categoria = $db->query($super_categoria_sql)->fetchAll();
		
		// If the removed category is a sub-category, and its super-category no longer has sub-categories, it becomes a simple category.
		if (count($check_constituida) == 1) {
			$rem_super_categoria_sql = "DELETE FROM super_categoria WHERE nome = '$supercategoria_nome';";
			$rem_super_categoria = $db->query($rem_super_categoria_sql);
			
			$add_categoria_simples_sql = "INSERT INTO categoria_simples VALUES ('$supercategoria_nome');";
			$add_categoria_simples = $db->query($add_categoria_simples_sql);
		}
		
		$categoria_sql = "DELETE FROM categoria WHERE nome = '$nome';";
		$categoria = $db->query($categoria_sql);

		
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