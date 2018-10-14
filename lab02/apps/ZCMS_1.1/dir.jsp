<%
//Get
if(session.getAttribute("email")!=null&&session.getAttribute("admin")=="1"){
	if(request.getParameter("dir").equals("create")){
		SITE_LOCATION="CREATE";
		%>
		<%@ include file="create.jsp" %>
		<%
	}else if(request.getParameter("dir").equals("manager")){
		SITE_LOCATION="MANAGER";
		%>
		<%@ include file="manager.jsp" %>
		<%
	}else if(request.getParameter("dir").equals("editpost")){
		SITE_LOCATION="EDITPOST";
		%>
		<%@ include file="editpost.jsp" %>
		<%
	}else if(request.getParameter("dir").equals("managec")){
		SITE_LOCATION="MANAGEC";
		%>
		<%@ include file="manage_comments.jsp" %>
		<%
	}else if(request.getParameter("dir").equals("allowedc")){
		SITE_LOCATION="ALLOWEDC";
		%>
		<%@ include file="allowed_comments.jsp" %>
		<%
	}else if(request.getParameter("dir").equals("admin")){
		SITE_LOCATION="ADMIN";						
	}else if(request.getParameter("dir").equals("menu")){
		SITE_LOCATION="MENU";
		%>
		<%@ include file="menumanager.jsp" %>
		<%
	}else if(request.getParameter("dir").equals("logout")){
		SITE_LOCATION="LOGOUT";
		%>
		<%@ include file="logout.jsp" %>
		<%
	}else{
		SITE_LOCATION="HOME";
		%>
		<%@ include file="home.jsp" %>
		<%
	}
}else if(request.getParameter("dir").equals("signup")){
	SITE_LOCATION="SIGNUP";
	%>
	<%@ include file="signup.jsp" %>
	<%
}else if(request.getParameter("dir").equals("logout")){
	SITE_LOCATION="LOGOUT";
	%>
	<%@ include file="logout.jsp" %>
	<%
}else{
	SITE_LOCATION="LOGIN";
	%>
	<%@ include file="login.jsp" %>
	<%
}
%>