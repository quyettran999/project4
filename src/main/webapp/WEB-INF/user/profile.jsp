<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<section class="w3l-booking-top">
	<!-- /form-16-section -->
	<div class="booking-form-61">
		<div class="container">
			<div class="booking-top-gds">
				<div class="booking-forms-16-info align-self">
					<h5>Your Information</h5>
					<h3 class="title-big">${getUser.tenDangNhap}.</h3>
				</div>
				<div class="form-right-inf">
					<div class="booking-form-content">
						<h6>Profile Details</h6>
						<div>
						<frm:form modelAttribute="getUser">
						<c:if test="${not empty errors|| not empty errortk }">
							<div class="alert alert-danger">
								<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
								<strong>Error!</strong>
				
								<p style="color: #e70e0e;">
									<frm:errors path="*"></frm:errors>
									<br>${errortk }</p>
				
							</div>
						</c:if>
					</frm:form>
		
					<c:if test="${not empty message }">
						<div class="alert alert-success">
							<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				
							<strong>${message }</strong>
						</div>
					</c:if>
					</div>
						<frm:form action="profile" modelAttribute="getUser" class="book-depature-6 signin-form" Method="POST">
							<div class="hny-frm_grid">
								<label for="tenDangNhap" style="font-weight: bold;">User name:</label>
									<frm:input id="tenDangNhap" class="form-control"
										path="tenDangNhap" value="${getUser.tenDangNhap}" disabled="true"/>
								<frm:hidden path="tenDangNhap" value="${getuser.tenDangNhap }"/>
							</div>
			
							<div class="hny-frm_grid">
								<label for="hoTen" style="font-weight: bold;">First and last name:</label>
								<frm:input id="hoTen" class="form-control" path="hoTen"
										value="${getUser.hoTen}" maxlength="100"/>
							</div>
							<div class="hny-frm_grid">
								<label for="gioiTinh" style="font-weight: bold;">Gender:</label>
									<frm:select id="gioiTinh" class="form-control" path="gioiTinh">
										<frm:option value="Male">Male</frm:option>
										<frm:option value="Female">Female</frm:option>
									</frm:select>
							</div>
			
							<div class="hny-frm_grid">
								<label for="ngaySinh" style="font-weight: bold;">Date of birth:</label>
									<frm:input type="date" id="ngaySinh" class="form-control"
										path="ngaySinh" value="${getUser.ngaySinh}" max="9999-12-31"/>
							</div>
			
							<div class="hny-frm_grid">
								<label for="CMND" style="font-weight: bold;">Identity card:</label>
								
									<frm:input type="number" id="CMND" class="form-control"
										path="cmnd" value="${getUser.cmnd}" oninput="checkMaxLenghtNumber(this,20)"/>
							</div>
			
							<div class="hny-frm_grid">
								<label for="soDT" style="font-weight: bold;">Phone number:</label>
								
									<frm:input type="number" id="soDT" class="form-control"
										path="soDT" value="${getUser.soDT}" oninput="checkMaxLenghtNumber(this,15)"/>
							</div>
			
							<div class="hny-frm_grid">
								<label for="Email" style="font-weight: bold;">Email:</label>
									<frm:input type="Email" id="Email" class="form-control"
										path="Email" value="${getUser.email}" oninput="checkMaxLenghtNumber(this,100)"/>
							</div>
							
							<div class="hny-frm_grid">
								<label for="matKhau" style="font-weight: bold;">Password:</label>
									<frm:input type="password" id="matKhau" class="form-control"
										path="matKhau" autocomplete="off"  placeholder="Enter your password" maxlength="100"/>
							</div>
							
							<frm:hidden id="chucVu"
										path="chucVu.maChucVu" value="${getUser.chucVu.maChucVu}"/>
								<input type="submit" class="btn btn-style btn-secondary book mt-3"
									style="background: #f57b51; color: #fff" value="Update" />
						</frm:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>