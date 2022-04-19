<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/formlogin.css">
    <title>Register</title>
</head>
<body>
    <div id="logreg-forms">
    	<div class="social-login">
                <form:form modelAttribute="account">
					<c:if test="${not empty errors|| not empty errortk }">
						<div class="alert alert-danger">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
							<strong>Error!</strong>
							<p style="color: #e70e0e;">
								<form:errors path="*"></form:errors>
								<br>${errortk }</p>
			
						</div>
					</c:if>
				</form:form>
				<c:if test="${not empty message }">
					<div class="alert alert-success">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			
						<strong>${message }</strong>
					</div>
				</c:if>
           </div>
        <form:form action="/register" class="form-signin"  modelAttribute="account" method="POST">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Register New Account</h1>
            	
            	<div  class="form-group required">
            	<label for="tenDangNhap" class="control-label" style="font-weight: bold;">Username:</label>
				<form:input id="tenDangNhap" class="form-control required"
					path="tenDangNhap" placeholder="Enter your username" maxlength="50" />
					
				<label for="hoTen" class="control-label" style="font-weight: bold;">First and last name:</label>
				<form:input style="padding: 10px;" id="hoTen" class="form-control required" 
				path="hoTen" placeholder="Enter your First and last name" />
				<label for="gioiTinh" style="font-weight: bold;">Gender:</label>
				<form:select style="padding: 10px;" id="gioiTinh" path="gioiTinh" class="form-control required">
					<form:option value="Male">Male</form:option>
					<form:option value="Female">Female</form:option>
				</form:select>
				<label for="ngaySinh" class="control-label" style="font-weight: bold;">Date of birth:</label>
				<form:input type="date" id="ngaySinh" placeholder="Date of birth" class="form-control required"
					path="ngaySinh"  max="9999-12-31" />
					
				<label for="CMND" class="control-label" style="font-weight: bold;">Identity card:</label>
				<form:input type="number" id="CMND" class="form-control required" placeholder="Enter your Identity card"
					path="cmnd" oninput="checkMaxLenghtNumber(this,20)"/>
				
				<label for="soDT" class="control-label" style="font-weight: bold;">Phone Number:</label>
				<form:input type="number" id="soDT" class="form-control required" placeholder="Enter your Phone Number"
					path="soDT" oninput="checkMaxLenghtNumber(this,15)"/>
				<form:hidden id="chucVu" 
					path="chucVu.maChucVu" value="3"/>
				
				<label for="Email" class="control-label" style="font-weight: bold;">Email:</label>
				<form:input type="Email" id="Email" class="form-control required" placeholder="Enter your Email"
					path="Email" oninput="checkMaxLenghtNumber(this,100)"/>
				
				<label for="password" class="control-label" style="font-weight: bold;">Pasword:</label>
				<input type="password" name="newpassword" id="newpassword" class="form-control required" placeholder="Enter your password" maxlength="100" required="required" >
				
				<label for="matKhau" class="control-label" style="font-weight: bold;">Confirm Pasword:</label>
				<form:input type="password" id="matKhau" class="form-control required"
					path="matKhau" autocomplete="off"  placeholder="Confirm your password" maxlength="100"/>
				</div>
            <button class="btn btn-success btn-block" type="submit"><i class="fa fa-sign-in-alt"></i> Submit</button>
            <hr>
 
            <a href="userlogin" id="cancel_signup"><i class="fa fa-angle-left"></i> Back</a>

            </form:form>
           
            
    </div>

    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

</body>
</html>