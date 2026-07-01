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

 h2

{
 font-size:35px;
 text-align:center;

 color:black;
}

.contents table
{
background-color: #000;
     
color: white;
opacity: .9;
width:100%;


}
.contents th
{
padding-top:20px;
padding-bottom:20px;
font-size:20px;
}
.contents td
{
text-align:center;
font-size:18px;"
margin:1px;
color:white;
}
.content2 input
{
align-item:center;
justify-content:center;
text-align:center;
margin-left:40%;
width:295px;
height:28px;
}
.btn
{
align-item:center;
justify-content:space-between;
text-align:center;

}
.btn1
{
width:130px;
height:30px;
background-color:firebrick;
color:black;
font-weight:bold;
}
.btn2
{
width:130px;
height:30px;
margin-left:9px;
color:black;
font-weight:bold;
background-color:firebrick;
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
<div class="contents">
	
	<h2>REGISTERED USER DETAILS</h2>
		
	 <form action="PassServlet" method="Get">
	 <a href="Adminindex.jsp?username=${sessionScope.username}&pwd=${sessionScope.pwd}" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a> (Total: ${UserRegCount})
    </form>
	<table border="2">
	
	<tr>
	
	<th>AADHAAR NO</th>
	<th>USER NAME</th>
	<th>ADDRESS</th>
	<th>MOBILE</th>
	<th>EMAIL ID</th>
	<th>PASSWORD</th>
	<th>CONF-PASSWORD</th>
	
	</tr>
	<c:forEach var="vr" items="${vrList}">
	
	<tr>
	
	<td>${vr.adharid}</td>
	<td>${vr.name}</td>
	<td>${vr.address}</td>
	<td>${vr.phone}</td>
	<td>${vr.emailid}</td>
	<td>${vr.pwd}</td>
	<td>${vr.cpwd}</td>
	
	
	
	</tr>
	
	</c:forEach>
	
	</table>
	</div>
	<c:if test="${UserRegCount == 0}">
    <p>No User found for the selected date.</p>
</c:if>
   <br>
<form action="PassServlet">
	<div class="content2">
	 <input type="text" name="adharid" width="20" placeholder="Enter Aadhaar ID" required pattern="[0-9]+" title="Number Only" /> <br><br>
	  </div>
	<div class="btn">
	<button class="btn1" type="submit" value="Search User" name="action">Search</button>
	
    
    
</div>
</form>

</body>
</html>