<?php

session_start();
echo "Logging out.";
unset($_SESSION["loggedin"]);
unset($_SESSION["username"]);
unset($_SESSION["userId"]);


header("location: /OnlineFoodOrdering/index.php");
?>