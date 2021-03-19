<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="db.jsp"%>
<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>YU Bank | Transaction</title>
<link href="first.css" rel="stylesheet" />
<link href="transact.css" rel="stylesheet" />
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
</head>

<body>
    <nav class="navigation">
		<span class="nav-title">YU Bank</span>
		<a class="nav-home" href="index.html"><img src="images/home-link.png"></a>
	</nav>
	
	<div class="container">
	<%
    String cust_id = request.getParameter("Id");
	int id = Integer.parseInt(cust_id);
	String qr = "select * from Customer where Id = '"+ id +"';";
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(qr);
	if(rs.next())
	{
	%>
	<table class="table-details">
	    <tr>
	    <th class="cust-detail table-head" colspan="2">--- SENDER DETAILS ---</th>
	    </tr>
		<tr>
			<th class="table-head">Sender Id:</th>
			<td class="table-data"><%=rs.getString(1) %></td>
		</tr>
		<tr>
			<th class="table-head">Full Name:</th>
			<td class="table-data"><%=rs.getString(2) %></td>
		</tr>
		<tr>
			<th class="table-head">Email Id:</th>
			<td class="table-data"><%=rs.getString(3) %></td>
		</tr>
		<tr>
			<th class="table-head">Balance (Rs):</th>
			<td class="table-data"><%=rs.getString(4) %></td>
		</tr>
	</table>
	<% }
	String name = rs.getString(2);%>
	</div>
	
	<div class="container con-middle">
	    <h2 class="heading">Safe & Secure Transaction!</h2>
		<img class="trust-img" src="images/trust.png">
	</div>
	
	<div class="container">
	<%
	String query = "select FullName from Customer";
	Statement s = con.createStatement();
	ResultSet r = s.executeQuery(query);
	%>
	<box-icon name='down-arrow-circle' animation='burst' color='#7f1d1d' class="boxicon"></box-icon>
	<div class="form-box">
	<form action="CheckAmt.jsp" method="post">
	<label>From:</label><input value="<%=name %>" type="text" name="sender">
	<label>Enter Amount (Rs):</label>
	<input type="text" name="amt" placeholder="Enter amount" required autofocus>
	<label>To:</label>
	<select name="receiver" placeholder="select">
	<%
	while(r.next())
	{
	%><option><%=r.getString(1) %></option>
	<%
	}
	%>
	</select>
	<input type="submit">
	</form>
	</div>
		</div>
<a class="link link-active pages-link page-link1" href="customer.jsp">Go Back</a>
<a class="link link-active pages-link page-link2" href="history.jsp">View All Transactions</a>
</body>
</html>





