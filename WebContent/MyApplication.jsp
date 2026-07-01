<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Date" %>
      <%@ page import="java.io.InputStream" %>
     <%@ page import="java.util.Base64" %>
     <%@ page import="com.sea.vms.util.Base64Util" %>
     <%@ page import="com.sea.vms.bean.MyApplication" %>
     <%@ page import="java.io.ByteArrayOutputStream" %>
    
   
  
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
body
{

 background: url("vmn12.jpg"); no-repeat;
		background-attachment:fixed;
		background-size:100% 100%;
}
.contents
{
 width:100%;

}
.contents h2

{
 font-size:35px;
 text-align:center;
 
}
.para1
{
 font-size:16px;
 font-weight:bold;
 text-align:left;
 background-color: black;
      color: white;
      border:none;
      opacity: .7;
      width:420px;
 letter-spacing:1px;
}
.para2
{
 font-size:16px;
 font-weight:bold;
 text-align:left;
 background-color: black;
      color: white;
      border:none;
      opacity: .7;
      width:270px;
 letter-spacing:1px;
}
.para2 input
{
 background-color: black;
      color: white;
opacity: .6;
border:none;
}
.contents table
{
background-color: #000;
      color: white;
      opacity: .9;

width:100%;


}
.contents th
{
padding-top:20px;
font-size:20px;"
}
.contents td
{
text-align:center;
font-size:18px;"
margin:1px;
color:white;
}
.btn1 
{
            display: inline-block;
			padding:15px 61px;
			border: 2px solid gray;
			color: white;
			border:none;
			font-weight:bold;
			background-color:navy;
			text-decoration: none;
			margin-top:23px;
			margin-right:30px;
			margin-left:530px;
}
.btn2 
{
            display: inline-block;
			padding:16px 55px;
			border: 2px solid gray;
			color: white;
			border:none;
			background-color:Firebrick;
			font-weight:bold;
			cursor:pointer;
			
}
.back-nav i 
{
color:black;
font-weight:bold;

}
.back-nav i:hover 
{
background-color:silver;

}
.btmspace-30
{
margin-top:10px;
font-size:20px;
}



</style>
<meta charset="ISO-8859-1">
<title>visitor-my pass application</title>
</head>
<body>
<form  action="PassServlet" method="Get">


<div class="contents">
	
	<h2>MY APPLICATIONS</h2>
	

	<p class="para2"></p>
	<table border="2">

	<tr>
	
	
	<th>Pass ID</th>
	<th>Visit Date</th>
	<th>Exit Date</th>
	<th>Reason for Visit</th>
	<th></th>
	
	</tr>
	
	<c:forEach var="my" items="${maList}">
	<tr>
	

	<td>${my.passid}<input type="hidden" name="passid" value="${my.passid}" /></td>
	<td>${my.fdate}</td>
	<td>${my.tdate}</td>
	<td>${my.reason}</td>
	<td><form action="PassServlet" method="get">
                            <input type="hidden" name="action" value="mypass">
                            <input type="hidden" name="passid" value="${my.passid}">
                            <button type="submit">Download Pass</button>
                        </form>
                        </td>
	
	</tr>
	
	</c:forEach>
	
	</table>
	</div>
	
	
	
	
           <div class="back-nav" >
	<a href="VisitorIndex.jsp" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
	</div>
     
       </form>
</body>
</html>