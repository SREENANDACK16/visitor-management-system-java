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
	
	<h2>ALL PASS APPLICATIONS</h2>
		
	 <form action="PassServlet" method="Get">
	 <a href="Adminindex.jsp?username=${sessionScope.username}&pwd=${sessionScope.pwd}" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
        <label for="specificDate">Select Date:</label>
        <input type="date" name="specificDate" required />
        
        
        
        <button type="submit" name="action" value="Filter by Specific Date">Filter</button>(Total: ${applicationCount})
    </form>
	<table border="2">
	
	<tr>
	<th>PASS ID</th>
	<th>AADHAAR NO</th>
	<th>VISITOR NAME</th>
	<th>COMPANY</th>
	<th>DOCUMENT</th>
	<th>IN DATE</th>
	<th>OUT DATE</th>
	<th>REASON FOR VISIT</th>
	
	</tr>
	<c:forEach var="v" items="${vList}">
	
	<tr>
	<td>${v.passid}</td>
	<td>${v.adharid}</td>
	<td>${v.vname}</td>
	<td>${v.company}</td>
	<td>${v.doc}</td>
	<td>${v.fdate}</td>
	<td>${v.tdate}</td>
	<td>${v.reason}</td>
	
	
	
	</tr>
	
	</c:forEach>
	
	</table>
	</div>
	<c:if test="${applicationCount == 0}">
    <p>No visitors found for the selected date.</p>
</c:if>
   <br>
<form action="PassServlet">
	<div class="content2">
	 <input type="text" name="passid" width="20" placeholder="Enter Pass ID" required pattern="[0-9]+" title="Number Only" /> <br><br>
	  </div>
	<div class="btn">
	<button class="btn1" type="submit" value="Search Visitor" name="action">Search</button>
    
    
</div>
</form>

</body>
</html>