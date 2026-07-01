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
form
{
width:560px;
height:100%;
margin-left:470px;
background-color: #000;
     
      color: white;
      opacity: .9;

}
.heading
{
margin-top:30px;

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

padding-top:2px;
width:256px;
height:30px;
margin-top:18px;
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
width:259px;
height:30px;
align:right;
margin-left:190px;
border:none;
 background-color:firebrick;;
color:white;

}	
.container p

{

text-align:center;
}
.container a
{
color:firebrick;
}
		
	</style>
	
	<script type="text/javascript">
	function validation()
	{
		var regex="^[2-9]{1}[0-9]{3}\\s{1}[0-9]{4}\\s{1}[0-9]{4}$";
		var x=document.getElementById("txtadhar").value;
		if(regex.test(x)){
			window.alert("your valid adhar no");
			
		}
		else
			{
			window.alert("invalid adhar no");
			}
	}
	</script>
	<script type="text/javascript">
	function validatePassword(){
		const pwd=document.getElementById("pwd").value;
		const cpwd=document.getElementById("cpwd").value;
		if(pwd !== cpwd)
			{
			alert("password do not match")
			return false;
			
			}
		return true;
		
	}
	</script>
</head>
<body>
<div class="heading">
<h1>REGISTER</h1>
 </div>
<form action="PassServlet" onsubmit="return validatePassword()">

 <div class="content">
  <label>Adhaar ID:</label><input type="text" id="txtadhar" name="adharid" placeholder="Enter Adhaar No" required pattern="[0-9]{12}" title="Please Enter valid Aadhaar No" /> <br><br>
  <label>Name:</label><input type="text" name="name" placeholder="Enter Name" required pattern="^[A-Za-z\s]+$" title="Only Alphabet characters"/> <br><br>
  <label>Address:</label><input type="text" name="address" placeholder="Enter Address" required pattern=".{15,}" title="Please Enter Full Address"/> <br><br>
  <label>Mobile:</label><input type="text" name="phone" placeholder="Enter Mobile No" required pattern="[0-9]{10}" title="Please Enter valid mobile number" /> <br><br>
  <label>Email:</label><input type="email" name="emailid" placeholder="Enter Email ID" required pattern="[a-z0-9._%+-]+@[a-z0-9.]+\.[a-z]{2,}$" title="Please Enter valid Email ID" /> <br><br>
  <label>Password:</label><input type="text" name="pwd" id="pwd" placeholder="Enter Password" required pattern=".{4,}" title="Please Enter 4 or more Characters"/> <br><br>
  <label>Conf-Password:</label><input type="text" name="cpwd" id="cpwd" placeholder="Retype Password" required pattern=".{4,}" title="Password Not Matching"/> <br><br>
 <button type="submit" name="action" value="VisitorReg" >Register</button>
  <div class="container">
        	<p>Already have an account? <a href="VisitorLog.jsp">Sign in</a></p>
        </div>
</div>
</form>

</body>
</html>