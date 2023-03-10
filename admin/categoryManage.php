<div class="container-fluid" style="margin-top:98px; font-family:Century Gothic;">
 
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-10">
                <form action="partials/_categoryManage.php" method="post" enctype="multipart/form-data">
                    <div class="card">
                        <div class="card-header" style="background-color: #ffebbb;">
                           <strong> Create New Category</strong>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label class="control-label">Category Name: </label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label class="control-label">Category Desc: </label>
                                <input type="text" class="form-control" name="desc" required>
                            </div> 
                            <div class="form-group">
                                <label for="image" class="control-label">Image</label>
                                <input type="file" name="image" id="image" accept=".jpg" class="form-control" required style="border:none;">
                            </div>  
                        </div>  
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="submit" name="createCategory" class="btn btn-sm btn-primary" style="background-color: #5585b5; border:#5585b5;"> Create </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-1">
            </div>


            <div class="col-md-1">
            </div>
            <div class="col-md-10" style="margin-top: 20px;">
                <div class="card">
                    <div class="card-body">
                    <table class="table table-bordered table-hover mb-0">
                        <thead style="background-color: #ffebbb">
                        <tr>
                            <th class="text-center">Image</th>
                            <th class="text-center" style="width:58%;">Category Detail</th>
                            <th class="text-center" style="width:18%;">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php 
                            $sql = "SELECT * FROM `categories`"; 
                            $result = mysqli_query($conn, $sql);
                            while($row = mysqli_fetch_assoc($result)){
                                $catId = $row['categorieId'];
                                $catName = $row['categorieName'];
                                $catDesc = $row['categorieDesc'];

                                echo '<tr>
                                        <td><img src="/OnlineFoodOrdering/img/card-'.$catId. '.jpg" alt="image for this Category" width="150px" height="150px"></td>
                                        <td>
                                            <p>Name : <b>' .$catName. '</b></p>
                                            <p>Description : <b class="truncate">' .$catDesc. '</b></p>
                                        </td>
                                        <td class="text-center">
                                            <div class="row mx-auto" style="width:112px">
                                            <button class="btn btn-sm btn-primary edit_cat" type="button" data-toggle="modal"  style="background-color: #5585b5; border:#5585b5;" data-target="#updateCat' .$catId. '">Edit</button>
                                            <form action="partials/_categoryManage.php" method="POST">
                                                <button name="removeCategory" class="btn btn-sm btn-danger" style="margin-left: 5px;background-color: #f83e4b; border: #f83e4b;">Delete</button>
                                                <input type="hidden" name="catId" value="'.$catId. '">
                                            </form></div>
                                        </td>
                                    </tr>';
                            }
                        ?> 
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>

        </div>
      
</div>


<?php 
    $catsql = "SELECT * FROM `categories`";
    $catResult = mysqli_query($conn, $catsql);
    while($catRow = mysqli_fetch_assoc($catResult)){
        $catId = $catRow['categorieId'];
        $catName = $catRow['categorieName'];
        $catDesc = $catRow['categorieDesc'];
?>


<div class="modal fade" id="updateCat<?php echo $catId; ?>" tabindex="-1" role="dialog" aria-labelledby="updateCat<?php echo $catId; ?>" aria-hidden="true" style="width: -webkit-fill-available;">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ffebbb;">
        <h5>Edit Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="partials/_categoryManage.php" method="post" enctype="multipart/form-data">
            <div class="text-left my-2 row" style="border-bottom: 2px solid #dee2e6;">
                <div class="form-group col-md-8">
                    <b><label for="image">Image</label></b>
                    <input type="file" name="catimage" id="catimage" accept=".jpg" class="form-control" required style="border:none;" onchange="document.getElementById('itemPhoto').src = window.URL.createObjectURL(this.files[0])">
                    <small id="Info" class="form-text text-muted mx-3">Please .jpg file upload.</small>
                    <input type="hidden" id="catId" name="catId" value="<?php echo $catId; ?>">
                    <button type="submit" class="btn btn-success my-1" name="updateCatPhoto" style="background-color: #5585b5; border:#5585b5;">Update Image</button>
                </div>
            </div>
        </form>
        <form action="partials/_categoryManage.php" method="post">
            <div class="text-left my-2">
                <b><label for="name">Name</label></b>
                <input class="form-control" id="name" name="name" value="<?php echo $catName; ?>" type="text" required>
            </div>
            <div class="text-left my-2">
                <b><label for="desc">Description</label></b>
                <textarea class="form-control" id="desc" name="desc" rows="2" required minlength="6"><?php echo $catDesc; ?></textarea>
            </div>
            <input type="hidden" id="catId" name="catId" value="<?php echo $catId; ?>">
            <button type="submit" class="btn btn-success" name="updateCategory" style="background-color: #5585b5; border:#5585b5;">Update</button>
        </form>
      </div>
    </div>
  </div>
</div>

<?php
    }
?>