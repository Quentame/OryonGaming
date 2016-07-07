<?php
require_once('../config.php');
?>
<!DOCTYPE html>
<html lang="fr">
<head>
	<!-- META -->
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

	<title>OryonGaming</title>
	
	<!-- FAVICON -->
	<link rel="shortcut icon" href="../assets/img/favicon.ico"/>
	
	<!-- CORE CSS -->
	<link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="../assets/css/style.css" rel="stylesheet"/>
	<link href="../assets/css/helpers.css" rel="stylesheet"/>
	
	<!-- PLUGINS -->
	<link href="../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	<link href="../assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet"/>
	<link href="../assets/plugins/animate/animate.min.css" rel="stylesheet"/>
	<link href="../assets/plugins/animate/animate.delay.css" rel="stylesheet"/>
</head>
<?php
$page = 'gamelist';
if (!empty($_GET['page'])) {
	$page = $_GET['page'];
}
?>
<body class="header-fixed">
	<div class="container">
		<?php
		require_once('view/'.$page.'.php');
		?>
	</div>
	
	<!-- Javascript -->
	<script src="../assets/plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>