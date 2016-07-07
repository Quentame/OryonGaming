<style type="text/css">
label.form-control {
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

input[type=checkbox]:checked + label {
	background-color: #d5d5d5 !important;
}

textarea {
	max-width: 100%;
	min-height: 200px;
}

form {
	position: relative;
}

.form-group .btn-warning {
	position: absolute;
	right: 0px;
}
</style>
<h1>Ajouter un jeux</h1>
<form action="./controller/gameController.php" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="createdby" value="1"/>

	<div class="form-group">
		<label for="gameName">Nom</label>
		<input type="text" class="form-control" name="game_name" id="gameName" required/>
	</div>

	<div class="form-group">
		<label for="gameDesc">Description</label>
		<textarea class="form-control" name="game_desc" id="gameDesc" required></textarea>
	</div>

	<div class="form-group col-xs-12 row">
		<label for="gameTypes">Type(s)</label>
		<div id="gameTypes">
			<?php
			$types = Db::select('gametype');
			foreach ($types as $key => $type) {
				echo '<div class="col-xs-6 col-sm-2"><input type="checkbox" name="types[]" value="'.$type['gametype_id'].'" id="'.$type['gametype_label'].'" class="hidden"/><label for="'.$type['gametype_label'].'" class="form-control">'.$type['gametype_label'].'</label></div>';
			}
			?>
		</div>
	</div>

	<div class="form-group col-xs-12 row">
		<label for="gamePlatforms">Plateforme(s)</label>
		<div id="gamePlatforms">
			<?php
			$platforms = Db::select('platform');
			foreach ($platforms as $key => $platform) {
				echo '<div class="col-xs-6 col-sm-2"><input type="checkbox" name="platforms[]" value="'.$platform['platform_id'].'" id="'.$platform['platform_name_short'].'" class="hidden"/><label for="'.$platform['platform_name_short'].'" class="form-control">'.$platform['platform_name_short'].'</label></div>';
			}
			?>
		</div>
	</div>

	<div class="form-group col-xs-12 row">
		<p>La gestion des médias (images et vidéos) arrivera dans un lot séparé.</p>
	</div>

	<div class="form-group text-center">
		<button type="submit" class="btn btn-primary btn-lg">Valider</button>
		<a href="./?page=gamelist" class="btn btn-warning">Annuler (Retour à la liste)</a>
	</div>
</form>

<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
<script>tinymce.init({ selector:'textarea' });</script>
