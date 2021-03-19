<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@include file="db.jsp"%>
<%@page errorPage="error.jsp"%>
<%@page import="java.text.SimpleDateFormat, java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>YU BANK | Checking</title>
<link href="checkamt.css" rel="stylesheet" />
</head>
<body>
<%
String sender = request.getParameter("sender");
String amt = request.getParameter("amt");
int amount = Integer.parseInt(amt);
String receiver = request.getParameter("receiver");
String qr = "select Available_Balance from Customer where FullName = '"+ sender +"';";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(qr);
if(rs.next())
{
	String s = rs.getString(1);
	int x = Integer.parseInt(s);
    if(amount > x)
    {
    %>
<script type="text/javascript">alert("Insufficient Balance!!");</script>
<div><a href="customer.jsp">Try Again!</a></div>
<% }
    else
    	{
String sel = "select Id from customer where FullName='"+sender+"';";
String sel2 = "select Id from customer where FullName='"+receiver+"';";
Statement s1 = con.createStatement();
ResultSet r = s1.executeQuery(sel);
r.next();
int cid = r.getInt(1);
Statement s2 = con.createStatement();
ResultSet r2 = s2.executeQuery(sel2);
r2.next();
int rid = r2.getInt(1);

SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
String currTime = sdf.format(date);

String q = "insert into History values(?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(q);
ps.setInt(1, cid);
ps.setString(2, sender);
ps.setInt(3, amount);
ps.setString(5, receiver);
ps.setInt(4, rid);
ps.setString(6, currTime);
int i = ps.executeUpdate();

String str = "update customer set Available_Balance = Available_Balance-"+amount+" where FullName = '"+sender+"';";
String str2 = "update customer set Available_Balance = Available_Balance+"+amount+" where FullName = '"+receiver+"';";
Statement state = con.createStatement();
int a = state.executeUpdate(str);
Statement stat = con.createStatement();
int b = stat.executeUpdate(str2);
%>
<script type="text/javascript">alert("Transaction Successful!!");</script>
<div><a href="history.jsp">Check History</a></div>
<% 
}} 
con.close();%>
</body>
</html>



























