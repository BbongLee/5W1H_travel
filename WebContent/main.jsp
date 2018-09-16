<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
	<head>
		<title>육하원칙 여행</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
		</style>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section id="banner">
									<div class="content">
										<header>
											<h1>육하원칙으로 여행을 떠나볼까?</h1>
										</header>
								</section>
								<section>
								<%
								String contentpage = request.getParameter("CONTENTPAGE");
								%>
								<jsp:include page="<%= contentpage %>"></jsp:include>
	
								</section>

						</div>
					</div>
							
				<!-- Sidebar -->
					<div id="sidebar">
						<div class="inner">

							<!-- Search -->
								<%
		request.setCharacterEncoding("UTF-8");
		String contentPage = request.getParameter("CONTENTPAGE");
		
		String userID = null;
		
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
  	<nav>
		<% if(userID == null){ %>
        <ul>
			<li><a href="login.jsp">LOGIN</a></li>
            <li><a href="join.jsp">JOIN US</a></li>
        </ul>   
        <% } else { %>
        <ul>
			<li><a href="logout.jsp">LOGOUT</a></li>
			<li><a href="myPage.jsp">나의 페이지</a></li>
        </ul> 
        <% } %> 
</nav>
							<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>Menu - 육하원칙으로 말해요</h2>
									</header>
									<ul>
										<li><a href="index.jsp">HOME</a></li>
										<li>
											<span class="opener" href="who.jsp">누구랑</span>
											<ul>
												<li><a href="who.jsp?whoNum=0">전체</a></li>
												<li><a href="who.jsp?whoNum=1">나혼자</a></li>
												<li><a href="who.jsp?whoNum=2">친구들</a></li>
												<li><a href="who.jsp?whoNum=3">가족</a></li>
												<li><a href="who.jsp?whoNum=4">연인</a></li>
												<li><a href="who.jsp?whoNum=5">패키지</a></li>
												<li><a href="who.jsp?whoNum=6">또 다른 사람들</a></li>
												
											</ul>
										</li>
										<li><span class="opener" href="when.jsp">언제?</span>
											<ul>
												<li><a href="when.jsp?when=0">전체</a></li>
												<li><a href="when.jsp?when=1">기록</a></li>
												<li><a href="when.jsp?when=2">버킷리스트</a></li>
												<li><a href="when.jsp?when=3">당일치기</a></li>
											</ul>
										
										<li><a href="where.jsp">어디서 ? (지도 보기)</a></li>
										<!-- <li><a href="what.jsp">무엇을</a></li>
										<li><a href="how.jsp">어떻게</a></li>
										<li><a href="why.jsp">왜</a></li>-->
									</ul>
								</nav>
						</div>
					</div>

			</div>
<footer id="footer">
									<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
								</footer>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>
	