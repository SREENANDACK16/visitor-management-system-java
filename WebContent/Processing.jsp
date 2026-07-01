<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Fingerprint Authentication</title>
    <style>
        /* Simple styles for the page */
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
        #status {
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        function processAuthentication() {
            // Display a processing message
            document.getElementById("status").innerHTML = "Processing, please wait...";

            // Simulate a 3-second processing delay
            setTimeout(function() {
                // After 3 seconds, you can either submit the form or show a success message
                document.getElementById("authForm").submit(); // Uncomment this line to submit the form

                // For demonstration, we're just showing a success message
                // Remove the above line if you want to see the simulated processing only
                document.getElementById("status").innerHTML = "Authentication successful."; // Simulate success
            }, 3000); // 3000 milliseconds = 3 seconds
        }
    </script>
</head>
<body>
<div class="details">
<h2>Fingerprint Authentication</h2>
<form id="authForm" action="PassServlet" method="post">
    <label for="fingerprintData">Fingerprint Data:</label>
    <input type="text" id="fingerprintData" name="fingerprintData" placeholder="fingerprint data" readonly/><br><br>

    <button type="button" onclick="processAuthentication()">Authenticate</button>
</form>

<div id="status"></div>
</div>
</body>
</html>
