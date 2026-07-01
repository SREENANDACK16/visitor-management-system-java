<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />	<style>
	
	body
		{
		
          background: url("vmn12.jpg"); no-repeat;
		background-attachment:fixed;
		background-size:100% 100%;
			

		}
		
		
		.navmenu .nav
		{
		text-align:right;
		margin-top:15px;
		background-color: #000;
       padding-top:40px;
      color: white;
      opacity: .9;
      width: 100%;
      height: 40px;
      letter-spacing:66px;
		
		}
		
		 .navmenu .nav a
		{
            
			font-size: 16px;
			margin-right: 2rem;
			font-weight: bolder;
			color: white;
			text-decoration:none;
			letter-spacing:1px;
			
			
			
			
		}
		
		.navmenu .nav a:hover
		{
		curser:pointer;
		color:red;
		}
		.topbar a
		
		{
		text-decoration:none;
		border:solid 2px;
		color:black;
		font-weight:bold;
		}
		.fas
		{
		font-size:14px;
		font-weight:bold;
		text-align:right;
		}

		
</style>
<title>Visiter Index</title>
</head>
<body>

<div class="topbar">
		<a href="PassServlet?action=Signout" >Log out</a>
	    <i class="fas fa-user"></i>${sessionScope.vname}
	    
   </div>
   
   
	

     
		<div class="navmenu" id="menu-bar" >

		<nav class="nav">
		<form action="PassServlet" Method="Get">
		<input type="hidden" name="adharid" value="${sessionScope.adharid}" /> 
       
			<a href="Visitor.jsp">APPLY FOR VISIT</a>
			<a href="VerifyAdhar.jsp">MY PASS APPLICATIONS</a>
			</form>
			</nav>
			
  
	</div>
	
		
	
</body>
</html>