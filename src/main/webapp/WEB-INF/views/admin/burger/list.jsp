<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>
<%@ include file="/common/taglib.jsp"%>
<c:url var="burgerAPI" value="/api/burger" />
<c:url var="burgerURL" value="/quan-tri/bai-viet/danh-sach/san-pham" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/quan-tri/trang-chu" />">Home</a>
					</li>

					<li>Quản lý sản phẩm</li>
					<li class="active"><a href="#">Danh sách sản phẩm</a></li>
				</ul>
				
				<div class="nav-search" id="nav-search">
					<form action="<c:url value='/quan-tri/bai-viet/danh-sach/san-pham/tim-kiem' />" class="form-search">
						<span class="input-icon">
							<input type="text" placeholder="Search ..." class="nav-search-input" autocomplete="off" name="keyword"/>
							<i class="ace-icon fa fa-search nav-search-icon"></i>
						</span>		
					</form>		
				</div><!-- /.nav-search -->

			</div>

			<div class="page-content">
				<div class="row">
					
					<div class="widget-box table-filter">
						<div class="table-btn-controls">
							<div class="pull-right tableTools-container">
								<div class="dt-buttons btn-overlap btn-group">
									<c:url var="createBurgerURL" value="/quan-tri/bai-viet/danh-sach/san-pham/chinh-sua" />
									<a flag="info"
										class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
										data-toggle="tooltip" title='Thêm bài viết' href='${createBurgerURL}'> <span>
											<i class="fa fa-plus-circle bigger-110 purple"></i>
									</span>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xs-12">
						<div>
							<table id="dynamic-table"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Name</th>
										<th>Ingredients</th>
										<th>Price</th>
										<th>Thumbnail</th>
										<th></th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${listBurger}" var="item">
										<tr>
											<td>${item.name}</td>
											<td>${item.ingredient}</td>
											<td class="hidden-480">${item.price}</td>
											<td><img width="100px" height="100px" src="<c:url value= "/images/${item.thumbnailName}" />"></td>
											<td>
												<div class="hidden-sm hidden-xs action-buttons">
													<!-- <a class="blue" href="#"> <i
														class="ace-icon fa fa-search-plus bigger-130"></i>
													</a>  -->
													
													<c:url var="updateBurgerURL" value="/quan-tri/bai-viet/danh-sach/san-pham/chinh-sua">
																<c:param name="id" value='${item.id}'></c:param>
													</c:url>
													<a class="green" href="${updateBurgerURL}"> <i
														class="ace-icon fa fa-pencil bigger-130"></i>
													</a> 
													
													<c:url var="deleteBurgerURL" value="/quan-tri/bai-viet/danh-sach/san-pham/xoa">
																<c:param name="id" value='${item.id}'></c:param>
													</c:url>
													<a class="pink" href="${deleteBurgerURL}"> <i
														class="fa fa-trash-o bigger-130 "></i>
													</a> 
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- <ul class="pagination" id="pagination"></ul>
							<input type="hidden" value="" id="page" name="page"/>
							<input type="hidden" value="" id="limit" name="limit"/>	 -->
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 35,
				visiblePages : 10,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
</body>
</html>