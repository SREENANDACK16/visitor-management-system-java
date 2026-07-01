<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<style>

	body
{
background: url("sw.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;
}
form
{
width:460px;
height:240px;
margin-left:520px;
background-color: #000;
     
      color: white;
      opacity: .9;

}
.heading
{
margin-top:150px;

font-size:20px;
text-align:center;
}
.content
{
padding:6px;
font-size:18px;
border-radius:4px;
}
.content label
{
width:170px;
font-size:22px;
display: inline-block;
padding-left:20px;
}
.content input 
{
padding-top:7px;
width:236px;
height:30px;
margin-top:20px;
text-align:center;

}
.content select
{
padding-top:6px;
width:240px;
height:40px;
margin-top:20px;
text-align:center;

}

.content button 
{
margin-top:10px;
padding-top:6px;
width:245px;
height:40px;
align:right;
margin-left:190px;
border:none;
 background-color:firebrick;
color:white;

}	
		
	</style>
</head>
<body>
<div class="heading">
<h1>SECURITY LOGIN</h1>
 </div>
<form action="PassServlet">

 <div class="content">
  <label>User ID:</label><input type="text" name="userid" placeholder="Enter User ID" required  title="Please Enter valid User ID" /> <br><br>
  <label>Password:</label><input type="text" name="pswd" placeholder="Enter Password" required pattern=".{4,}" title="Please Enter 4 or more Characters"/> <br><br>
 <button type="submit" name="action" value="Security Login" >Login</button>
</div>
</form>

</body>
</html>