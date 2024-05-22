<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 5/20/2024
  Time: 8:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:url var="formUrl" value="/api/email"/>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/template/bootstrap.min.css' />"/>
    <script type="text/javascript" src="<c:url value="/template/jquery.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/template/bootstrap.min.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/ckeditor/ckeditor.js"/>"></script>

</head>
<body>
<div class="container">
    <h2>Gửi email cho khách hàng cũ</h2>
    <div class="form-group">
        <label for="email">Email:</label>
        <input type="text" class="form-control" id="email" name="email">
    </div>
    <div class="form-group">
        <label for="template">Template email:</label>
        <textarea class="form-control" rows="5" id="template" name="template"></textarea>
    </div>

    <button type="button" class="btn btn-primary" id="btnSendEmail">Send mail</button>
</div>
<script>
    var editor = '';
    $(document).ready(function () {
        // editor = CKEDITOR.replace('template');
    });

    $('#btnSendEmail').click(function (event) {
        event.preventDefault();
        var data = {};
        data["email"] = $("#email").val();
        data["template"] = $("#template").val();
        callAPI(data);
    });

    function callAPI(data) {
        $.ajax({
            url: '${formUrl}',
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (res) {
                console.log('success');
            },
            error: function (res) {
                console.log('failed');
            }
        });
    }


</script>
</body>
</html>
