<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Initiator-View Visitor</title>
<style>
body
{
background: url("visit_wall1.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;

}
.contents
{
padding-top:20px;
text-align:center;
}
.contents h2
{
color:white;
font-size:35px;
}
.contents table
{
width:100%;
background-color: #000;
     
      color: white;
      opacity: .9;

}
.contents table  th 
{

height:50px;
margin-top:50px;
font-size:17px;

}
.contents table  td 
{

height:40px;
margin-top:50px;
color:white;
}
.photo
{
display:inline-block;
margin-top:20px;

}


.document
{
display:inline-block;
margin-top:20px;

}

 .btn2
{
display: inline-block;
			padding:5px 35px;
			border: solid 1px;
			color: white;
			background-color:firebrick;
			cursor: pointer;
			font-size: 18px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-top: 23px;
			margin-left:4px;
			justify-content:center;
			text-decoration: none;		
}

 .btn3
{
display: inline-block;
			padding:5px 35px;
			border: solid 1px;
			color: white;
			background-color:firebrick;
			cursor: pointer;
			font-size: 18px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-top: 23px;
			margin-left:20px;
			justify-content:center;
			text-decoration: none;
			
}
 .btn4
{
display: inline-block;
			padding:5px 35px;
			border: solid 1px;
			color: black;
			background-color:silver;
			cursor: pointer;
			font-size: 18px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-top: 23px;
			margin-left:20px;
			justify-content:center;
			text-decoration: none;
			
}

.back-nav a i 
{
margin:0;
color:black;


}
.back-nav i:hover 
{
background-color:#white;

}
.btmspace-30
{
margin:0;

font-size:16px;
}
</style>


<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="contents">
	
	<h2>VIEW PASS APPLICATION</h2>
	<table border="2">
	
	<tr>
	<th>Pass ID</th>
	<th>Aadhaar No</th>
	<th>Visitor Name</th>
	<th>Comapny Name</th>
	<th>Decuments</th>
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
	
   <form action="PassServlet" method="Post" enctype="multipart/form-data">
        
        <a href="webcam.html" class="btn2">Capture Photo</a>
	
        <a href="docscan.html?adharid=${View.adharid}&name=${View.vname}" class="btn3">Scan Document</a>
      
        <a href="Biometric.jsp" class="btn4">Biometric Authentication</a>
        </form>
        <div class="back-nav">
	<a href="Initiator.jsp" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
	</div>
	
	

</body>
</html>