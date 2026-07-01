<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
body
{
background: url("vmn12.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;
}
form
{

align-items:center;
justify-content:center;
margin-top:30px;
margin-left:30%;

}
.heading1
{

font-size:20px;
text-align:center;
}
.content
{
background-color: #000;
     
      color: white;
      opacity: .9;
      width: 600px;
      height: 500px;

}
.content label
{
width:250px;
margin-left:45px;
font-size:25px;
display: inline-block;
}
.btmspace-30 
{
font-size:22px;
color:silver;
margin-left:72px;
padding-top:18px;
cursor:pointer;
}
.content input 
{
padding-top:6px;
width:240px;
height:30px;
margin-top:20px;
text-align:center;

}
.content textarea 
{
padding-top:6px;
width:240px;
margin-top:20px;

}
.content button 
{
padding-top:4px;
width:245px;
height:40px;
align:right;
margin-left:200px;
color: white;
border: none;
background-color:firebrick;

}

</style>
<script type="text/javascript">
window.onload = function() {
    var dtToday = new Date();

    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    
    if (month < 10)
        month = '0' + month.toString();
    if (day < 10)
        day = '0' + day.toString();

    var minDate = year + '-' + month + '-' + day;

    // Set min attribute for the in-date and out-date inputs
    document.getElementById('txtDate').setAttribute('min', minDate);
    document.getElementById('txtOutDate').setAttribute('min', minDate);

    // Update out-date minimum based on selected in-date
    document.getElementById('txtDate').addEventListener('change', function() {
        document.getElementById('txtOutDate').setAttribute('min', this.value);
    });
};
</script>
<title>apply pass</title>
</head>
<body>

<div class="heading1">
<h1>PASS REGISTER</h1>
</div>
<form action="PassServlet">
<%Long adharid=(Long) session.getAttribute("adharid");
            %>
            <%String name=(String) session.getAttribute("name");
            %>
<div class="content">
 <label>Aadhaar No:</label><input type="text" name="adharid" placeholder="Enter Aadhaar No" value="${sessionScope.adharid}" pattern="[0-9]{12}" title="Please Enter valid Aadhaar No"/> <br>
 <label>Visitor Name:</label><input type="text" name="vname" placeholder="Enter Visitor Name" value="${sessionScope.vname}" required="" title="please Enter Your Name"/><br>
 <label>Company Name:</label><input type="text" name="cname" placeholder="Enter Company Name & Address" required pattern=".{15,}" title="Please Enter Company name with Address" ><br>
 <label>Identity Proof:</label><input type="file" name="doc" accept="image/*" title="please upload a valid file" required="" /><br>
 <label>In Date:</label><input type="date" name="fromdate" id="txtDate" required="" ><br>
 <label>Out Date:</label><input type="date" name="todate" id="txtOutDate" required=""><br>
 <label>Reason for Visit:</label><input name="reason" required pattern=".{15,}" title="Please Enter Reason for Visit & Department,Person,Block in Detail"/><br>
 <a href="VisitorIndex.jsp"><i class="btmspace-30 fa-2x fas fa-chevron-circle-left"></i></a><button type="submit" name="action" value="Apply" >Apply</button><br>
 
</div>
</form>
</body>
</html>