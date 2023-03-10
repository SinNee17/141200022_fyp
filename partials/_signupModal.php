<div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModal" aria-hidden="true">

  <div class="modal-dialog" role="document">
    <div class="modal-content">

      <div class="modal-header" style="background-color:#fdffcd; font-family:Franklin Gothic Medium;">
          <h5 class="modal-title" id="signupModal">Sign Up</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
      </div>

      <div class="modal-body">
          <form action="partials/_handleSignup.php" method="post">
            <div class="form-group" style="font-family:Century Gothic;">
              <b><label for="username">Username:</label></b>
              <input class="form-control" id="username" name="username" placeholder="Enter a username" type="text" required minlength="3" maxlength="11">
            </div>


            <div class="form-group" style="font-family:Century Gothic;">
              <b><label for="firstName">First Name:</label></b>
              <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name" required>
            </div>

            <div class="form-group" style="font-family:Century Gothic;">
              <b><label for="lastName">Last Name:</label></b>
              <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name" required>
 
      </div>

      <div class="form-group" style="font-family:Century Gothic;">
          <b><label for="email">Email:</label></b>
          <input type="email" class="form-control" id="email" name="email" placeholder="Enter a email" required>
      </div>

      <div class="form-group" style="font-family:Century Gothic;">
          <b><label for="phone">Phone No:</label></b>

            <div class="input-group mb-3">
                <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter a phone number" maxlength="10">
            </div>

      </div>

      <div class="text-left my-2" style="font-family:Century Gothic;">
          <b><label for="password">Password:</label></b>
              <input class="form-control" id="password" name="password" placeholder="Enter a password" type="password" required  minlength="4" maxlength="21">
      </div>

      <div class="text-left my-2" style="font-family:Century Gothic;">
          <b><label for="password1">Renter Password:</label></b>
              <input class="form-control" id="cpassword" name="cpassword" placeholder="Renter password" type="password" required  minlength="4" maxlength="21">
      </div>

              <br>

              <button type="submit" class="btn btn-success">Submit</button>
            </form>

            <br>

          </div>
        </div>
      </div>
    </div>
