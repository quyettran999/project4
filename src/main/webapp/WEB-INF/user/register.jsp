
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<section class="w3l-booking-top">
	<!-- /form-16-section -->
	<div class="booking-form-61">
		<div class="container">
			<div class="booking-top-gds">
				<div class="booking-forms-16-info align-self">
					<h5>Your Information</h5>
					<h3 class="title-big">Registering an account to use the service.</h3>

				</div>
				<div class="form-right-inf">
					<div class="booking-form-content">
						<h6>Register Account</h6>
						<div>
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
						<form:form action="register" modelAttribute="account"
							class="book-depature-6 signin-form" method="POST">

								<div class="hny-frm_grid">
									<label for="tenDangNhap" style="font-weight: bold;">User name:</label>
									<form:input id="tenDangNhap" path="tenDangNhap" placeholder="Enter your username" maxlength="50" />
								</div>
				
								<div class="hny-frm_grid">
									<label for="hoTen" style="font-weight: bold;">First and last name:</label>
									<form:input id="hoTen" class="form-control" path="hoTen" />
								</div>
								<div class="d-grid grid-col-2">
								<div class="hny-frm_grid">
									<label for="gioiTinh" style="font-weight: bold;">Gender:</label>
									<form:select id="gioiTinh" path="gioiTinh">
										<form:option value="Male">Male</form:option>
										<form:option value="Female">Female</form:option>
									</form:select>
								</div>
				
								<div class="hny-frm_grid">
									<label for="ngaySinh" style="font-weight: bold;">Date of birth:</label>
									<form:input type="date" id="ngaySinh" placeholder="Check-out Date" path="ngaySinh"  max="9999-12-31"/>
								</div>
				
								<div class="hny-frm_grid">
									<label for="CMND" style="font-weight: bold;">Identity card:</label>
										<form:input type="number" id="CMND" class="form-control"
											path="cmnd" oninput="checkMaxLenghtNumber(this,20)"/>
								</div>
				
								<div class="hny-frm_grid">
									<label for="soDT" style="font-weight: bold;">Phone number:</label>
									<form:input type="number" id="soDT" class="form-control"
										path="soDT" oninput="checkMaxLenghtNumber(this,15)"/>
								</div>
				
								
								
								<form:hidden id="chucVu"
											path="chucVu.maChucVu" value="3"/>

							</div>
							<div class="hny-frm_grid">
									<label for="Email" style="font-weight: bold;">Email:</label>
									<form:input type="Email" id="Email" class="form-control"
										path="Email" oninput="checkMaxLenghtNumber(this,100)"/>
								</div>
								
								<div class="hny-frm_grid">
									<label for="matKhau" style="font-weight: bold;">Password:</label>
										<form:input type="password" id="matKhau" class="form-control"
											path="matKhau" autocomplete="off"  placeholder="Enter your password" maxlength="100"/>
								</div>
								<div class="d-grid grid-col-2">
							<input type="submit" class="btn btn-style btn-secondary book mt-3"
								style="background: #f57b51; color: #fff" value="Submit" />
								<a href="login" style="color: black;" class="btn btn-light btn-style">Login</a>
								</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
