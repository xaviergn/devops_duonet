<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>  
<%@ include file="config.jsp" %>
<%
//Declare and Initializing Variables
String SITE_LOCATION="HOME";
String POST_TITLE="";
String POST_CONTENT="";
String POST_AUTHOR="";
String POST_CREATED="";
String POST_MOD_DATE="";
int POST_ALLOW_COMMENTS=0;
int COMMENT_RESPONSES=0;
int POST_TYPE=0;
String MESSAGE="";
String[] COMMENT_AUTHOR=new String[500];
String[] COMMENT_CONTENT=new String[500];
String[] COMMENT_DATE=new String[500];
String[] A_POSTS_AUTHOR=new String[(POSTS_TO_SHOW)];
String[] A_POSTS_TITLE=new String[(POSTS_TO_SHOW)];
String[] A_POSTS_CONTENT=new String[(POSTS_TO_SHOW)];
String[] A_POSTS_DATE=new String[(POSTS_TO_SHOW)];
int A_POSTS_RESPONSES [] = new int [(POSTS_TO_SHOW)];
int A_POSTS_ID [] =new int [(POSTS_TO_SHOW)];
int A_POSTS_ID_COUNT [] =new int [(POSTS_TO_SHOW)];
int A_POSTS_STATUS [] =new int [(POSTS_TO_SHOW)];
int A_CPOST_ID [] =new int [POSTS_TO_SHOW];
int A_COMMENT_ID [] =new int [POSTS_TO_SHOW];
String[] A_COMMENT_AUTHOR = new String[POSTS_TO_SHOW];
String[] A_COMMENT_EMAIL= new String[POSTS_TO_SHOW];
String[] A_COMMENT_WEB=new String[POSTS_TO_SHOW];
String[] A_COMMENT_CONTENT=new String[POSTS_TO_SHOW];
String[] A_COMMENT_DATE=new String[POSTS_TO_SHOW];
int num_commnets [] = new int [(POSTS_TO_SHOW)];
String[][] menuTitles = new String[10][30];
String[][] menuLinks = new String[10][30];
int ManagePage;
int olderEntries=0;
int newerEntries=0;
int postCount=0;
int numPage=0;
int c=0;
int k=0;
%>
<%@ include file="language/settings.jsp" %>  
<%@ include file="conn.jsp" %> 
<%
//Get the post or page number
if (request.getParameter("p")!=null){
	SITE_LOCATION="POST";
	%>
	<%@ include file="posts.jsp" %>
	<%
}
//Get the location of the user.
if(request.getParameter("dir")!=null){
	%>
	<%@ include file="dir.jsp" %>
	<%
}
//Move user to home if no location or post is set on the url.
if(request.getParameter("dir")==null && request.getParameter("p")==null){
	%>
	<%@ include file="home.jsp" %>
	<%
}
%>
<%@ include file="menu.jsp" %>  
<%@ include file="config_theme.jsp" %>  
<%@ include file="close_conn.jsp" %>