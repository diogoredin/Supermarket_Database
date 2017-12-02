<?php
	try {

		/* Database Connection */
		$host = "db.ist.utl.pt";
		$user = "ist426011";
		$password = "gfso9907";
		$dbname = $user;

		$db = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
		$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

		/* Product to list */
		$ean = $_REQUEST['ean'];

		/* SQL Queries */
		$db->query("start transaction;");
		
		$reposicao_sql = "SELECT nro, lado, altura, operador, instante, unidades FROM reposicao WHERE ean = $ean ORDER BY instante;";
		$reposicao = $db->query($reposicao_sql)->fetchAll();		
		
		$db->query("commit;");

		/* Reset Connection */
		$db = null;

	} catch (PDOException $e) {
		$db->query("rollback;");
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

			<!-- Product -->
			<?php echo("<h3>Eventos de Reposicao do produto {$ean}</h3>"); ?>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Numero</th>
						<th>Lado</th>
						<th>Altura</th>
						<th>Operador</th>
						<th>Instante</th>
						<th>Unidades</th>
					</tr>
				</thead>

				<tbody>
					<?php foreach($reposicao as $row) {
					echo("<tr>");
						echo("<td> {$row['nro']} </td>");
						echo("<td> {$row['lado']} </td>");
						echo("<td> {$row['altura']} </td>"); 
						echo("<td> {$row['operador']} </td>");
						echo("<td> {$row['instante']} </td>");  
						echo("<td> {$row['unidades']} </td>");                        
					echo("</tr>");             
					} ?>
					<tr>
				</tbody>
			</table>
		</div>
	</body>

</html>