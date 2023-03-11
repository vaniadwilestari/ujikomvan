<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>laundry login</title>
</head>
<body>
  <form action="cek_login.php" method="post">
                    <?php if (isset($_GET['message'])) : ?>
                                <?= $_GET['message']; ?>
                            
                    <?php endif ?>
    <div class="login-box">
        <h2> Vann Laundry</h2>
        <form>
          <div class="user-box">
            <input type="text" name="username" required="">
            <label>Username</label>
          </div>
          <div class="user-box">
            <input type="password" name="password" required="">
            <label>Password</label>
          </div>
          <button class="button" type="submit">
                            Login</button>
          
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            
          </a>
        </form>
      </div>
</body>
</html>