<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin-search security</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body
{
background: url("vmn11.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;
}
 .contents h2

{
 font-size:35px;
 text-align:center;
 
 color:black;
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
padding-bottom:20px;
font-size:20px;"
}
.contents td
{
text-align:center;
font-size:18px;"
margin:1px;
color:white;
}
.previous 
{
margin-top:20px;
 margin-left:720px;
text-decoration:none;
 border:none ;
 width:110px;
 height:20px;
 color: white;
 justify-content:center;
 text-align:center;
 background-color:firebrick;
}
.previous a
{
 text-decoration:none;
 border:none ;
 color: white;
 justify-content:center;

}
</style>
</head>
<body>

<div class="contents">
	
	<h2>Security Details</h2>
	<table border="2">
	
	<tr>
	<th>Security ID</th>
	<th>Name</th>
	<th>Phone</th>
	<th>Address</th>
	<th>Password</th>
	
	
	</tr>
	
	
	<tr>
	<td>${Viewsec.userid}</td>
	<td>${Viewsec.username}</td>
	<td>${Viewsec.phone}</td>
	<td>${Viewsec.address}</td>
	<td>${Viewsec.pswd}</td>
	
	</tr>
	</table>
	</div>
 <div class="previous">
<a href="PassServlet?action=Security Details" >Home</a>
</div>
</body>
</html>