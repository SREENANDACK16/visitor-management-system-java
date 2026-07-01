<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
	
	body
		{
		
          background: url("wallpap1.jpg"); no-repeat;
		background-attachment:fixed;
		background-size:100% 100%;
			

		}
		
		
		.navmenu .nav
		{
		text-align:center;
		margin-top:25px;
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
			margin-right: 5rem;
			font-weight: bolder;
			color: white;
			text-decoration:none;
			letter-spacing:3px;
			
			
			
			
		}
		
		.navmenu .nav a:hover
		{
		curser:pointer;
		color:red;
		}
		

		
</style>
<title>AdminHome</title>
</head>
<body>


   
   
	
     
		<div class="navmenu" id="menu-bar" >

		<nav class="nav">
		    <a href="PassServlet?action=Visitor Register">VIEW USER REGISTER</a>
			<a href="PassServlet?action=Visitor Applications">VIEW VISITORS APPLICATIONS</a>
			<a href="PassServlet?action=Visited Details">VIEW VISITED DETAILS</a>
			<a href="PassServlet?action=Security Details">VIEW SECURITY DETAILS</a>
			
		</nav>
	</div>

		
	
</body>
</html>