<style>
table, th, td {
  border: 1px solid;
}

table             { 
  border-spacing: 1; 
  border-collapse: collapse; 
  background:#faf5e4;
  color: #7fa99b;
  border-radius:6px;
  overflow:hidden;
  max-width:800px; 
  width:100%;
  margin:0 auto;
  position:relative;
  
}
</style>

<h1 style="margin-top:98px; font-family:Century Gothic; margin-left:200px;">Welcome <b><?php echo $_SESSION['adminusername']; ?></b> to admin dashboard!</h1>

<br>

<h3><strong style="margin-left:200px; font-family:Century Gothic; color: #347474;">Restaurent Opening Hours</strong></h3>

<br>

<table style="margin-left:200px; font-family:Century Gothic; font-size: 20px;">

  <tr>
    <td>&nbsp;Monday to Friday&nbsp;</td>
    <td>&nbsp;10am to 9pm (Last order 8pm)&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;Saturday and PH&nbsp;</td>
    <td>&nbsp;11am to 9pm (Last order 8pm)&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;Sunday&nbsp;</td>
    <td>&nbsp;Close&nbsp;</td>
  </tr>
</table>




