<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
     
      <%@ page import="java.io.InputStream" %>
     <%@ page import="java.util.Base64" %>
     <%@ page import="com.sea.vms.util.Base64Util" %>
     <%@ page import="com.sea.vms.bean.Pass" %>
     <%@ page import="java.io.ByteArrayOutputStream" %>
     <%@ page import="java.util.ArrayList" %>
    
   

<%
    ArrayList<Pass> p1 = (ArrayList<Pass>) request.getAttribute("pList");
%>

     
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
 
 color:Black;
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
font-size:20px;"
}
.contents td
{
text-align:center;
font-size:18px;"
margin:1px;
color:white;
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
 background-color:firebrick;
}
.previous a
{
 text-decoration:none;
 border:none ;
 color: black;
 justify-content:center;
 font-weight:bold;

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
<h2>ALL VISITED</h2>
	<div class="contents">
	 <form action="PassServlet" method="get">
	  <a href="Adminindex.jsp" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
    <label for="specificDate">Select Date:</label>
    <input type="date" name="specificDate" required />
    <button type="submit" name="action" value="Filter by Specific Date Pass">Filter</button>(Total: ${visitCount})
   </form>
	<table border="2">
	
	<tr>
	<th>PASS ID</th>
	<th>AADHAAR ID</th>
	<th>VISITOR NAME</th>
	<th>COMPANY</th>
	<th>DOCUMENT</th>
	<th>IN DATE</th>
	<th>OUT DATE</th>
	<th>REASON</th>
	<th>PHOTO</th>
	<th>DOCUMENT</th>
	<th>STATUS</th>
	
	</tr>
	<c:forEach var="p" items="${pList}">
	
	<tr>
	<td>${p.passid}  </td>
	<td>${p.adharid}  </td>
	<td>${p.vname}  </td>
	<td>${p.company}  </td>
	<td><a href="data:application/pdf;base64,<c:out value="${p.doc}"/>">Download Document</a></td>
	<td>${p.fdate}  </td>
	<td>${p.tdate}  </td>
	<td>${p.reason}  </td>
	<td>  
                    <img src="data:image/jpeg/jpg;base64,<c:out value="${p.imageBase64}"/>" alt="Photo" width="60"/>
             </td>
	<td>  
                            <img src="data:application/pdf;base64,${p.documentBase64}" alt="Image" width="60"/>
                      </td>
	<td>${p.status}</td>
	
	</tr>
      
	
	</c:forEach>
	</table>
	
</div>
 <div class="previous">
<a href="Adminindex.jsp" >Home</a>
</div>
</body>
</html>