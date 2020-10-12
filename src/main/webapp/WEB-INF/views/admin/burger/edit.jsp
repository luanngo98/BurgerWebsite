<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%-- <c:url var="burgerURL" value="/quan-tri/bai-viet/danh-sach/san-pham" />
<c:url var="editBurgerURL" value="/quan-tri/bai-viet/danh-sach/san-pham/chinh-sua" />
<c:url var="burgerAPI" value="/api/burger" /> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chỉnh sửa bài viết</title>
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
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="<c:url value="/quan-tri/trang-chu" />">Home</a>
						</li>

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

							<form:form action="them-moi" class="form-horizontal" role="form"
								id="formSubmit" modelAttribute="model"
								enctype="multipart/form-data" method="post">

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Tên món ăn </label>

									<div class="col-sm-9">
										<form:input path="name" cssClass="col-xs-10 col-sm-5" />
										<form:errors path="name" />
									</div>
								</div>

								<%-- <div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Ảnh </label>
									
									<c:if test="${not empty model.id }">
										<div class="col-sm-9">
										<img width="100px" height="100px" src="<c:url value= "/images/${model.thumbnailName}" />">
									</div>
									</c:if>
								</div> --%>
								
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-field-1"> Upload Ảnh </label>

									<div class="col-sm-9">
										<input type="file" placeholder="File"
											class="col-xs-10 col-sm-5" id="thumbnail" name="thumbnail" />
									</div>
									<div class="col-sm-9">
										${error}
									</div>
								</div>

								<div class="form-group">
									<label for="shortDescription"
										class="col-sm-3 control-label no-padding-right">Mô tả
										ngắn</label>
									<div class="col-sm-9">
										<form:textarea path="ingredient" rows="5" cols="10"
											cssClass="form-control" id="ingredient" />
										<form:errors path="ingredient"/>
									</div>
								</div>

								<div class="form-group">
									<label for="content"
										class="col-sm-3 control-label no-padding-right">Giá</label>
									<div class="col-sm-9">
										<form:input type="number" path="price" rows="5" cols="10"
											cssClass="form-control" id="price" />
										<%-- <form:errors path="number" cssClass="error" /> --%>
									</div>
								</div>

								<form:hidden path="id" id="burgerId"/>

								<div class="clearfix form-actions">
									<div class="col-md-offset-3 col-md-9">
										<c:if test="${not empty model.id}">
											<button class="btn btn-info" type="submit"
												id="btnAddOrUpdateBurger">
												<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật bài
												viết
											</button>
										</c:if>
										<c:if test="${empty model.id}">
											<button class="btn btn-info" type="submit"
												id="btnAddOrUpdateBurger">
												<i class="ace-icon fa fa-check bigger-110"></i> Thêm bài
												viết
											</button>
										</c:if>

										&nbsp; &nbsp; &nbsp;
										<a class="btn" href="<c:url value='/quan-tri/bai-viet/danh-sach/san-pham' />">
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

	<!-- <script>
		$('#btnAddOrUpdateBurger').click(function (e) {
			e.preventDefault();
			/* 
			// giả sử 1 form có ít fields thì có thể get value của từng fields
			var content = $('#content').val(); // lấy giá trị của content thông qua id content trong form
			var shortDescription = $('#shortDescription').val(); 
			*/

			// trong trường hợp có nhiều fields, để get value của các fields  thì khai báo id của form, và sử dụng serializeArray() để get value các fields trong form
			// Lưu ý mỗi field cần khai báo thuộc tính name. vì khi trả ra kết quả n sẽ hiển thị dưới dạng {name: "title", value: "test"}. Nếu sử dụng spring form thì khai báo path, vì path n tương đương với name + value. value là nơi để truyền giá trị vào chẳng hạn model.title
			
			var formData = $('#formSubmit').serializeArray();
			console.log(formData); 

			var data = {}; // được sử dụng để chuyển hết dữ liệu từ mảng formData vào trong data để đẩy dữ liệu về api dạng json. thằng formData chỉ là ở bên client
			$.each(formData, function(i,v){
				data["" + v.name + ""] = v.value;
			});

			/* var files = $('#thumbnail')[0].files[0];
			if(files != undefined) {
				var reader = new FileReader();

				reader.onload = function(e) {
					data["${model.thumbnailName}"] = files.name;
					data["${model.thumbnailData}"] = "/images/" + files.name;
				}
			} */

			console.log(data)
			
			var id = $('#burgerId').val();
			if (id == "") {
				addNew(data);
			} else {
				updateNew(data);
			}
		});

		function addNew(data){
			$.ajax({
	            url: '${burgerAPI}',
	            type: 'POST',
	            contentType: 'application/json', /* contentType: là kiểu dữ liệu gửi từ client về server */
	            data: JSON.stringify(data), /* JSON,stringify: chuyển đổi dữ liệu từ javascript object sang JSON. Dữ liệu của thằng data (được chuyển từ mảng formData) là javascript object  */
	            //enctype: 'multipart/form-data',
		        dataType: 'json', /* dataType: là kiểu dữ liệu đẩy từ server về client */
	            success: function (result) {
	            	window.location.href = "${editBurgerURL}?id="+result.id+"&message=insert_success";
	            },
	            error: function (error) {
	            	window.location.href = "${burgerURL}?message=error_system";
	            }
	        });
		}

		function updateNew(data){
			$.ajax({
	            url: '${burgerAPI}',
	            type: 'PUT',
	            contentType: 'application/json', 
	            data: JSON.stringify(data),
	            dataType: 'json',
	            success: function (result) {
	            	window.location.href = "${editBurgerURL}?id="+result.id+"&message=update_success";
	            },
	            error: function (error) {
	            	window.location.href = "${editBurgerURL}?id="+result.id+"&message=error_system";
	            }
	        });
		}
	</script> -->
</body>
</html>
