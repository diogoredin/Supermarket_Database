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
		$produto_sql = "SELECT ean, design, categoria, fornecedor, instante FROM produto;";
		$produto = $db->query($produto_sql);

		$categoria_sql = "SELECT nome FROM categoria;";
		$categoria = $db->query($categoria_sql);

		$db = null;

	} catch (PDOException $e) {
		echo("<p>ERROR: {$e->getMessage()}</p>");
	}
?>

<!doctype html>
<html lang="en">

	<head>
		<title>DB Project - Produtos</title>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	</head>

	<body>
		<div class="container">

			<!-- Produto -->
			<h3>Produto</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>EAN</th>
						<th>Designacao</th>
						<th>Categoria</th>
						<th>Fornecedor</th>
						<th>Remove</th>
						<th>Update</th>
					</tr>
				</thead>

				<tbody>
					<?php foreach($produto as $row) {
					$delete = "removeProduct.php?ean={$row['ean']}";
					echo("<form action='changeProductDesignation.php' method='post'>");
					echo("<input type='hidden' name='ean' value={$row['ean']}/></td>");
					echo("<tr>");
						echo("<td> {$row['ean']} </td>");
						echo("<td> <input type='text' name='design' placeholder={$row['design']} /></td>");
						echo("<td> {$row['categoria']} </td>");
						echo("<td> {$row['fornecedor']} </td>");
						echo("<td><a href='$delete'>Remove</a></td>");
						echo("<td><input type='submit' value='Update'/></td>");                           
					echo("</tr>");
					echo("</form>");               
					} ?>
					<tr>
				</tbody>
			</table>
			
			<!-- Produto -->
			<h3>Adicionar Produto</h3>
			<form action="addProduct.php" method="post">
				<p>EAN (numero 13 digitos): <input type="text" name="ean"/></p>
				<p>Designacao: <input type="text" name="design" /></p>
				<p>
					<select name="categoria">
						<?php foreach($categoria as $row) {
							$cat = $row['nome'];
							echo("<option value='$cat'>$cat</option>");
						} ?>
					</select>
				</p>
				<p>NIF Fornecedor Primario: <input type="text" name="nif" /></p>
				<p>Nome Fornecedor Primario: <input type="text" name="nome" /></p>
				<p>NIF Fornecedor Secundario: <input type="text" name="nif_sec" /></p>
				<p>Nome Fornecedor Secundario: <input type="text" name="nome_sec" /></p>
				<p><input type="submit" value="Submit" /></p>
			</form>
		</div>
	</body>

</html>