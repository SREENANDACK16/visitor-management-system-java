<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Biometric Authentication</title>
    <script>
        function scanFingerprint() {
            
            const fingerprintData = "sampleFingerprintData"; 
            document.getElementById("fingerprintData").value = fingerprintData;
            document.getElementById("authenticationForm").submit();
        }
    </script>
<style type="text/css">
body
{
  background: url("visit_wall1.jpg"); no-repeat;
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
 border:solid 1px silver;
 color:white;
 justify-content:center;
 width:150px;
 height:20px;
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
.details h2
{
padding-top:14%;
font-size:26px;

}
    </style>
</head>
<body>
    
    <div class="details">
    <h2>Biometric Authentication</h2>
    <form id="authenticationForm" action="PassServlet" method="post">
        <label for="aadhaarId">Aadhaar ID:</label>
        <input type="text" name="adharid" required pattern="[0-9]{12}" title="Please enter a valid Aadhaar ID" value="${sessionScope.adharid}"readonly/><br><br>
        
        <input type="hidden" id="fingerprintData" name="fingerprintData" />
        
        <input type="hidden" name="action" value="authenticate" /> 
        
        <button type="button" onclick="scanFingerprint()">Scan Fingerprint</button>
    </form>
    </div>
</body>
</html>