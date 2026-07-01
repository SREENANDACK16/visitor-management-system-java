<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Date" %>
      <%@ page import="java.io.InputStream" %>
     <%@ page import="java.util.Base64" %>
     <%@ page import="com.sea.vms.util.Base64Util" %>
     <%@ page import="com.sea.vms.bean.Pass" %>
     <%@ page import="java.io.ByteArrayOutputStream" %>
    
    <%
    Pass pass1=new Pass();
     pass1 = (Pass) request.getAttribute("vp");
    
%>
  
<!DOCTYPE html>
<html>
<head>
<title>Security- View Pass Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
body
{

background: url("sw.jpg"); no-repeat;
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
      opacity: .9;
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
      opacity: .9;
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
			background-color:firebrick;
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
			background-color:firebrick;
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
<title>Insert title here</title>
</head>
<body>
<form  action="PassServlet" method="get">
<%
        // Create a SimpleDateFormat instance with the desired format
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // Get the current date and time
        Date now = new Date();
        // Format the current date and time
        String formattedDate = sdf.format(now);
    %>


<div class="contents">
	
	<h2>PASS DETAILS</h2>
	<p class="para1">Current Date&Time: <%= formattedDate %></p>
	<p class="para2">Pass ID:<input type="text" name="passid" value="${vp.passid}" /></p>
	<table border="2">

	<tr>
	
	<th>Adhaar ID</th>
	<th>Visitor Name</th>
	<th>Company Name</th>
	<th>Document No</th>
	<th>Visit Date</th>
	<th>Exit Date</th>
	<th>Reason for Visit</th>
	<th>Photo</th>
	<th>Document</th>
	<th>Status</th>
	</tr>
	
	
	<tr>
	
	<td>${vp.adharid}</td>
	<td>${vp.vname}</td>
	<td>${vp.company}</td>
	<td><a href="data:application/pdf;base64,<c:out value="${vp.doc}"/>">Download Document</a></td>
	<td>${vp.fdate}</td>
	<td>${vp.tdate}</td>
	<td>${vp.reason}</td>
	
	<td>
	  <% if (pass1.getImageBase64() != null) { %>
                    <img src="data:image/jpeg/jpg;base64,<c:out value="${vp.imageBase64}"/>" alt="Photo" width="100"/>
                <% } %>
              
     </td>
	<td><% if (pass1.getDocumentBase64() != null) { %>
                    <img src="data:application/pdf;base64,<c:out value="${vp.documentBase64}"/>"alt="Document" width="100">
                <% } %></td>
	<td>${vp.status}</td>
	
	</tr>
	
	
	
	</table>
	</div>
	
	
	
	
           <div class="back-nav" >
	<a href="Security.jsp" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
	</div>
     <a href="ClosePass.jsp" class="btn1">Update</a>
       <button class="btn2" type="submit" name="action" value="Print Pass" >Print Pass</button>
       </form>
</body>
</html>