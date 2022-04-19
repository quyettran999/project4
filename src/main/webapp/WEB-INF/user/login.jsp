<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/formlogin.css">
    <title>Login</title>
</head>
<body>
    <div id="logreg-forms">
        <form action="/userlogin" class="form-signin" method="POST">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> Login</h1>
            <div class="social-login">
                <span id="error" class="texterror"><b><c:if test="${not empty message }">${message }</c:if></b></span>
                <c:if test="${not empty error}">
						<div class="alert alert-danger">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<strong>Error!</strong>
							<p style="color: #e70e0e;">
								<form:errors path="*"></form:errors>
								<br>${error }</p>
			
						</div>
				</c:if>
            </div>
            <input name="username" type="text" class="form-control" placeholder="Username" required="required" maxlength="50" autocomplete="off">
            <input name="password"type="password" class="form-control" placeholder="Password" required="required" maxlength="100" autocomplete="off">
            
            <button class="btn btn-success btn-block" type="submit"><i class="fa fa-sign-in-alt"></i> Login</button>
            
            <!-- <p>Don't have an account!</p>  -->
 
           	<hr>
            <a href="register" style="color: #dcedec;" class="btn btn-primary"><i class="fa fa-user-plus"></i> Register New Account</a>
            <a href="home"><i class="fa fa-angle-left"></i> Home</a>
            
    </div>
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="js/formlogin.js"></script>
</body>
</html>