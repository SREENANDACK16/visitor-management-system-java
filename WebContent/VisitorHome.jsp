<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body
{
background: url("vmn12.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;
}
.heading
{
color:white;
font-size:30px;
font-decoration:italic;
text-align:center;
margin-top:3%;
letter-spacing:8px;
}

.btmspace-30
{
color:black;
font-size:22px;
margin-left:700px;
margin-top:11px;
cursor:pointer;
}
.btn1
		{
			display: inline-block;
			padding:14px 55px;
			border: none;
			color: white;
			background-color:navy;
			cursor: pointer;
			font-size: 20px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-top: 50px;
			margin-left:20px;
			justify-content:center;
			text-decoration: none;
			
		}
		
	
		.btn4
		{
		 margin-right:36px;
			display: inline-block;
			padding:10px 45px;
			border: none;
			color: white;
			background-color:navy;
			cursor: pointer;
			font-size: 20px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-left:24px;
			margin-top:49px;
			justify-content:center;
			text-decoration: none;
		}
		input
		{
		margin-right:26px;
		display: inline-block;
			padding:8px 45px;
			
			font-size: 15px;
			
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-left:410px;
			margin-top: 18px;
		}
	

     
</style>
</head>

<body>
 <a href="Visitor.jsp" class="btn1">Pass Register</a><br>
<div class="heading">
<h1>HAL AIRCRAFT DIVISION</h1>
</div>

<form  action="PassServlet" method="get">
<input type="text" name="adharid" placeholder="Enter Your Aadhaar No" required />
<button class="btn4" type="submit" name="action" value="Print Details" >Download Temporary Pass</button><br><br>
<a href="index.html"><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
</form>



</body>
</html>