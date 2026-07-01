<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Document Scan</title>
</head>
<body>
    <h2>Upload a Document</h2>
    <form action="${pageContext.request.contextPath}/upload" method="post" enctype="multipart/form-data">
        <label for="file">Choose file:</label>
        <input type="file" id="file" name="file" />
        <button type="submit">Upload</button>
    </form>
</body>
</html>
