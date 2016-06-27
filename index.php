<?php
require_once('config.php');
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
	<link rel="shortcut icon" href="assets/img/favicon.ico"/>
	
	<!-- CORE CSS -->
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="assets/css/style.css" rel="stylesheet"/>
	<link href="assets/css/helpers.css" rel="stylesheet"/>
	
	<!-- PLUGINS -->
	<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
	<link href="assets/plugins/ionicons/css/ionicons.min.css" rel="stylesheet"/>
	<link href="assets/plugins/animate/animate.min.css" rel="stylesheet"/>
	<link href="assets/plugins/animate/animate.delay.css" rel="stylesheet"/>
	<link href="assets/plugins/owl-carousel/owl.carousel.css" rel="stylesheet"/>
</head>

<body class="header-fixed">
	<?php
	require_once('view/header.php');
	require_once('view/home.php');
	require_once('view/footer.php');
	require_once('view/signin.php');
	?>
	
	<!-- Javascript -->
	<script src="assets/plugins/jquery/jquery-1.11.1.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/plugins/core.js"></script>
	<script src="assets/plugins/owl-carousel/owl.carousel.min.js"></script>
	<script>
	(function($) {
	"use strict";
		var owl = $(".owl-carousel");
			 
		owl.owlCarousel({
			items : 4, //4 items above 1000px browser width
			itemsDesktop : [1000,3], //3 items between 1000px and 0
			itemsTablet: [600,1], //1 items between 600 and 0
			itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
		});
			 
		$(".next").click(function(){
			owl.trigger('owl.next');
			return false;
		})
		$(".prev").click(function(){
			owl.trigger('owl.prev');
			return false;
		})
	})(jQuery);
	</script>
</body>
</html>