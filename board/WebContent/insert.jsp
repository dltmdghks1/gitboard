<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.text.*" %>
    <%
    request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name, email, subject, memo, time;
name = request.getParameter("name");
email = request.getParameter("email");
subject = request.getParameter("subject");
memo = request.getParameter("memo");
time = request.getParameter("time");

String JDBC_DRIVER="com.mysql.jdbc.Driver";
String DB_URL = "jdbc:mysql://localhost:3306/board";
String USERNAME="root";
String PASSWORD="root";
Class.forName(JDBC_DRIVER);
Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
Statement stmt = conn.createStatement();
String sql="insert into message(subject, name, time, memo, email)";
sql += "values('"+subject+"', '"+name+"','"+time+"', '"+memo+"', '"+email+"')";


stmt.executeUpdate(sql);
%>

<h3>게시글의 등록되었습니다.</h3>
<a href="list.jsp">게시글 리스트보기</a>
</body>
</html>