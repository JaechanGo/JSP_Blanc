<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>BLANC. </title>
<style type = "text/css">
	a, a:hover{
		color : #000000;
		text-decoration;
	}
	.bbs_active{
  		color: #555;
  		background-color: #e7e7e7;
  	}
</style>
</head>
<body>


	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<br><br>
	<div class='container'>
		<div class="row">
			<table class="table table-striped" style='text-align: center; border : 1px solid #dddddd'>
				<thead>
					<tr>
						<th style='background-color : #eeeeee; text-align: center;'>번호</th>
						<th style='background-color : #eeeeee; text-align: center;'>제목</th>
						<th style='background-color : #eeeeee; text-align: center;'>작성자</th>
						<th style='background-color : #eeeeee; text-align: center;'>작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getlist(pageNumber);
						for (int i = 0; i < list.size();i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"시 "+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
					</tr>
					<% 		
						}
					%>

				</tbody>
			</table>
			<%
			if(pageNumber != 1){
			%>
				<a href = "bbs.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(bbsDAO.nextPage(pageNumber+1)){	
			%>
			<a href = "bbs.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<a href = "write.jsp" class='btn btn-primary pull-right'>글쓰기</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<br><br><br><br>
<div class="footer">
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>