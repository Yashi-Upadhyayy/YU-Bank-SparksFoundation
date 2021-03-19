<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="db.jsp"%>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>YU Bank | Customers</title>

<meta content="" name="description">
<meta content="" name="keywords">

<link href="first.css" rel="stylesheet" />
<link href="customer.css" rel="stylesheet" />
</head>

<body>
	<nav class="navigation">
		<span class="nav-title">YU Bank</span>
		<ul class="list-dis">
			<li class="list-item-inline"><a class="link link-nav" href="index.html">Home</a></li>
			<li class="list-item-inline"><a class="link link-active link-nav" href="customer.jsp"> Customers</a></li>
			<li class="list-item-inline"><a class="link link-nav" href="history.jsp">History</a></li>
		</ul>
	</nav>
	
	<h2>---------------------------- Details of all the Customers ----------------------------</h2>
	<h3>( Select the one who wants to perform the transaction )</h3>
	<%
String qr = "select * from Customer";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(qr);
if(rs.next())
{
	%>
	<table class="custList">
		<tr>
			<th>Customer Id</th>
			<th>Full Name</th>
			<th>Email Address</th>
			<th>Total Balance (Rs)</th>
			<th></th>
		</tr>
		<% do { %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><a class="trans-btn" href="transaction.jsp?Id=<%=rs.getString(1) %>">Transfer Money</a></td>
		</tr>
		<%
    }while(rs.next());
    %>
	</table>
	<%
}
%>

</body>
</html>