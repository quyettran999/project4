<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="w3l-breadcrumb">
    <div class="breadcrum-bg py-sm-5 py-4">
        <div class="container py-lg-3">

            <h2>Blog Posts</h2>
            <p><a href="${pageContext.request.contextPath }/home">Home</a> &nbsp; / &nbsp; Blog</p>

        </div>
    </div>
</section>
<section class="w3l-blog py-5">
    <div class="grid-view py-lg-5 py-sm-4">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <c:forEach var="u" items="${post.content}">
                     		<div class="col-lg-6 col-md-6 mt-4">
                            	<div class="grids5-info">
                                	<a href="blogview?id=${u.id}" class="d-block zoom"><img src="images/post/${u.image}"
                                        alt="" class="img-fluid news-image" /></a>
                                	<div class="blog-info">
	                                    <h4><a href="blogview?id=${u.id}">${u.title}</a></h4>
	                                    <p class="date">${u.description}</p>
	              						 <p class="blog-text">${u.createdOn}.</p>
	                                    <a href="blogview?id=${u.id}" class="btn btn-news mt-4" style="color: orange;">Read More</a>
                                	</div>
                            	</div>
                       	 	</div>
                     	</c:forEach>
                        
                    </div>
                </div>
                <div class="col-lg-4 mt-lg-0 mt-4">
                    <div class="best-rooms bg-transparent">
                        <div class="grids5-info">
                            <div class="blog-info-bg-primary text-center mb-4">
                                <h4><a href="https://www.facebook.com/Homie-Hotel-HCM-108866298425783">Follow our <b>Resort Luxury Hotels</b></a></h4>
                            </div>
                        </div>
                        <div class="grids5-info">
                            <div class="blog-info blog-info-bg-theme-light text-center mb-4">
                                <div class="blog-icon mb-4">
                                    <a href="blog-single"><span class="fa fa-link"></span></a>
                                </div>
                                <h4><a href="blog-single">How to make best holiday with your family</a></h4>
                            </div>
                        </div>
                        <div class="maghny-gd-1">
                            <div class="maghny-grid">
                                <figure class="effect-lily border-radius">
                                    <img class="img-fluid" src="images/bottom.jpg">
                                    <figcaption class="w3set-hny">
                                        <div>
                                            <h4>Family Rooms <span> Hotels</span></h4>
                                            <p><a href="blog-single" style="color: orange;">Read More</a> </p>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
              <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center mt-sm-5 mt-4 mb-0">
                    
			    <c:if test="${post.number > 0}">
			    	<li class="page-item"><a class="page-link" href="blog?p=0">First Page</a></li>
			    	<li class="page-item"><a class="page-link" href="blog?p=${post.number-1}">Previous</a></li>
			    </c:if>
			    
			    <c:if test="${post.number  < post.totalPages-1}">
			    	<li class="page-item"><a class="page-link" href="blog?p=${post.number+1}">Next</a></li>
			    	<li class="page-item"><a class="page-link" href="blog?p=${post.totalPages-1}">Last Page </a></li>
			    </c:if>
			    
                </ul>
            </nav>
        </div>
    </div>
</section>