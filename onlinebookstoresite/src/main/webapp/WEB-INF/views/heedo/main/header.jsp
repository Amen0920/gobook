<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Preloder-->
<!--  
<div id="preloder">
	<div class="loader"></div>
</div>-->
<!-- Header section -->
<header class="header-section">
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="text-center text-lg-left">
					<!-- logo -->
					<a href="${cp }/" class="site-logo"> <img src="${cp }/resources/hd/img/logo2.jpg" id="logoImg" alt="">
					</a>
				</div>
				<div class="col-xl-6 col-lg-5">
					<form class="header-search-form">
						<input type="text" placeholder="Search">
						<button>
							<i class="flaticon-search"></i>
						</button>
					</form>
				</div>
				<div class="col-xl-4 col-lg-5">
					<div class="user-panel">
						<div class="up-item">
							<i class="flaticon-profile"></i>
							<c:if test="${ empty sessionScope.mid }">
								<a href="${cp }/login">ログイン</a> / <a href="${cp }/join">会員登録</a>
							</c:if>
							<c:if test="${not empty sessionScope.mid }">
								<a href="${cp }/logout">ログアウト</a>
							</c:if>
							
						</div>
						<div class="up-item">
							<div class="shopping-card">
								<i class="flaticon-bag"></i>
								<span id="cartcount">
								</span>
							</div>
							<a href="${cp }/pay/cart">カート</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="main-navbar">
		<div class="container">
			<!-- menu -->
			<ul class="main-menu">
				<li><a href="${cp}/list1">カテゴリー</a>
					<ul class="sub-menu">
						<li><a href="${cp }/cnovel">小説</a></li>
						<li><a href="${cp }/cpoetry">詩・エッセイ</a></li>
						<li><a href="${cp }/chuman">人文</a></li>
						<li><a href="${cp }/ceconomy">経済・経営</a></li>
						<li><a href="${cp }/cselfdev">自己開発</a></li>
						<li><a href="${cp }/chistory">歴史・文化</a></li>
						<li><a href="${cp }/cjob">就職・受験書</a></li>
						<li><a href="${cp }/ctravel">旅行・地図</a></li>
						<li><a href="${cp }/cit">パソコン・IT</a></li>
						<li><a href="${cp }/ccartoon">漫画</a></li>
						<li><a href="${cp }/cguitar">ETC</a></li>
					</ul></li>
				<li><a href="${cp }/list2">ベスト</a></li>
				<li><a href="${cp }/newlist">新刊 <span class="new">New</span>
				</a></li>
				<li><a href="${cp }/oldallbook">中古</a></li>
				<li><a href="${cp }/mypage/main">マイページ</a>
					<ul class="sub-menu">
						<li><a href="${cp }/mypage/orderhistory">注文履歴</a></li>
						<li><a href="#">返品・交換履歴</a></li>
						<li><a href="#">預け金履歴</a></li>
						<li><a href="#">口座履歴</a></li>
						<li><a href="${cp }/seller">中古販売管理</a></li>
						<li><a href="${cp }/mypage/qnapage">お問い合わせ掲示板</a></li>
					</ul></li>
					
					<c:if test="${sessionScope.mid eq 'admin'}">
						<li><a href="${cp }/adminmain">管理者ページ、</a></li>
					</c:if>
			</ul>
		</div>
	</nav>
</header>
<!-- Header section end -->
<script>
	$(document).ready(function(){
		$.ajax({
			url:"/finalproject/mypage/countcart",
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.result){				
					var count=data.count;
					$("#cartcount").text(count);
				}else{
					$("#cartcount").text(0);
				}
				
			}
			
		})
		
	})
</script>