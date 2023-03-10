<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header" style="background-color:#fdffcd; font-family:Franklin Gothic Medium;">
            <h5 class="modal-title" id="loginModal">Login</h5>

            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>

          </div>

          <div class="modal-body">

            <form action="partials/_handleLogin.php" method="post">

              <div class="text-left my-2" style="font-family:Century Gothic;">
                  <b><label for="username">Username</label></b>
                  <input class="form-control" id="loginusername" name="loginusername" placeholder="Enter your username" type="text" required>
              </div>

              <div class="text-left my-2"style="font-family:Century Gothic;">
                  <b><label for="password">Password</label></b>
                  <input class="form-control" id="loginpassword" name="loginpassword" placeholder="Enter your password" type="password">
              </div>

              <br>

              <button type="submit" class="btn btn-success">Submit</button>

            </form>
          </div>
        </div>
      </div>
    </div>

