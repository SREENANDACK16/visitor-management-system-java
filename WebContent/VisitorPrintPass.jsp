<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Date" %>
      <%@ page import="java.io.InputStream" %>
     <%@ page import="java.util.Base64" %>
     <%@ page import="com.sea.vms.util.Base64Util" %>
     <%@ page import="com.sea.vms.bean.Visitor" %>
     <%@ page import="java.io.ByteArrayOutputStream" %>
    
    <%
    Visitor vs=new Visitor();
     vs = (Visitor) request.getAttribute("pd");
    
%>
    
<!DOCTYPE html>
<html>
<head>
<title></title>
 <style>
        /* Styles for the print format */
        .pass-details {
            width: 60%;
            margin: 0 auto;
            border: 1px solid #000;
            padding: 20px;
            font-family: Arial, sans-serif;
        }

        .pass-details h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .pass-details table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .pass-details table, .pass-details th, .pass-details td {
            border: 1px solid #000;
            padding: 10px;
            text-align: left;
        }

        .pass-details th {
            background-color: #f2f2f2;
        }

        /* Print styles */
        @media print {
            .no-print {
                display: none;
            }

 .pass-details {
                border: none;
                padding: 0;
                width: 100%;
            }
        }
        .pass-details h1
        {
        
        font-size:13px;
        }
    </style>


</head>
<body>

<%
        // Create a SimpleDateFormat instance with the desired format
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // Get the current date and time
        Date now = new Date();
        // Format the current date and time
        String formattedDate = sdf.format(now);
    %>
  
  <div class="pass-details">
    <h2>Temporary Pass Details</h2><p><%= formattedDate %></p>
    <h1>Pass ID:${pd.passid}</h1>
  
     <table>
      
        <tr>
            <th>Aadhar ID</th>
            <td>${pd.adharid}</td>
        </tr>
        <tr>
            <th>Name</th>
            <td>${pd.vname}</td>
        </tr>
        <tr>
            <th>Company</th>
            <td>${pd.company}</td>
        </tr>
        <tr>
            <th>Documents</th>
            <td>${pd.doc}</td>
        </tr>
        <tr>
            <th>From Date</th>
            <td>${pd.fdate}</td>
        </tr>
        <tr>
            <th>To Date</th>
            <td>${pd.tdate}</td>
        </tr>
        <tr>
            <th>Reason</th>
            <td>${pd.reason}</td>
        </tr>
    </table>
    
   
    <button class="no-print" onclick="window.print()">Print Pass</button>
</div>
  
  
  
</body>
</html>