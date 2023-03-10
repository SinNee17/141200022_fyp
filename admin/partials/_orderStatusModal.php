<style>
table, th, td {
  border: 1px solid;
}
</style>

<?php 
    $itemModalSql = "SELECT * FROM `orders`";
    $itemModalResult = mysqli_query($conn, $itemModalSql);
    while($itemModalRow = mysqli_fetch_assoc($itemModalResult)){
        $orderid = $itemModalRow['orderId'];
        $userid = $itemModalRow['userId'];
        $orderStatus = $itemModalRow['orderStatus'];
?>

<div class="modal fade" id="orderStatus<?php echo $orderid; ?>" tabindex="-1" role="dialog" aria-labelledby="orderStatus<?php echo $orderid; ?>" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color:#ffebbb;">
        <h5 class="modal-title" id="orderStatus<?php echo $orderid; ?>">Order Status and Delivery Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="partials/_orderManage.php" method="post" style="border-bottom: 2px solid #dee2e6;">
            <div class="text-left my-2">    
                <b><label for="name">Order Status</label></b>

                <table>
                <tr>
                    <th>No.</th>
                    <th>Status type</th>
                </tr>
                <tr>
                    <td>0</td>
                    <td>Order Placed</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Order Confirmed</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Preparing Order</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Order on the way</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>Order Delivered</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Order Denied</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>Order Cancelled</td>
                </tr>
                </table>
                <br>

                <div class="row mx-2">
                <input class="form-control col-md-3" id="status" name="status" value="<?php echo $orderStatus; ?>" type="number" min="0" max="6" required>    

                </div>
            </div>
            <input type="hidden" id="orderId" name="orderId" value="<?php echo $orderid; ?>">
            <button type="submit" class="btn btn-success mb-2" name="updateStatus" style="background-color:#668ba4; color:white; border:#668ba4;">Update</button>
        </form>
        <?php 
            $deliveryDetailSql = "SELECT * FROM `deliverydetails` WHERE `orderId`= $orderid";
            $deliveryDetailResult = mysqli_query($conn, $deliveryDetailSql);
            $deliveryDetailRow = mysqli_fetch_assoc($deliveryDetailResult);
            if($orderStatus>0 && $orderStatus<5) { 
        ?>
            
        <?php } ?>
      </div>
    </div>
  </div>
</div>

<?php
    }
?>

<style>
    .popover {
        top: -77px !important;
    }
</style>

<script>
    $(function () {
        $('[data-toggle="popover"]').popover();
    });
</script>