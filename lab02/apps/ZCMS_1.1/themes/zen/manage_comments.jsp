<%@ include file="upper_content.jsp" %> 
<%
out.println("<h2><span><a href='?dir=admin'>"+ADMINISTRATION_PANEL+"</a> / "+MANAGE_COMMENTS+"</span></h2>");
if(newerEntries!=0){
	out.println("<a href='?dir=managec&page="+newerEntries+"' class='obg'>"+NEWER_ENTRIES+" >></a>");
}
c=0;
out.println("<table border='1'>");
while(COMMENTS_TO_SHOW > 0){
	out.println("          <tr><td><span><b><h3>POST ID: "+A_CPOST_ID[c]+"</h3>");
	out.println("<b></span>");
	out.println("          <p>"+POSTED_BY+" <a href='#'>"+A_COMMENT_AUTHOR[c]+"</a> <span>&nbsp;&bull;&nbsp;</span></p>");
	out.println(A_COMMENT_CONTENT[c]);
	out.println("          <p><a href='?p="+A_COMMENT_ID[c]+"' class='obg'>"+READ_MORE+"</a> <span>&nbsp;&bull;&nbsp;</span> <a href='#' class='obg'>");
	out.println(" </a> <span>&nbsp;&bull;&nbsp;</span> March 16, 2015&nbsp;&nbsp;&bull;&nbsp;&nbsp;");
	out.println("<a href='?dir=managec&allow=");
	out.println(A_COMMENT_ID[c]+"' class='obg'>Allow</a>&nbsp;&nbsp;&bull;&nbsp;&nbsp;<a href='?dir=managec&delete="
	+A_COMMENT_ID[c]
	+"' class='obg'>"+DELETE+"</a></p></td></tr>");
	COMMENTS_TO_SHOW--;
	c++;
}
out.println("      </table>");
if(olderEntries>1){
	out.println("<a href='?dir=managec&page="+olderEntries+"' class='obg'><< "+OLDER_ENTRIES+"</a>");
}
%>
<%@ include file="lower_content.jsp" %>  