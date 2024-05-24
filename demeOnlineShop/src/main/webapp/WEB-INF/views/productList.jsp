<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/21/2024
  Time: 8:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Product List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<table class="table table-bordered table-hover">
    <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Image</th>
            <th>Status</th>
            <th>Quantity</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="i" items="${listProduct.content}">
            <tr>
                <td>${i.productID}</td>
                <td>${i.productName}</td>
                <td>${i.productDescription}</td>
                <td>${i.productPrice}</td>
                <td>${i.productImage}</td>
                <td>${i.productStatus}</td>
                <td>${i.productQuantity}</td>
                <td>${i.categoryId}</td>
                <td>
                    <button class="btn btn-primary" style="background-color: white"><a href="/updateProduct/${i.productID}">Update</a></button>
                    <br><br>
                    <button class="deleteproduct btn btn-primary" data-id="${i.productID}">DELETE</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>

</table>
    <div>
        <c:if test="${listProduct.hasPrevious()}">
            <a href="?page=${listProduct.number - 1}&size=${listProduct.size}">Previous</a>
        </c:if>
        Page ${listProduct.number + 1} of ${listProduct.totalPages}
        <c:if test="${listProduct.hasNext()}">
            <a href="?page=${listProduct.number + 1}&size=${listProduct.size}">Next</a>
        </c:if>
    </div>
    <div>
        <c:forEach begin="1" end="${listProduct.totalPages}" var="i">
            <a href="?page=${i - 1}&size=${listProduct.size}">${i}</a>
        </c:forEach>
    </div>

<a href="/addProductForm">Add product</a>
    <script type="text/javascript">
        $(document).ready(function(){
            $(".deleteproduct").click(function(event){
                event.preventDefault();

                var productId = $(this).data("id");
                // Hiển thị hộp thoại xác nhận
                var confirmation = confirm("Are you sure you want to delete this product?");
                if (confirmation) {
                    // Người dùng chọn Yes, thực hiện xóa sản phẩm
                    $.ajax({
                        url: "/api/products/" + productId,  // URL của API
                        type: "DELETE",
                        success: function(result){
                            alert(result);
                            location.reload();  // Reload lại trang sau khi xóa thành công
                        },
                        error: function(e){
                            console.log(e);
                            alert("Error: " + e.responseText);
                        }
                    });
                } else {
                    // Người dùng chọn No, hủy bỏ hành động xóa
                    alert("Delete action was cancelled.");
                }

            });
        });
    </script>
</div>
</body>
</html>
