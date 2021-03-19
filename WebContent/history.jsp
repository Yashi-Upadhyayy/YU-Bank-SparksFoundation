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
			<li class="list-item-inline"><a class="link link-nav" href="customer.jsp"> Customers</a></li>
			<li class="list-item-inline"><a class="link link-nav link-active" href="history.jsp">History</a></li>
		</ul>
	</nav>
	<h2>---------------------------- Record of all the Transactions ----------------------------</h2>
	<%
String qr = "select * from History";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(qr);
if(rs.next())
{
	%>
	<table class="custList">
		<tr>
			<th>Sender's Id</th>
			<th>Sender's Name</th>
			<th>Amount</th>
			<th>Receiver's Id</th>
			<th>Receiver's Name</th>
			<th>Time</th>
		</tr>
		<% do { %>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
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