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
	
	<h2>VISITOR DETAILS</h2>
	<table border="2">
	
	<tr>
	<th>Pass ID</th>
	<th>Aadhaar No</th>
	<th>Visitor Name</th>
	<th>Company Name</th>
	<th>Documents</th>
	<th>Visit Date</th>
	<th>Exit Date</th>
	<th>Reason for Visit</th>
	
	</tr>
	
	
	<tr>
	<td>${View.passid}</td>
	<td>${View.adharid}</td>
	<td>${View.vname}</td>
	<td>${View.company}</td>
	<td>${View.doc}</td>
	<td>${View.fdate}</td>
	<td>${View.tdate}</td>
	<td>${View.reason}</td>
	
	
	
	</tr>
	</table>
	</div>
 <div class="previous">
<a href="PassServlet?action=Visitor Applications" >Home</a>
</div>
</body>
</html>