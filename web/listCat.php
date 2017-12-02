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
			$cat_n = $cat['categoria'];
			$sql = "SELECT categoria FROM constituida WHERE super_categoria = '$cat_n';";
			$scats = array_merge($scats, $db->query($sql)->fetchAll());
		}
		
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

			<!-- Category -->
			<?php echo("<h3>Sub Categories of {$parentCat}</h3>"); ?>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Sub Categories</th>
					</tr>
				</thead>

				<tbody>
					<?php foreach($scats as $cat) {
					echo("<tr>");
						echo("<td> {$cat['categoria']} </td>");                         
					echo("</tr>");             
					} ?>
					<tr>
				</tbody>
			</table>
		</div>
	</body>

</html>