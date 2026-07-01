<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body
{
background: url("sw.jpg"); 
background-attachment:fixed;
		background-size:100% 100%;

overflow-x:hidden;
}
 i
      {
      
      
      color:white;
      }
      
        a
        {
        text-decoration:none;
        font-weight:bold ;
        color:white;
        border:solid black;
       font-size:12px;
        background-color:black;
        opacity: .7;
        }
        a:hover {
            background-color: navy;
            border-color:navy;
        }
.section1
{
background-color: #000;
     
      color: white;
      opacity: .7;

padding-top:80px;
width:100%;
height:150px;

}
.section1 input
{
margin-left:470px;
margin-top:60px;
text-align:center;
width:350px;
height:35px;
}
.section1 button
{
width:160px;
height:35px;
border:none;
 justify-content:center;
background-color:firebrick;
color:white;
}

</style>

<meta charset="ISO-8859-1">
<title>security-home</title>
</head>
<body>
 <a href="PassServlet?action=Signout" ><i class="fas fa-user fa-1x"></i>Log out</a>
<div class="section1">
	  <form  action="PassServlet" method="get">
         <input type="text" name="passid" placeholder="Enter Pass No" required pattern="[0-9]+" title="Please enter valid pass no" /> 
        <button type="submit" name="action" value="View Pass" >View Pass</button>
        </form>
       </div>

</body>
</html>