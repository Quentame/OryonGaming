
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Vertical (basic) form</h2>
  <form role="form">
   <div class="form-group">
      <label for="Name">Name:</label>
      <input type="Name" class="form-control" id="Name" placeholder="Enter Name">
    </div>
   <div class="form-group">
      <label for="Surname">Surname:</label>
      <input type="Surname" class="form-control" id="Surname" placeholder="Enter Surname">
    </div>
    <div class="form-group">
      <label for="login">Login:</label>
      <input type="login" class="form-control" id="Login" placeholder="Enter Login">
    </div>
 <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="Email" placeholder="Enter Email">
    </div>
 <div class="form-group">
      <label for="email">Confirm Email:</label>
      <input type="email" class="form-control" id="Emailconfirm" placeholder="confirm Email">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter Password">
    </div>
   <div class="form-group">
      <label for="pwd">Confirm Password:</label>
      <input type="password" class="form-control" id="pwdconfirm" placeholder="confirm Password">
   </div>
<div>
 <p> Etes-vous Gamer?</p>
</div>
   <div>
 <label class="radio-inline"><input type="radio" name="optradio">Yes</label>
<label class="radio-inline"><input type="radio" name="optradio">No</label>
   </div>
   <div>
     <button type="submit" class="btn btn-default">Submit</button>
     <button type="cancel" class="btn btn-default">Cancel</button>
  </form>
</div>

</body>
</html>