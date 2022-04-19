<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/css/richtext.min.css">

<div class="container">
	<!-- thông báo lỗi ngoại lệ form -->
	<frm:form modelAttribute="newpost">
		<c:if test="${not empty errors|| not empty errorimg }">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>Error!</strong>
				<p>
					<frm:errors path="*"></frm:errors>
					<br>${errorimg }</p>
			</div>
		</c:if>
	</frm:form>
	<!-- thông báo khi sửa hoặc xóa thành công -->
	<c:if test="${not empty message }">
		<div class="alert alert-success">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a> <strong>${message }</strong>
		</div>
	</c:if>
</div>
<div class="container">
	<div class="breadcrumb" style="box-shadow: 1px 1px 5px #888888;">
		<div>
			<frm:form action="/newPost" modelAttribute="newpost" enctype="multipart/form-data" Method="POST">
				<div class="form-group">
					<div class="col-sm-10">
						<label for="title" style="font-weight: bold;">Title:</label>
						<frm:input path="title" class="form-control input-sm" id="title" type="text" placeholder="Enter the Post Title" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<label for="title" style="font-weight: bold;">Description:</label>
						<frm:input path="description" class="form-control input-sm" id="description" type="text" placeholder="Enter the Post Title" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<label for="tang" style="font-weight: bold;">Content</label>
						<frm:textarea path="content" class="form-control" id="content" placeholder="Enter content"></frm:textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-10">
						<label for="hinhAnh" style="font-weight: bold;">Picture:</label> <input type="file" class="form-control" id="file" name="file" accept=".jpg,.JPG,.png,.PNG,.jpeg,.JPEG" />
					</div>
				</div>
				
				<div class="container">
					<frm:button type="submit" class="btn btn-success btn-xs">Add</frm:button>
				</div>
			</frm:form>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
	
		$('#content').richText();
	});
	$(function() {
		$('#file').change(function() {

			//because this is single file upload I use only first index
			var f = this.files[0]

			//here I CHECK if the FILE SIZE is bigger than 8 MB (numbers below are in bytes)
			if (f.size > 8388608 || f.fileSize > 8388608) {
				//show an alert to the user
				alert("Picture size exceeds the limit of 8 MB");

				//reset file upload control
				this.value = null;
			}
		})
	});
</script>
<script src="/js/jquery.richtext.min.js"></script>

