<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.sea.vms.bean.Pass" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Update pass</title>
<style>
body
{
background: url("sw.jpg"); 
background-attachment:fixed;
		background-size:100% 100%;

}
.section
{
background-color: #000;
      margin-left:400px;
      margin-top:130px;
      color: white;
      opacity: .9;
      width: 45%;
      height: 360px;
}
.section h1
{
text-align:center;
padding-top:25px;

justify-content:center;
}
.section label
{
 width:250px;
 font-size:20px;
 font-weight:bold;
 padding-left:40px;
 display: inline-block;
 color:white;
 
}
.section input
{

margin-top:60px;
text-align:center;
width:350px;
height:35px;
}
.section select
{
width:350px;
height:35px;
margin-left:295px;
}
.section button
{
width:160px;
height:35px;
background-color:firebrick;
color:white;
border:none;
margin-left:1px;
}
i 
{
color:white;
font-weight:bold;

}
 i:hover 
{
background-color:#4e4ffa;

}
.btmspace-30
{
margin-left:300px;
font-size:16px;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 
       <div class="section">
       <h1>UPDATE PASS APPLICATION</h1>
       <form action="PassServlet" method="Post" enctype="multipart/form-data">
       
       
        <label>Pass ID:</label><input type="text" name="passid" placeholder="Enter Pass No" required pattern="[0-9]+" title="Please enter valid pass no" /> <br><br>
       
        <select id="status" name="status"> <br>
        <option value="Waiting">Visitor Status</option>
            <option value="Waiting">Waiting</option>
            <option value="Approved">Approved</option>
            <option value="Closed">Closed</option>
        </select> 
       <br> <br>
        
	<a href="Security.jsp" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
	
        <button type="submit" name="action" value="Close Pass" >Close Pass</button>
        </form>
        </div>
</body>
</html>