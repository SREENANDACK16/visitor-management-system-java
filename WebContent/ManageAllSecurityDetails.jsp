<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body
{
background: url("vmn11.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;
}
.contents
		{
		display:flex;
		flex-wrap:wrap;
		justify-content:space-between;
		}

 h2

{
 font-size:35px;
 text-align:center;
 
 color:black;
}

.contents table
{
background-color: #000;
width:70%;
border-collapse:collapse;
justify-content:right;   
color: white;
opacity: .9;



}
.contents th
{
padding:0;
margin:0;
font-size:20px;"
font-weight:bold;

}
.contents td
{
text-align:center;
font-size:16px;"
margin:1px;
color:white;
}
.contents form
{
margin-right:20px;
}
.sidebar input
{
margin-bottom:10px;
width:400px;
height:30px;
text-align:center;
}
.btn button
{
 width:98px;
height:30px;
color:black;
font-weight:bold;
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
 background:linear-gradient(to top, #09203f 0%, #537895 100%);
}
.previous a
{
 text-decoration:none;
 border:none ;
 color: white;
 justify-content:center;

}
 a i 
{
margin:0;
color:black;


}
i:hover 
{
background-color:#4e4ffa;

}
.btmspace-30
{
margin:0;

font-size:16px;
}
</style>
</head>
<body>

	<h2>MANAGE SECURITY OFFICERS</h2>
	
<div class="contents">
	
	<table border="2">
	
	<tr>
	<th>SECURITY ID</th>
	<th>NAME</th>
	<th>PHONE</th>
	<th>ADDRESS</th>
	<th>PASSWORD</th>
	
	
	</tr>
	<c:forEach var="s" items="${sList}">
	
	<tr>
	<td>${s.userid}</td>
	<td>${s.username}</td>
	<td>${s.phone}</td>
	<td>${s.address}</td>
	<td>${s.pswd}</td>
	
	
	
	
	</tr>
	
	</c:forEach>
	
	</table>
	
   
   <form action="PassServlet">
	<div class=sidebar>
	 <input type="text" name="userid" width="20" placeholder="Enter user id" required pattern=".{4,}" title="Please Enter User ID"/> <br>
	 <input type="text" name="username" width="20" placeholder="Enter username"/> <br>
	 <input type="text" name="phone" width="20" placeholder="Enter phone" /> <br>
	 <input type="text" name="address" width="20" placeholder="Enter address"/> <br>
	 <input type="text" name="pswd" width="20" placeholder="Enter password"/> <br>
	</div>
	<br>
	<div class=btn>
	<button style="background-color:firebrick" type="submit" value="Add Security" name="action">Add</button>
	<button style="background-color:firebrick" type="submit" value="Update Security" name="action">Update</button>
	<button style="background-color:firebrick" type="submit" value="Search Security" name="action">Search</button>
    <button style="background-color:firebrick" type="submit" value="Delete Security" name="action">Delete</button>
    
    
</div>
</form>

</div>
 <a href="Adminindex.jsp" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
</body>
</html>