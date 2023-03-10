<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="checkoutModal">Enter Your Details:</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <form action="partials/_manageCart.php" method="post">
                <div class="form-group">
                    <b><label for="address">Address:</label></b>
                    <input class="form-control" id="address" name="address" placeholder="Enter Address" type="text" required minlength="3" maxlength="500">
                </div>
                <div class="form-group">
                    <b><label for="address1">Address:</label></b>
                    <input class="form-control" id="address1" name="address1" placeholder="Enter Address" type="text">
                </div>
                    <div class="form-group">
                        <b><label for="phone">Phone No:</label></b>
                        <div class="input-group mb-3">
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter Your Phone Number" maxlength="10">
                        </div>
                    </div>
                   <div class="form-group">
                        <b><label for="zipcode">Post Code:</label></b>
                        <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="Enter Your Post Code">                    
                    </div>

                <div class="form-group">
                    <b><label for="password">Password:</label></b>    
                    <input class="form-control" id="password" name="password" placeholder="Enter Password" type="password" required minlength="4" maxlength="21">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <input type="hidden" name="amount" value="<?php echo $totalPrice ?>">
                    <button type="submit" name="checkout" class="btn btn-success">Order</button>
                </div>
            </form>
        </div>
        </div>
    </div>
</div>