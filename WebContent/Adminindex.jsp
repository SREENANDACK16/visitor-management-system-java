<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<title>admin Dashboard</title>
  <style>
  @import url(
"https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
:root {
  --background-color1: #fafaff;
  --background-color2: #ffffff;
  --background-color3: #ededed;
  --background-color4: #cad7fda4;
  --primary-color: #4b49ac;
  --secondary-color: #0c007d;
  --Border-color: #3f0097;
  --one-use-color: #3f0097;
  --two-use-color: #5500cb;
}
body {
  background: url("vmn11.jpg"); no-repeat;
background-attachment:fixed;
		background-size:100% 100%;
  overflow-x: hidden;
}

header {
  height: 70px;
  width: 100vw;
  padding: 0 30px;
  background-color: var(--background-color1);
  position: fixed;
  z-index: 100;
  box-shadow: 1px 1px 15px rgba(161, 182, 253, 0.825);
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 27px;
  font-weight: 600;
  color: navy;
  font-family:w3-cursive;
}

.icn {
  height: 30px;
}
.menuicn {
  cursor: pointer;
}

.searchbar,
.message,
.logosec {
  display: flex;
  align-items: center;
  justify-content: center;
}

.searchbar2 {
  display: none;
}

.logosec {
  gap: 60px;
}

.searchbar input {
  width: 250px;
  height: 42px;
  border-radius: 50px 0 0 50px;
  background-color: var(--background-color3);
  padding: 0 20px;
  font-size: 15px;
  outline: none;
  border: none;
}
.searchbtn {
  width: 50px;
  height: 42px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 0px 50px 50px 0px;
  background-color: var(--secondary-color);
  cursor: pointer;
}

.message {
  gap: 40px;
  position: relative;
  cursor: pointer;
}


.main-container {
  display: flex;
  width: 100vw;
  position: relative;
  top: 70px;
  z-index: 1;
}
.dpicn {
  height: 42px;
}

.main {
  height: calc(100vh - 70px);
  width: 100%;
  overflow-y: scroll;
  overflow-x: hidden;
  padding: 40px 30px 30px 30px;
}

.main::-webkit-scrollbar-thumb {
  background-image: 
        linear-gradient(to bottom, rgb(0, 0, 85), rgb(0, 0, 50));
}
.main::-webkit-scrollbar {
  width: 5px;
}
.main::-webkit-scrollbar-track {
  background-color: #9e9e9eb2;
}

.box-container {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  flex-wrap: wrap;
  gap: 50px;
}
.nav {
  min-height: 91vh;
  width: 250px;
  background-color: var(--background-color2);
  position: absolute;
  top: 0px;
  left: 00;
  box-shadow: 1px 1px 10px rgba(198, 189, 248, 0.825);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  overflow: hidden;
  padding: 30px 0 20px 10px;
}
.navcontainer {
  height: calc(100vh - 70px);
  width: 250px;
  position: relative;
  overflow-y: scroll;
  overflow-x: hidden;
  transition: all 0.5s ease-in-out;
}
.navcontainer a
{
 color:black;
 text-decoration:none;
}
.navcontainer::-webkit-scrollbar {
  display: none;
}
.navclose {
  width: 80px;
}
.nav-option {
  width: 250px;
  height: 60px;
  display: flex;
  align-items: center;
  padding: 0 30px 0 20px;
  gap: 20px;
  transition: all 0.1s ease-in-out;
}
.nav-option:hover {
  
  background-color: #dadada;
  cursor: pointer;
}
.nav-img {
  height: 30px;
}

.nav-upper-options {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 30px;
}

.option1 {
  
  background-color: navy;
  opacity:.8;
  color: white;
  cursor: pointer;
}
.option1:hover {
  
  background-color: firebrick;
}
.box {
  height: 130px;
  width: 230px;
  border-radius: 2px;
  box-shadow: 3px 3px 10px rgba(0, 30, 87, 0.751);
  padding: 20px;
  display: flex;
  align-items: center;
  justify-content: space-around;
  cursor: pointer;
  transition: transform 0.3s ease-in-out;
}
.box:hover {
  transform: scale(1.08);
}

.box:nth-child(1) {
   background-color: firebrick;

}
.box:nth-child(2) {
   background-color: firebrick;

}
.box:nth-child(3) {
   background-color: firebrick;
 
}
.box:nth-child(4) {
  background-color: navy;
}

.box img {
  height: 50px;
}
.box .text {
  color: white;
}
.topic {
  font-size: 13px;
  font-weight: 400;
  letter-spacing: 1px;
}

.topic-heading {
  font-size: 30px;
  letter-spacing: 3px;
}


/* Responsive CSS Here */
@media screen and (max-width: 950px) {
  .nav-img {
    height: 25px;
  }
  .nav-option {
    gap: 30px;
  }
  .nav-option h3 {
    font-size: 15px;
  }
  .report-topic-heading,
  .item1,
  .items {
    width: 800px;
  }
}

@media screen and (max-width: 850px) {
  .nav-img {
    height: 30px;
  }
  .nav-option {
    gap: 30px;
  }
  .nav-option h3 {
    font-size: 20px;
  }
  .report-topic-heading,
  .item1,
  .items {
    width: 700px;
  }
  .navcontainer {
    width: 100vw;
    position: absolute;
    transition: all 0.6s ease-in-out;
    top: 0;
    left: -100vw;
  }
  .nav {
    width: 100%;
    position: absolute;
  }
  .navclose {
    left: 00px;
  }
  .searchbar {
    display: none;
  }
  .main {
    padding: 40px 30px 30px 30px;
  }
  .searchbar2 {
    width: 100%;
    display: flex;
    margin: 0 0 40px 0;
    justify-content: center;
  }
  .searchbar2 input {
    width: 250px;
    height: 42px;
    border-radius: 50px 0 0 50px;
    background-color: var(--background-color3);
    padding: 0 20px;
    font-size: 15px;
    border: 2px solid var(--secondary-color);
  }
}

@media screen and (max-width: 490px) {
  .message {
    display: none;
  }
  .logosec {
    width: 100%;
    justify-content: space-between;
  }
  .logo {
    font-size: 20px;
  }
  .menuicn {
    height: 25px;
  }
  .nav-img {
    height: 25px;
  }
  .nav-option {
    gap: 25px;
  }
  .nav-option h3 {
    font-size: 12px;
  }
  .nav-upper-options {
    gap: 15px;
  }
  .recent-Articles {
    font-size: 20px;
  }
  .report-topic-heading,
  .item1,
  .items {
    width: 550px;
  }
}


   i
   {
   color:navy;
   }
   .btmspace-30 
   {
   color:navy;
   }
   .btmspace-10
   {
   color:white;
   }
   .btmspace-11 
   {
   color:navy;
   }
  </style>
 
</head>

<body>
  
    <!-- for header part -->
    <header>

        <div class="logosec">
            <div class="logo">HAL</div>
            
        </div>

             <i class="btmspace-30 fa-2x fas fa-user-circle"></i>
           
    </header>

    <div class="main-container">
        <div class="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <div class="nav-option option1">
                        <i class="btmspace-10 fa-2x fas fa-window-restore"></i>
                        <h3> Dashboard</h3>
                    </div>
                    
                    <div class="option2 nav-option">
                        <i class="btmspace-11 fa-2x fas fa-user"></i>
                       <a href="PassServlet?action=Visitor Register"><h3>VIEW USER REGISTER</h3></a>
                    </div>

                    <div class="option2 nav-option">
                        <i class="btmspace-11 fa-2x fas fa-user-edit"></i>
                       <a href="PassServlet?action=Visitor Applications"><h3>Visitor Applications </h3></a>
                    </div>

                    <div class="nav-option option3">
                        <i class="btmspace-11 fa-2x fas fa-users"></i>
                        <a href="PassServlet?action=Visited Details"><h3>Visited Details</h3></a>
                    </div>

                    <div class="nav-option option4">
                        <i class="btmspace-11 fa-2x fas fa-user-tie"></i>
                       <a href="PassServlet?action=Security Details"><h3>Security Officers</h3></a>
                    </div>


                    <div class="nav-option logout">
                        <i class="btmspace-11 fa-2x fas fa-undo"></i>
                        <a href="index.html"><h3>Logout</h3></a>
                    </div>

                </div>
            </nav>
        </div>
        
        <div class="main">

            

            <div class="box-container">
            
            <div class="box box1">
                    <div class="text">
                    
                        <h2 class="topic-heading" > ${UserRegCount}</h2>
                        
                        <h2 class="topic">Registered Users </h2>
                    </div>

                    <i class="btmspace-10 fa-2x fas fa-users"></i>
                </div>

                <div class="box box2">
                    <div class="text">
                    
                        <h2 class="topic-heading" > ${applicationCount}</h2>
                        
                        <h2 class="topic">Pass Applications </h2>
                    </div>

                    <i class="btmspace-10 fa-2x fas fa-user-edit"></i>
                </div>

                <div class="box box3">
                    <div class="text">
                        <h2 class="topic-heading" >${VisitCount}</h2>
                        <h2 class="topic">Visited </h2>
                    </div>

                   <i class="btmspace-10 fa-2x fas fa-users"></i>
                </div>

                <div class="box box4">
                    <div class="text">
                        <h2 class="topic-heading" >${securityCount}</h2>
                        <h2 class="topic">Security Officers</h2>
                    </div>

                    <i class="btmspace-10 fa-2x fas fa-user-tie"></i>
                </div>
                
               
</div>
 
        
    <script src="./index.js"></script>
</body>
</html>
