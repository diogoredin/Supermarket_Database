<?php
	try {

		/* Database Connection */
		$host = "db.ist.utl.pt";
		$user = "ist426011";
		$password = "gfso9907";
		$dbname = $user;

		$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
		$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		/* SQL Queries */
		$categoria_sql = "SELECT nome FROM categoria;";
		$categoria = $db->query($categoria_sql)->fetchAll();

		$categoria_simples_sql = "SELECT nome FROM categoria_simples; ";
		$categoria_simples = $db->query($categoria_simples_sql);

		$super_categoria_sql = "SELECT nome FROM super_categoria;";
		$super_categoria = $db->query($super_categoria_sql);

		$constituida_sql = "SELECT super_categoria, categoria FROM constituida;";
		$constituida = $db->query($constituida_sql);
		$db = null;

	} catch (PDOException $e) {
		echo("<p>ERROR: {$e->getMessage()}</p>");
	}
?>

<!doctype html>
<html lang="en">

	<head>
		<title>DB Project - Categorias</title>
		
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	</head>

	
	<body>
		<div class="container">
			<div class="row">
				<div class="col-sm">
					<!-- Categoria -->
					<h3>Categoria</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Nome</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($categoria as $row) {
							echo("<tr>");
								echo("<td> {$row['nome']} </td>");
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm">
					<!-- Categoria Simples -->
					<h3>Categoria Simples</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Nome</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($categoria_simples as $row) {
							echo("<tr>");
								echo("<td> {$row['nome']} </td>");
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm">
					<!-- Super Categoria -->
					<h3>Super Categoria</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Nome</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($super_categoria as $row) {
							$listCat = "listCat.php?cat={$row['nome']}";
							echo("<tr>");
								echo("<td> {$row['nome']} <a href='$listCat'>List sub-categories</a></td>");
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
			</div>
		
			<!-- Adicionar Categoria -->
			<h3>Adicionar Categoria</h3>
			<form action="addCategory.php" method="post">
				<p>Nome : <input type="text" name="nome"/></p>
				<p>
					<select name="supernome">
						<?php echo(count($categoria));
						foreach($categoria as $row) {
							$cat = $row['nome'];
							echo("<option value='$cat'>$cat</option>");
						} ?>
					</select>
				</p>
				<p><input type="submit" value="Submit" /></p>
			</form>
		</div>
	</body>
</html>						
