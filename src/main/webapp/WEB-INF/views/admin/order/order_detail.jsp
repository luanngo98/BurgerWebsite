<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/quan-tri/trang-chu" />">Home</a></li>
					<li>Quản lý sản phẩm</li>
					<li class="active"><a href="<c:url value="/quan-tri/bai-viet/danh-sach/don-hang" />">Danh sách order</a></li>
					<li class="active">Chi tiết</li>
				</ul>

			</div>

			<div class="page-content">

				<div class="row">
					<div class="col-xs-12">
						<div>
							<table id="dynamic-table"
								class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>Tên sản phẩm</th>
										<th>Ảnh</th>
										<th>Giá</th>
										<th>Số lượng</th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${items}" var="item">
										<tr>
										<td>${item.burger.name}</td>
										<td><img width="100px" height="100px" src="<c:url value= "/images/${item.burger.thumbnailName}" />"></td>
										<td>${item.price}</td>
										<td>${item.quantity}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>