<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
body
{
background: url("vmn12.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;
}
.details
{
background-color: #000;
     
      color: white;
      opacity: .9;
      width: 400px;
      height: 250px;
      margin-left:38%;
      margin-top:10%;
      text-align:center;
      border:2px black;

}
 input 

{
    background-color: black;
      border:none ;
      color: white;
      opacity: .9;
      text-align:center;
}
.details button
{
 text-decoration:none;
 border:none ;
 color: white;
 justify-content:center;
 
text-decoration:none;
 border:none ;
 width:150px;
 height:20px;
 color: white;
 justify-content:center;
 background-color:firebrick;
}
.details p
{
padding-top:10px;
font-size:30px;
font-weight:bold;
color:firebrick;
}
.details h1
{
font-size:16px;

}
</style>

</head>
<body>

<div class="details">
<p>Verify Your Details</p>
<form  action="PassServlet" method="Get">

<h1>Your Aadhaar ID is:</h1><input type="text" name="adharid" value="${sessionScope.adharid}"readonly/>
<h1>Your User Name is:</h1><input type="text" name="adharid" value="${sessionScope.vname}"readonly/>
<br><br>
<button type="submit" name="action" value="ViewMyappli" >OK</button>
</form>
</div>


</body>
</html>