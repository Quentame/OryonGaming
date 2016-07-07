<?php
require_once('../../config.php');
if (!empty($_POST['createdby']) && empty($_POST['updateby'])) {
	$gameId = Db::insert('game', array('game_name' => $_POST['game_name'], 'game_description' => $_POST['game_desc']));
	foreach ($_POST['types'] as $key => $typeId) {
		Db::insert('game_type', array('game_id' => $gameId, 'type_id' => $typeId));
	}
	foreach ($_POST['platforms'] as $key => $platformId) {
		Db::insert('game_platform', array('game_id' => $gameId, 'platform_id' => $platformId));
	}
	header("Location:../?page=gamelist");
}
?>