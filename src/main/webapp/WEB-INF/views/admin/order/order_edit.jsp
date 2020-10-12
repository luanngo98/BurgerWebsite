<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chỉnh sửa đơn hàng</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="main-content-inner">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a
							href="<c:url value="/quan-tri/trang-chu" />">Home</a></li>

						<li><a href="#">Forms</a></li>
						<li class="active">Form Elements</li>
					</ul>
					<!-- /.breadcrumb -->
				</div>

				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<%-- <c:if test="${not empty message }">
								<div class="alert alert-${alert}">${message}</div>
							</c:if> --%>

							<form:form action="chinh-sua" class="form-horizontal" role="form"
								modelAttribute="order"
								enctype="multipart/form-data" method="post">

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Tên khách hàng </label>

									<div class="col-sm-9">
										<form:input path="userName" cssClass="col-xs-10 col-sm-5" />
										<form:errors path="userName" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Địa chỉ </label>

									<div class="col-sm-9">
										<form:input path="address" cssClass="col-xs-10 col-sm-5" />
										<form:errors path="address" />
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Số điện thoại </label>

									<div class="col-sm-9">
										<form:input type="number" path="phone" cssClass="col-xs-10 col-sm-5" />
										<form:errors path="phone" />
									</div>
								</div>
								
								<%-- <div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Ngày đặt hàng </label>

									<div class="col-sm-9">
										<form:input path="orderDate" cssClass="col-xs-10 col-sm-5" />
										<form:errors path="orderDate" />
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Tổng tiền </label>

									<div class="col-sm-9">
										<form:input type="number" path="totalPrice" cssClass="col-xs-10 col-sm-5" />
										<form:errors path="totalPrice" />
									</div>
								</div> --%>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Tình trạng </label>

									<div class="col-sm-9">
										<%-- <form:input path="status" cssClass="col-xs-10 col-sm-5" /> --%>
										<form:select path="status" cssClass="col-xs-10 col-sm-5">
											<form:option value="Đang xử lý"/>
											<form:option value="Thành công" />
											<form:option value="Hủy" />
										</form:select>
									</div>
								</div>

								<form:hidden path="id" />
								<form:hidden path="orderDate"/>
								<form:hidden path="totalPrice"/>

								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn btn-info" type="submit">
											<i class="ace-icon fa fa-check bigger-110"></i> Xác nhận
										</button>

										&nbsp; &nbsp; &nbsp; 
										<a class="btn"
											href="<c:url value='/quan-tri/bai-viet/danh-sach/don-hang' />">
											<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
										</a>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
