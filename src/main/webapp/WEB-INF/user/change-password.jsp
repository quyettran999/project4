
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<section class="w3l-booking-top">
	<!-- /form-16-section -->
	<div class="booking-form-61">
		<div class="container">
			<div class="booking-top-gds">
				<div class="booking-forms-16-info align-self">


				</div>
				<div class="form-right-inf">
					<div class="booking-form-content">
						<h6>Change Password</h6>
						<div>
							<frm:form modelAttribute="account">
						    	<c:if test="${not empty errors }">
						           <div class="alert alert-danger">
						    			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    			<strong>Lỗi!</strong>
						    			<p><frm:errors path="*" ></frm:errors></p>
									</div>
						  		</c:if>
						 	</frm:form>				  
						  	<c:if test="${not empty messageloi }">
						    	<div class="alert alert-danger">
						    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    		<strong>${messageloi }</strong>
						  		</div>
							</c:if>
							<c:if test="${not empty message }">
						 		<div class="alert alert-success">
						    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						    		<strong>${message }</strong>
						  		</div>
						 	 </c:if>
						</div>               
						<frm:form action="change-Password" modelAttribute="account">
				   		   <div class="hny-frm_grid">
								<label for="matkhaucu" style="font-weight: bold;">Old password:</label>
	
										<input type="password" name="matkhaucu" id="matkhaucu" class="form-control" placeholder="Enter your current password" maxlength="100" required="required">
							</div>
							
							<frm:hidden path="tenDangNhap" value="${getaccount.tenDangNhap }"/>
							<frm:hidden path="hoTen" value="${getaccount.hoTen }"/>
							<frm:hidden path="gioiTinh" value="${getaccount.gioiTinh }"/>
							<frm:hidden path="ngaySinh" value="${getaccount.ngaySinh }"/>
							<frm:hidden path="cmnd" value="${getaccount.cmnd }"/>
							<frm:hidden path="soDT" value="${getaccount.soDT }"/>
							<frm:hidden path="email" value="${getaccount.email }"/>
							<frm:hidden path="chucVu.maChucVu" value="${getaccount.chucVu.maChucVu }"/>
							<div class="hny-frm_grid">
								<label for="matkhaumoi" style="font-weight: bold;">New password:</label>
									<input type="password" name="matkhaumoi" id="matkhaumoi" class="form-control" placeholder="Enter your new password" maxlength="100" required="required" >
							</div>
							
					        <div class="hny-frm_grid">
								<label for="xacnhanmatkhaumoi" style="font-weight: bold;">Confirm new password:</label>
									<frm:input path="matKhau" type="password"  class="form-control" placeholder="Confirm new password" maxlength="100" required="required" ></frm:input>
							</div> 
							<input type="submit" class="btn btn-style btn-secondary book mt-3"
								style="background: #f57b51; color: #fff" value="Save" />
						</frm:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
          