<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/tablesorter-master/js/jquery.tablesorter.js">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style type="text/css">
td {
	width: 235px;
	word-break: break-all;
	height:35px;
}

</style>
<script type="text/javascript">

$(function() {
    $( "input[type=submit]" )
      .button()
      .click(function( event ) {
      
      });
  });
</script>
<c:import url="/import/head.jsp"></c:import>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>米沃貓窩-會員中心</title>
</head>
<body style="font-family: 微軟正黑體; font-size: large">
	<c:import url="/import/header.jsp"></c:import>
	<section>
		<article >
			<h1 style="font-size: 50px;">會員資料(個人資料)</h1>
			<table border="0" width="420px"style="border:5px #fbe3c0 solid;padding:5px;border-collapse: collapse;background:rgba(250, 235, 215, 0.8);">
             
				<tr style="font-size:20px;border-collapse:collapse;background:rgba(250, 235, 215, 0.4);" >
					<td >姓名:</td>
					<td>${bean.MEM_NAME}</td>
				</tr>
				<tr style="font-size:20px;">
					<td>身分證字號:</td>
					<td>${bean.MEM_IDCARD}</td>
				</tr>
				<tr style="font-size:20px;border-collapse:collapse;background:rgba(250, 235, 215, 0.4);">
					<td>生日:</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${bean.MEM_BIRTHDAY}"/></td>
				</tr>
				<tr style="font-size:20px;">
					<td >地址:</td>
					<td>${bean.MEM_ADD}</td>
				</tr>
				<tr style="font-size:20px;border-collapse:collapse;background:rgba(250, 235, 215, 0.4);">
					<td>手機:</td>
					<td>${bean.MEM_PHONE}</td>
				</tr>
				<tr style="font-size:20px;">
					<td >信箱:</td>
					<td>${bean.MEM_EMAIL}</td>
				</tr>
			
			</table>
			<table >
			<form
				action="<%=request.getContextPath()%>/_500_update.jsp">
				<input style="font-size:12px" type="submit" value="修改資料">
			</form>
			<form
				action="<%=request.getContextPath()%>/_500_updatepassword.jsp">
				<input style="font-size:10px" type="submit" value="變更密碼">
			</form>
			</table>
		</article>
	</section>

	<c:import url="/import/footer.jsp"></c:import>
</body>
</html>