<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.green.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
request.setCharacterEncoding("UTF-8");

String name = (String) session.getAttribute("namekey");
String id = (String) session.getAttribute("idkey");
String pw = (String) session.getAttribute("pwkey");
%>
<!DOCTYPE html>
<html>
<title>블로그</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><style>
body {font-family: "Roboto", sans-serif}
.w3-bar-block .w3-bar-item {
  padding: 16px;
  font-weight: bold;
}
</style>
<body>
<jsp:include page="sidebar.jsp" />

<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" id="myOverlay"></div>

<div class="w3-main" style="margin-left:250px;">

<header class="w3-container w3-theme" style="padding:64px 32px">
  <h1 class="w3-xxxlarge">W3.CSS</h1>
</header>

<div class="w3-container" style="padding:32px">

<h2>What is W3.CSS?</h2>

<p>W3.CSS is a modern CSS framework with built-in responsiveness:</p>

<ul class="w3-leftbar w3-theme-border" style="list-style:none">
 <li>Smaller and faster than other CSS frameworks.</li>
 <li>Easier to learn, and easier to use than other CSS frameworks.</li>
 <li>Uses standard CSS only (No jQuery or JavaScript library).</li>
 <li>Speeds up mobile HTML apps.</li>
 <li>Provides CSS equality for all devices. PC, laptop, tablet, and mobile:</li>
</ul>
<br>

<hr>
<h2>W3.CSS is Free</h2>
<p>W3.CSS is free to use. No license is necessary.</p>

<hr>
<h2>Easy to Use</h2>
<div class="w3-container w3-sand w3-leftbar">
<p><i>Make it as simple as possible, but not simpler.</i><br>
Albert Einstein</p>
</div>

<hr>
<h2>W3.CSS Web Site Templates</h2>

<p>We have created some responsive W3CSS templates for you to use.</p>
<p>You are free to modify, save, share, use or do whatever you want with them:</p>


<div class="w3-panel w3-light-grey w3-padding-16 w3-card">
<h3 class="w3-center">Band Template</h3>
<div class="w3-content" style="max-width:800px">
<a href="tryw3css_templates_band.htm" target="_blank"  title="Band Demo"></a><br>
<div class="w3-row">
  <div class="w3-col m6">
    <a href="tryw3css_templates_band.htm" target="_blank" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">Demo</a>
  </div>
  <div class="w3-col m6">
    <a href="w3css_templates.asp" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">More Templates »</a>
  </div>
</div>
</div>
</div>

<div class="w3-container w3-padding-16 w3-card" style="background-color:#eee">
<h3 class="w3-center">Blog Template</h3>
<div class="w3-content" style="max-width:800px">

<div class="w3-row">
  <div class="w3-col m6">
    <a href="tryw3css_templates_blog.htm" target="_blank" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">Demo</a>
  </div>
  <div class="w3-col m6">
    <a href="w3css_templates.asp" class="w3-button w3-padding-large w3-dark-grey" style="width:98.5%">More Templates »</a>
  </div>
</div>
</div>
</div>

</div>

<footer class="w3-container w3-theme" style="padding:32px">
  <p>Footer information goes here</p>
</footer>
     
</div>

<script>
// Open and close the sidebar on medium and small screens
function w3_open() {
  document.getElementById("mySidebar").style.display = "block";
  document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
  document.getElementById("myOverlay").style.display = "none";
}

// Change style of top container on scroll
window.onscroll = function() {myFunction()};
function myFunction() {
  if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.getElementById("myTop").classList.add("w3-card-4", "w3-animate-opacity");
    document.getElementById("myIntro").classList.add("w3-show-inline-block");
  } else {
    document.getElementById("myIntro").classList.remove("w3-show-inline-block");
    document.getElementById("myTop").classList.remove("w3-card-4", "w3-animate-opacity");
  }
}

// Accordions
function myAccordion(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme", "");
  }
}
</script>
     
</body>
</html> 