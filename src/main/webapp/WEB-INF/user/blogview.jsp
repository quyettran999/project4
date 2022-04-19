<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="singleblock1 py-5">
	<div class="container py-sm-4">
		<div class="row">
			<div class="col-lg-6 singleblock1-left align-self">
				<h3 class="title-big">
					${post.title}
				</h3>
				<h5>${post.createdOn}</h5>
			</div>
			<div class="col-lg-6 singleblock1-right mt-lg-0 mt-5">
				<img
					src="images/post/${post.image}"
					alt="" class="img-fluid">
			</div>
		</div>
	</div>
</section>
<section class="w3l-blog-post-main">
	<!--/blog-post-->
	<div class="blog-content-inf py-5">
		<div class="container py-lg-4">
			<div class="blog-posthny-info">
				<div class="single-post-image mb-4">
					<div class="post-content">
						<h3 class="title-small mb-2">${post.description}</h3>
					</div>
				</div>

				<div class="single-post-content">
				${post.content}
				</div>
				<ul class="share-post my-5">
					<li>
						<h4 class="side-title mr-4">
							Share this post : <a href="#link" class="facebook"
								title="Facebook"> <span class="fa fa-facebook"
								aria-hidden="true"></span>
							</a> <a href="#link" class="twitter" title="Twitter"> <span
								class="fa fa-twitter" aria-hidden="true"></span>
							</a> <a href="#link" class="instagram" title="Instagram"> <span
								class="fa fa-instagram" aria-hidden="true"></span>
							</a>
						</h4>
					</li>
				</ul>

				<nav class="post-navigation row mt-5">
					<div class="post-prev col-md-6">
					<a href="blogview?id=${post.id-1}"
							>
						<span class="nav-title"> Prev Post </span> 
						</a>
					</div>
					<div class="post-next col-md-6 text-md-right mt-md-0 mt-4">
						<a href="blogview?id=${post.id+1}" rel="next">
						<span class="nav-title"> Next Post </span> 
							
						</a>
					</div>
				</nav>

				<!--//author-card-->
				<div class="author-card author-listhny my-lg-5 my-sm-4">
					<div class="row">
						<div class="author-left col-sm-3 mb-sm-0 mb-4">
							<a href="#"> <img class="img-fluid"
								src="images/team3.jpg"
								alt=" ">
							</a>
						</div>
						<div class="author-right col-sm-9 position-relative">

							<h4>
								<a href="#" class="title-team-28">Gillion Revard</a>
							</h4>
							<p class="para-team mb-0">Vivamus a ligula quam. Ut blandit
								eu leo non suscipit.Nulla quis lorem neque, mattis venenatis
								lectus. In interdum ullamcorper dolor.Lorem ipsum dolor sit
								amet.</p>


						</div>
					</div>
				</div>
				<!--//author-card-->




				<div class="leave-comment-form mt-lg-5 mt-4" id="comment">
					<h4 class="side-title mb-0">Leave a Comment</h4>
					<p class="mb-4">Your email address will not be published.
						Required fields are marked *</p>
					<form action="#" method="post">

						<div class="form-group">
							<textarea name="Comment" class="form-control"
								placeholder="Your Comment*" required="" spellcheck="false"></textarea>
						</div>
						<div class="input-grids row">

							<div class="form-group col-lg-6">
								<input type="text" name="Name" class="form-control"
									placeholder="Your Name*" required="">
							</div>
							<div class="form-group col-lg-6">
								<input type="email" name="Email" class="form-control"
									placeholder="Email*" required="">
							</div>
						</div>

						<div class="submit text-right">
							<button class="btn btn-style btn-secondary">Post Comment
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--//blog-post-->
	
	
</section>
