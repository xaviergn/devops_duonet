<%@include file="default.jsp"%>
<%
if(request.getParameter("lang") !=  null){
//if parameter lang is set, it changes the users language.
if(request.getParameter("lang").equals("es")){

%>
<%@include file="es.jsp"%>
<%
}
if(request.getParameter("lang").equals("en")){

%>
<%@include file="en.jsp"%>
<%
}
}else{
if(LANGUAGE.equals("es")){
%>
<%@include file="es.jsp"%>
<%
}
if(LANGUAGE.equals("en")){
%>
<%@include file="en.jsp"%>
<%
}
}
%>