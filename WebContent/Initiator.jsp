<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Initiator</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
body
{
background: url("visit_wall1.jpg"); 
background-attachment:fixed;
		background-size:100% 100%;
overflow-x:hidden;
}
.section1
{
background-color: #000;
     
color: white;
opacity: .9;
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
color: white;
border: none;
background-color:firebrick;
}


.section2 label
{
 width:250px;
 font-size:20px;
 font-weight:bold;
 margin-left:450px;
 display: inline-block;
 color:black;
 
}

.section2 input
{

margin-top:60px;
text-align:center;
width:350px;
height:35px;

}
.section2 select
{
width:360px;
height:35px;
margin-left:700px;

}
.btn1
{
width:170px;
height:35px;
display:inline-block;
justify-content:space-between;
position: relative;
margin-right:14px;
color: white;
border: none;
background-color:firebrick;
margin-left:700px;



}
.filename
{
margin-left:720px;
color:white;
}
 a i 
{
margin:0;
color:white;


}
 i:hover 
{
background-color:#4e4ffa;

}
.btmspace-30
{
margin:0;
margin-left:120px;
font-size:16px;
}

</style>
<script type="text/javascript">
window.onload = function() {
function refreshImageAndDocument() {
    var image = document.getElementById('image');
    var document = document.getElementById('document');
 
    
    // Generate unique URLs to prevent caching
    var imageUrl = '<%= request.getContextPath() %>/images/image.png?t=' + new Date().getTime();
    var documentUrl = '<%= request.getContextPath() %>/Doc/doc.png?t=' + new Date().getTime();
    
    // Update the src attributes
    image.src = imageUrl;
    document.src = documentUrl;

}

// Automatically refresh previews every 1 seconds
setInterval(refreshImageAndDocument, 1000);
};

</script>
<title>Initiator</title>

</head>
<body>
      
      
	  <form  action="PassServlet" method="get">
	  <div class="section1">
         <input type="text" name="adharid" placeholder="Enter Aadhaar No" required pattern="[0-9]{12}" title="Please Enter valid Aadhaar No" /> 
        <button type="submit" name="action" value="check detail" >View Pass Application</button>
        </div>
          
  
    </form>
    
       
       
       
       <div class="section2">
       
       <form action="PassServlet" method="Post" enctype="multipart/form-data">
        
       
    
       
        <label>Pass ID:</label><input type="text" name="passid" placeholder="Enter Pass No" required pattern="[0-9]+" title="Please enter valid pass no" /> <br><br>
        
        <label for="image">Photo:</label> 
        <input type="file" id="image" name="image" required>
   <!--   <img id="image" src="<%= request.getContextPath() %>/images/image.png" alt="photo" width="60px" height="60px">-->
      
      <br>
      
      <!-- Document Preview and Filename -->
      <label for="document">Document:</label>
      <input type="file" id="document" name="document" required>
       <!-- <img id="document" src="<%= request.getContextPath() %>/Doc/doc.png" alt="Document" width="60px" height="60px">-->
      
      <br>
        <select id="status" name="status"> <br>
        <option value="Waiting">Visitor Status</option>
            <option value="Waiting">Waiting</option>
            <option value="Approved">Approved</option>
           
        </select> 
       <br> <br>
        <button class="btn1" type="submit" name="action" value="Upload details" >Upload Details</button>
        <a href="index.html" ><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a>
        </form>
         
	
	
	
        </div>

</body>
</html>