<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="frm" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container">
	<frm:form modelAttribute="post">


		<!-- thông báo lỗi ngoại lệ form -->
		<c:if test="${not empty errors|| not empty errorimg }">
			<div class="alert alert-danger">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Error!</strong>
				<p>
					<frm:errors path="*"></frm:errors>
					<br>${errorimg }</p>
			</div>
		</c:if>

		<!-- thông báo khi sửa hoặc xóa thành công -->
		<c:if test="${not empty message }">
			<div class="alert alert-success">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>

				<strong>${message }</strong>
			</div>
		</c:if>

	</frm:form>

	<div class="container">
		<form action="post_management">

			<div class="row" style="float: right">
				<div class="form-group">
					<div class="input-group">
						<input class="form-control" type="text" name="title"
							placeholder="Search by Title"
							value="${data }" required /> <span class="input-group-btn">
							<button class="btn btn-success" type="submit">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span><span
									style="margin-left: 2px;"><i class="fa fa-search"></i>
									Search</span>
							</button>
						</span>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div
		style="overflow: auto; height: auto; width: 100%; box-shadow: 1px 1px 5px #888888;">
		<table class="table table-striped"
			style="font-size: 15px; white-space: nowrap;">
			<thead style="vertical-align: middle;">
				<tr>
					<th style="max-width: 92px">Picture</th>
					<th style="min-width: 80px; vertical-align: middle;">ID</th>
					<th style="min-width: 80px; vertical-align: middle;">Title</th>
					<th style="min-width: 80px; vertical-align: middle;">Create ON</th>
					<th style="min-width: 80px; vertical-align: middle;">Update ON</th>
					<th style="width: auto; vertical-align: middle;">Action</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="u" items="${post.content}">
					<tr>
						<td style="vertical-align: middle;"><img alt=""
							id="myImg${u.id}" src="images/post/${u.image}" width="60px"
							height="60px"></td>

						<td style="vertical-align: middle;">${u.id}</td>
						<td style="vertical-align: middle;">${u.title}</td>
						<td style="vertical-align: middle;">${u.createdOn}</td>
						<td style="vertical-align: middle;">${u.updatedOn}</td>
						<td style="vertical-align: middle;">
						<a type="button" href="editPost?id=${u.id}" class="btn btn-warning btn-sm"><i class="fa fa-edit"></i>Edit</a>
							<button type="button" class="btn btn-danger btn-sm"
								data-toggle="modal" data-target="#myModalxoa${u.id}">
								<i class="fa fa-trash-o"></i>Delete
							</button>
							</td>
					</tr>

					<!-- Modal xoa -->
					<div class="modal fade" id="myModalxoa${u.id}" role="dialog">
						<div class="modal-dialog">
							<!-- Modal content-->
							<div class="modal-content">
								<div class="modal-header">

									<h4 class="modal-title" style="font-weight: bold;">Delete
										Post</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
								<div class="modal-body">
									<h6>
										Do you want to delete Post id <strong>${u.id}</strong>?
									</h6>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Cancel</button>
									<a href="delete-post?id=${u.id}"
										class="btn btn-success">Agree</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</tbody>
		</table>
		<nav aria-label="Page navigation" style="float: right;">
		 	 <ul class="pagination">
			    <li class="page-item"><a class="page-link" href="post_management?p=0">First Page</a></li>
			    <li class="page-item"><a class="page-link" href="post_management?p=${post.number-1}">Previous</a></li>
			    <li class="page-item"><a class="page-link" href="post_management?p=${post.number+1}">Next</a></li>
			    <li class="page-item"><a class="page-link" href="post_management?p=${post.totalPages-1}">Last Page </a></li>
  			</ul>
		</nav>
	</div>
</div>



