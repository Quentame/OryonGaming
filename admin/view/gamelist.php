<style type="text/css">
h1 a {
	float: right;
}
ol {
	padding: 0px;
	background-color: lightgrey;
}
ol li:nth-child(2n) {
	background-color: darkgrey;
}
ol li {
	list-style-position: inside;
	padding: 10px;
}
</style>
<h1>Liste des jeux <a href="./?page=game" class="btn btn-primary">Ajouter un jeux</a></h1>
<?php
$games = Db::select('game');
if (empty($games)) {
	echo '<h2>Aucun jeux</h2>';
} else {
	echo '<ol>';
	foreach ($games as $key => $game) {
		echo '<li>'.$game['game_name'].'</li>';
	}
	echo '</ol>';
}
?>
