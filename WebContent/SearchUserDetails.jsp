<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Admin-sec--SearchVisitor</title>
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
	
	<h2>REGISTERED USER DETAILS</h2>
	<table border="2">
	
	<tr>
	
	<th>Aadhaar No</th>
	<th>USER Name</th>
	<th>ADDRESS</th>
	<th>MOBILE NO</th>
	<th>EMAIL ID</th>
	<th>PASSWORD</th>
	<th>CONF-PASSWORD</th>
	
	</tr>
	
	
	<tr>
	
	<td>${Viewu.adharid}</td>
	<td>${Viewu.name}</td>
	<td>${Viewu.address}</td>
	<td>${Viewu.phone}</td>
	<td>${Viewu.emailid}</td>
	<td>${Viewu.pwd}</td>
	<td>${Viewu.cpwd}</td>
	
	
	
	</tr>
	</table>
	</div>
 <div class="previous">
<a href="PassServlet?action=Visitor Register" >Home</a>
</div>
</body>
</html>