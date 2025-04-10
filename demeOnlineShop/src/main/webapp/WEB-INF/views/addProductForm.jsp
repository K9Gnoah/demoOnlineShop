<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/22/2024
  Time: 8:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Add Product</title>

</head>
<body>
<form class="form-horizontal">
    <fieldset>

        <!-- Form Name -->
        <legend>PRODUCTS</legend>


        <div class="form-group">
            <label class="col-md-4 control-label" for="product_name">PRODUCT NAME</label>
            <div class="col-md-4">
                <input id="product_name" name="product_name" placeholder="PRODUCT NAME" class="form-control input-md" required="" type="text">
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="product_description">PRODUCT DESCRIPTION</label>
            <div class="col-md-4">
                <textarea class="form-control" id="product_description" name="product_description"></textarea>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="product_price">PRICE</label>
            <div class="col-md-4">
                <input id="product_price" name="product_price" placeholder="PRICE" class="form-control input-md" required="" type="number" min="0">
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="product_image">main_image</label>
            <div class="col-md-4">
                <input id="product_image" name="product_image" class="input-file" type="file">
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="product_status">STATUS</label>
            <div class="col-md-4">
                <select id="product_status" name="product_status" class="form-control">
                    <option>Appear</option>
                    <option>Hide</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>
            <div class="col-md-4">
                <input id="available_quantity" name="available_quantity" placeholder="AVAILABLE QUANTITY" class="form-control input-md" required="" type="number" min="0">
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="product_categorie">PRODUCT CATEGORY</label>
            <div class="col-md-4">
                <select id="product_categorie" name="product_categorie" class="form-control">
                    <option>Trái cây nhập khẩu</option>
                    <option>Trái cây nội địa</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-5 control-label" for="uploadbutton"></label>
            <div class="col-md-7">
                <button id="uploadbutton" name="uploadbutton" class="btn btn-primary">UPLOAD PRODUCT</button>
            </div>
        </div>

    </fieldset>
</form>


<script type="text/javascript">
    $(document).ready(function(){
        $("#uploadbutton").click(function(event){
            event.preventDefault();

            var formData = {
                productName: $("#product_name").val(),
                productDescription: $("#product_description").val(),
                productPrice: parseFloat($("#product_price").val()),
                productImage: $("#product_image").val(), // Lưu ý: File uploads cần xử lý khác
                productStatus: $("#product_status").val() === "Appear",
                productQuantity: parseInt($("#available_quantity").val()),
                categoryId: $("#product_categorie").val() === "Trái cây nhập khẩu" ? 1 : 2
            };

            $.ajax({
                url: "/api/products",  // URL của API
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function(result){
                    alert(result);
                    location.replace("/productList")
                },
                error: function(e){
                    console.log(e);
                    alert("Error: " + e.responseText);
                }
            });
        });
    });
</script>
</body>
</html>
