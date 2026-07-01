<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body
{
background: url("wallpap1.jpg"); no-repeat;
}
.heading
{
color:silver;
font-size:30px;
font-decoration:italic;
text-align:center;
margin-top:10%;
letter-spacing:8px;
}
.box1 {
	display: inline-block;
      background-color: #000;
      color: white;
      opacity: .7;
      width: 100%;
      height: 110px;
      margin-top: 0;
      }
.btn1
		{
			display: inline-block;
			padding:16px 55px;
			border: none;
			color: white;
			background:linear-gradient(to top, #09203f 0%, #537895 100%);
			cursor: pointer;
			font-size: 23px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-top: 23px;
			margin-left:380px;
			justify-content:center;
			text-decoration: none;
			
		}
		
		.btn2
		{
			display: inline-block;
			padding:16px 55px;
			border: none;
			color: white;
			background:linear-gradient(to top, #09203f 0%, #537895 100%);
			cursor: pointer;
			font-size: 23px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
		
			margin-right:26px;
			justify-content:center;
			text-decoration: none;
			margin-left:28px;
		}
		.btn3
		{
			display: inline-block;
			padding:16px 55px;
			border: none;
			color: white;
			background:linear-gradient(to top, #09203f 0%, #537895 100%);
			cursor: pointer;
			font-size: 23px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
		    margin-right:26px;
		   
			
			justify-content:center;
			text-decoration: none;
		}
		.btn4
		{
		 margin-right:26px;
			display: inline-block;
			padding:16px 55px;
			border: none;
			color: white;
			background:linear-gradient(to top, #09203f 0%, #537895 100%);
			cursor: pointer;
			font-size: 23px;
			border-radius: 3px;
			position: relative;
			overflow: hidden;
			z-index: 0;
			margin-left:28px;
			margin:0px;
			justify-content:center;
			text-decoration: none;
		}
	

     
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="heading">
<h1>HAL AIRCRAFT DIVISION</h1>
</div>
 <div class="box1">

<a href="VisitorHome.jsp" class="btn1">Visitor</a>
<a href="Initiator.jsp" class="btn2">Initiator</a>
<a href="SecurityLogin.jsp" class="btn3">security</a>
<a href="AdminHome.jsp" class="btn4">Admin</a>
</div>

</body>
</html>