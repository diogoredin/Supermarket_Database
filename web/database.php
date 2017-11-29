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
        $categoria = $db->query($categoria_sql);

        $categoria_simples_sql = "SELECT nome FROM categoria_simples;";
        $categoria_simples = $db->query($categoria_simples_sql);

        $super_categoria_sql = "SELECT nome FROM super_categoria;";
        $super_categoria = $db->query($super_categoria_sql);

        $constituida_sql = "SELECT super_categoria, categoria FROM constituida;";
        $constituida = $db->query($constituida_sql);

        $fornecedor_sql = "SELECT nif, nome FROM fornecedor;";
        $fornecedor = $db->query($fornecedor_sql);

        $produto_sql = "SELECT ean, design, categoria, fornecedor, instante FROM produto;";
        $produto = $db->query($produto_sql);

        $fornece_sec_sql = "SELECT nif, ean FROM fornece_sec;";
        $fornece_sec = $db->query($fornece_sec_sql);

        $corredor_sql = "SELECT nro, largura FROM corredor;";
        $corredor = $db->query($corredor_sql);

        $prateleira_sql = "SELECT nro, lado, altura FROM prateleira;";
        $prateleira = $db->query($prateleira_sql);

        $planograma_sql = "SELECT ean, nro, lado, altura, face, unidades, loc FROM planograma;";
        $planograma = $db->query($planograma_sql);

        $evento_reposicao_sql = "SELECT operador, instante FROM evento_reposicao;";
        $evento_reposicao = $db->query($evento_reposicao_sql);

        $reposicao_sql = "SELECT ean, nro, lado, altura, operador, instante, unidades FROM reposicao;";
        $reposicao = $db->query($reposicao_sql);

		$db = null;

    } catch (PDOException $e) {
    	echo("<p>ERROR: {$e->getMessage()}</p>");
    }
?>

<!doctype html>
<html lang="en">

	<head>
		<title>DB Project - All Tables</title>

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
							echo("<tr>");
								echo("<td> {$row['nome']} </td>");
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>

			</div>

			<div class="row">
				
				<div class="col-sm">
					<!-- Constituida -->
					<h3>Constituida</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Super Categoria</th>
								<th>Categoria</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($constituida as $row) {
							echo("<tr>");
								echo("<td> {$row['super_categoria']} </td>");
								echo("<td> {$row['categoria']} </td>");				
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm">
					<!-- Fornecedor -->
					<h3>Fornecedor</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>NIF</th>
								<th>Nome</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($fornecedor as $row) {
							echo("<tr>");
								echo("<td> {$row['nif']} </td>");
								echo("<td> {$row['nome']} </td>");				
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm">
					<!-- Fornecedor Secundario -->
					<h3>Fornecedor Secundario</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>NIF</th>
								<th>EAN</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($fornece_sec as $row) {
							echo("<tr>");
								echo("<td> {$row['nif']} </td>");
								echo("<td> {$row['ean']} </td>");				
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
			
			</div>

			<div class="row">

				<div class="col-sm">
					<!-- Corredor -->
					<h3>Corredor</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Nro.</th>
								<th>Largura</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($corredor as $row) {
							echo("<tr>");
								echo("<td> {$row['nro']} </td>");
								echo("<td> {$row['largura']} </td>");					
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm">
					<!-- Prateleira -->
					<h3>Prateleira</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Nro.</th>
								<th>Lado</th>
								<th>Altura</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($prateleira as $row) {
							echo("<tr>");
								echo("<td> {$row['nro']} </td>");
								echo("<td> {$row['lado']} </td>");
								echo("<td> {$row['altura']} </td>");	
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>

				<div class="col-sm">
					<!-- Planograma -->
					<h3>Planograma</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>EAN</th>
								<th>Nro.</th>
								<th>Lado</th>
								<th>Altura</th>
								<th>Face</th>
								<th>Unidades</th>
								<th>Localizacao</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($planograma as $row) {
							echo("<tr>");
								echo("<td> {$row['ean']} </td>");
								echo("<td> {$row['nro']} </td>");
								echo("<td> {$row['lado']} </td>");
								echo("<td> {$row['altura']} </td>");	
								echo("<td> {$row['face']} </td>");
								echo("<td> {$row['unidades']} </td>");	
								echo("<td> {$row['loc']} </td>");				
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>
			
			</div>

			<div class="row">

				<div class="col-sm">
					<!-- Evento Reposicao -->
					<h3>Evento Reposicao</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Operador</th>
								<th>Instante</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($evento_reposicao as $row) {
							echo("<tr>");
								echo("<td> {$row['operador']} </td>");
								echo("<td> {$row['instante']} </td>");				
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>

				<div class="col-sm">
					<!-- Evento Reposicao -->
					<h3>Reposicao</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>EAN</th>
								<th>Nro.</th>
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
								echo("<td> {$row['ean']} </td>");
								echo("<td> {$row['nro']} </td>");
								echo("<td> {$row['lado']} </td>");
								echo("<td> {$row['altura']} </td>");	
								echo("<td> {$row['operador']} </td>");	
								echo("<td> {$row['instante']} </td>");
								echo("<td> {$row['unidades']} </td>");					
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>

				<div class="col-sm">
					<!-- Produto -->
					<h3>Produto</h3>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>EAN</th>
								<th>Designacao</th>
								<th>Categoria</th>
								<th>Fornecedor</th>
								<th>Instante</th>
							</tr>
						</thead>

						<tbody>
							<?php foreach($produto as $row) {
							echo("<tr>");
								echo("<td> {$row['ean']} </td>");
								echo("<td> {$row['design']} </td>");
								echo("<td> {$row['categoria']} </td>");
								echo("<td> {$row['fornecedor']} </td>");
								echo("<td> {$row['instante']} </td>");			
							echo("</tr>");
							} ?>
						</tbody>
					</table>
				</div>

			</div>

		</div>
    </body>
</html>