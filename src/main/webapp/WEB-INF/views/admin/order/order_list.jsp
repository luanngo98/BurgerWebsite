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
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/quan-tri/trang-chu" />">Home</a>
					</li>

					<li>Quản lý sản phẩm</li>
					<li class="active"><a href="<c:url value="/quan-tri/bai-viet/danh-sach/don-hang" />">Danh sách order</a></li>
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
										<th>Tên khách hàng</th>
										<th>SĐT</th>
										<th>Địa chỉ</th>
										<th><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i> Thời gian đặt hàng</th>
										<th class="hidden-480">Thành tiền</th>
										<th>Ngày chỉnh sửa</th>
										<th>Được sửa bởi</th>
										<th class="hidden-480">Tình trạng</th>
										<th></th>
									</tr>
								</thead>

								<tbody>
									<c:forEach items="${listOrder}" var="item">
										<tr>
										<td>${item.userName}</td>
										<td>${item.phone}</td>
										<td class="hidden-480">${item.address}</td>
										<td>${item.orderDate}</td>
										<td>${item.totalPrice}</td>
										<td>${item.modifiedDate}</td>
										<td>${item.modifiedby}</td>
										
										<td>
											<c:if test="${item.status == 'Đang xử lý'}">
												<span class="label label-sm label-info arrowed arrowed-righ">${item.status}</span>
											</c:if>
											<c:if test="${item.status == 'Thành công'}">
												<span class="label label-sm label-success">${item.status}</span>
											</c:if>
											<c:if test="${item.status == 'Hủy'}">
												<span class="label label-sm label-warning">${item.status}</span>
											</c:if>
										</td>

										<td>
											<div class="hidden-sm hidden-xs action-buttons">
												<a class="blue" href="<c:url value="/quan-tri/bai-viet/danh-sach/don-hang/chi-tiet?id=${item.id}" />"> <i
													class="ace-icon fa fa-search-plus bigger-130"></i>
												</a> <a class="green" href="<c:url value="/quan-tri/bai-viet/danh-sach/don-hang/chinh-sua?id=${item.id}" />"> <i
													class="ace-icon fa fa-pencil bigger-130"></i></a>
												<!--  <a class="red" href="#"> <i
													class="ace-icon fa fa-trash-o bigger-130"></i>
												</a> -->
											</div>

											<!-- <div class="hidden-md hidden-lg">
												<div class="inline pos-rel">
													<button class="btn btn-minier btn-yellow dropdown-toggle"
														data-toggle="dropdown" data-position="auto">
														<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
													</button>

													<ul
														class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
														<li><a href="#" class="tooltip-info"
															data-rel="tooltip" title="View"> <span class="blue">
																	<i class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
														</a></li>

														<li><a href="#" class="tooltip-success"
															data-rel="tooltip" title="Edit"> <span class="green">
																	<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
														</a></li>

														<li><a href="#" class="tooltip-error"
															data-rel="tooltip" title="Delete"> <span class="red">
																	<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
														</a></li>
													</ul>
												</div>
											</div> -->
										</td>
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