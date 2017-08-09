<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gms.web.constants.DB"%>
<%@ page import="java.sql.*"%>
<%
	Class.forName(DB.ORACLE_DRIVER);
	Connection conn = DriverManager.getConnection(DB.ORACLE_URL, DB.USERNAME, DB.PASSWORD);
	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM Member WHERE id='hong'";
	ResultSet rs = stmt.executeQuery(sql);
	String findName = "";
	if (rs.next()) {
		findName = rs.getString("name");
	}
%><!-- <<<<-자바 코드가 들어갈 지역이고 설정을 하는 곳이다. -->
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>
<body>
	<h1>
		Hello
		<%=findName%></h1>
</body>
</html>