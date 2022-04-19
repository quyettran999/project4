
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="frm" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<section class="w3l-booking-top">
	<!-- /form-16-section -->
	<div class="booking-form-61">
		<div class="container">
					<div class="booking-form-content">
						<h6>Booking Histyory</h6>
						            
						<div
				            style="overflow: auto; height: auto; width: 100%; box-shadow: 1px 1px 5px #888888;">
				        <table class="table table-striped css-serial"
				               style="font-size: 15px; white-space: nowrap; wid">
				            <thead>
								<tr>
									<th style="width: 50px;"></th>
									<th>First and last name</th>
									<th>Phone number</th>
									<th>Email</th>
									<th>Room Type</th>
									<th>Room</th>
									<th>Room Price</th>
									<th>Check-in Date</th>
									<th>Check-out Date</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="u" items="${bookingh.content }">
									<tr>
										<td></td>
										<td>${u.hoTen }</td>
										<td>${u.soDT }</td>
										<td>${u.email }</td>
										<td>${u.phong.loaiPhong.tenLoaiPhong }</td>
										<td>${u.phong.soPhong }</td>
										<td>${u.phong.giaPhong }$</td>
										<td><fmt:formatDate pattern="dd/MM/yyyy" value="${u.ngayDat }" /></td>
				
				
										<td><c:if test="${empty u.traPhongs }">
				          					 Unpaid
				           				</c:if> <c:forEach var="i" items="${u.traPhongs }">
				
												<fmt:formatDate pattern="HH:mm" value="${i.gioTra }" /> - <fmt:formatDate
													pattern="dd/MM/yyyy" value="${i.ngayTra }" />
				
				
											</c:forEach></td>
									</tr>
								</c:forEach>
							</tbody>
							
				      </table>
				      <nav aria-label="Page navigation example">
				                <ul class="pagination justify-content-center mt-sm-5 mt-4 mb-0">
				                    
							    <c:if test="${bookingh.number > 0}">
							    	<li class="page-item"><a class="page-link" href="bookinghistory?p=0">First Page</a></li>
							    	<li class="page-item"><a class="page-link" href="bookinghistory?p=${bookingh.number-1}">Previous</a></li>
							    </c:if>
							    
							    <c:if test="${bookingh.number  < post.totalPages-1}">
							    	<li class="page-item"><a class="page-link" href="bookinghistory?p=${bookingh.number+1}">Next</a></li>
							    	<li class="page-item"><a class="page-link" href="bookinghistory?p=${bookingh.totalPages-1}">Last Page </a></li>
							    </c:if>
							    
				                </ul>
				            </nav>
				</div>
			</div>
		</div>
	</div>
</section>
          