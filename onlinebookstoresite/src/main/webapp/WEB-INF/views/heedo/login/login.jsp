<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 회원번호,중고판매자번호 보내야됨-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Gobook_Login</title>
<link
	href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${cp }/resources/hd/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${cp }/resources/hd/loginForm/css/login.css">
</head>
<body>
	<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
		<div class="container">
			<div class="card login-card">
				<div class="row no-gutters">
					<div class="col-md-5">
						
						<img src="${cp }/resources/hd/loginForm/images/imgtest1.jpg"
							alt="login" class="login-card-img"></a>
					</div>
					<div class="col-md-7">

						<div class="card-body">
							<div class="brand-wrapper">
								<a href="${cp }/">
								<img src="${cp }/resources/hd/img/logo2.jpg" alt="logo"
									class="logo" style="width: 200px; height: auto;"></a>
							</div>
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#home">会員</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#menu1">非会員 注文確認</a></li>
							</ul>

							<div class="tab-content">
								<div id="home" class="tab-pane active">
									<br>
									<p class="login-card-description">ログイン</p>
									<form action="/loginOk" method="post">
										<div class="form-group">
											<label for="id" class="sr-only">ID</label> <input
												type="text" name="id" id="id" class="form-control"
												placeholder="IDを入力してください">
										</div>
										<div class="form-group mb-4">
											<label for="password" class="sr-only">暗証番号</label> <input
												type="password" name="password" id="pwd"
												class="form-control" placeholder="***********">
										</div>
										<input name="login" id="login"
											class="btn btn-block login-btn mb-4" type="button"
											value="ログイン">
									</form>
									<span class="forgot-password-link">新入会員募集中！</span>
									<p class="login-card-footer-text">
										IDを持っていませんか？ <a href="${cp }/join" class="text-reset">会員登録は
											こちらで！</a>
									</p>
									<nav class="login-card-footer-nav">
										<a href="#!">Terms of use.</a> <a href="#!">Privacy policy</a>
									</nav>
								</div>
								<div id="menu1" class="tab-pane fade">
									<br>
									<p class="login-card-description">注文確認</p>
									<form action="#!">
										<div class="form-group">
											<label for="ordernum" class="sr-only">注文番号</label> <input
												type="text" name="ordernum" id="ordernum" class="form-control"
												placeholder="注文番号を入力してください。">
										</div>
										<div class="form-group mb-4">
											<label for="phone" class="sr-only">電話番号</label> <input
												type="text" name="phone" id="phone"
												class="form-control" placeholder="電話番号を入力してください。(-含め)">
										</div>
										<input name="login" id="search_order"
											class="btn btn-block login-btn mb-4" type="button"
											value="照会">
									</form>
									<span class="forgot-password-link">注文番号を忘れてしまいましたか?</span>
									<p class="login-card-footer-text">
										忘れてしまいましたら  <span class="text-reset">連絡お願いいたします。</span>
									</p>
									<nav class="login-card-footer-nav">
										<a href="#!">Terms of use.</a> <a href="#!">Privacy policy</a>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
<div id="errmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ff66a3">
       <h4 class="modal-title" style="color:white">エラー</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body" id="errmodal_body">
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">閉じる</button>
      </div>
    </div>

  </div>
</div>

<div id="alertmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ccccff">
       <h4 class="modal-title" style="color:white">お知らせ</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body" id="alertmodal_body">
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">閉じる</button>
      </div>
    </div>

  </div>
</div>


<script src="${cp }/resources/hd/js/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="${cp }/resources/hd/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$("#login").click(function(){
		var id=$("#id").val();
		var pwd=$("#pwd").val();
		if(id=='' ||pwd==''){
			$("#errmodal_body").text("IDと暗証番号を入力してください。");
			$("#errmodal").modal('show')
		}else{
			$.ajax({
				url:"/finalproject/loginCheck",
				type: "post",
				data:{id:id,pwd:pwd},
				dataType:"json",
				success:function(data){
					if(data.result=="fail"){
						$("#errmodal_body").text("入力した情報と一致する会員が見つかりません. IDや暗証番号を確認してください。.");
						$("#errmodal").modal('show')
					}else if(data.result=="leave"){
						$("#errmodal_body").text("脱退会員です。");
						$("#errmodal").modal('show')
					}else{
						window.location.href="/finalproject/";
					}
					
				}
			});
		}
		
	});
	$("#search_order").click(function(){
		var ordernum=$("#ordernum").val();
		var phone=$("#phone").val();
		if(ordernum=='' ||phone==''){
			$("#errmodal_body").text("注文番号と電話番号を入力してください。");
			$("#errmodal").modal('show')
			return;
		}
		if(!$.isNumeric(ordernum)){
			$("#errmodal_body").text("注文番号は数字だけ入力出来ます。");
			$("#errmodal").modal('show')
			return;
		}
		$.ajax({
			url:"${cp}/nomem/inquiryorder",
			data:{bpaynum:ordernum,phone:phone},
			dataType:"json",
			type:"post",
			success:function(data){
				if(data.result=="nothing"){
					$("#alertmodal_body").text("存在しない注文です. 注文番号や電話番号を確認してください。.")
					$("#alertmodal").modal('show')
				}else if(data.result=="applycancel"){
					$("#alertmodal_body").text("返品・交換申請中の注文です.")
					$("#alertmodal").modal('show')
				}else if(data.result=="confirmcancel"){
					$("#alertmodal_body").text("返品・交換完了の注文です.")
					$("#alertmodal").modal('show')	
				}else if(data.result=="cancelorder"){
					$("#alertmodal_body").text("キャンセルされた注文です.")
					$("#alertmodal").modal('show')		
				}else if(data.result=="success"){
					var bpaynum1=data.bpaynum;
					var btype1=data.btype;
					var action="";
					if(btype1==1){
						action="${cp}/orderhistory/detailview1";
					}else{
						action="${cp}/orderhistory/useddetailview1";
					}
					var form=$('<form></form>');
					form.attr("action",action);
		    		form.attr('method','post');
		    		form.appendTo('body');
					var bpaynum2="<input type='hidden' name='bpaynum' value="+bpaynum1+">"
					form.append(bpaynum2);
					form.submit();
				}
			}
		});
	})
	
</script>
</html>