<%
//Get Data to display Posts
squerry="SELECT title, content,author, type, comments, DATE_FORMAT(date_mod,'%b %d %Y %h:%i %p') AS moddate FROM "+TABLE_PREFIX+"posts WHERE status = 0 AND post_id = '"+request.getParameter("p")+"';";                      
rs = stmt.executeQuery(squerry); 
if (rs.next()){
	POST_TITLE=rs.getString("title");
	POST_CONTENT=rs.getString("content").replace("<break>","");
	POST_AUTHOR=rs.getString("author");
	POST_MOD_DATE=rs.getString("moddate");
	POST_ALLOW_COMMENTS=rs.getInt("comments");
	POST_TYPE=rs.getInt("type");
}
//Get and show comments if allowed
if(POST_ALLOW_COMMENTS==0){
	%>
	<%@ include file="comments.jsp" %>
	<%
}
%>