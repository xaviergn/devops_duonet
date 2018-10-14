<% 
if(SITE_LOCATION.equals("POST")){
	%>
	<%@ include file="posts.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("HOME")){
	%>
	<%@ include file="home.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("CREATE")){
	%>
	<%@ include file="create.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("MANAGER")){
	%>
	<%@ include file="manager.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("EDITPOST")){
	%>
	<%@ include file="editpost.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("ALLOWEDC")){
	%>
	<%@ include file="allowed_comments.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("ADMIN")){
	%>
	<%@ include file="adminpanel.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("MENU")){
	%>
	<%@ include file="menumanager.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("LOGIN")){
	%>
	<%@ include file="login.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("LOGIN_SUCCESS")){
	%>
	<%@ include file="Login_success.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("LOGOUT")){
	%>
	<%@ include file="logout.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("SIGNUP")){
	%>
	<%@ include file="signup.jsp" %>  
	<%
}
if(SITE_LOCATION.equals("MANAGEC")){
	%>
	<%@ include file="manage_comments.jsp" %>  
	<%
}
%>
  