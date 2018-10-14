<%@ include file="upper_content.jsp" %> 
<%
out.println("<h2><span><a href='?dir=admin'>"+ADMINISTRATION_PANEL+"</a> / "+MANAGE_POSTS+"</span></h2>");
if(newerEntries!=0){
	out.println("<a href='?dir=manager&page="+newerEntries+"' class='obg'>"+NEWER_ENTRIES+" >></a>");
}
c=0;
String blocked1=BLOCK;
String blocked2="block";
out.println("<table border='1'>");
while (c<POSTS_TO_SHOW){
	out.println("          <tr><td><span><b><h3>"+A_POSTS_TITLE[c]+"</h3>");
	if(A_POSTS_STATUS[c]==2){
		out.println(BLOCKED); blocked1=UNBLOCK; blocked2="unblock";
	}
	out.println("<b></span>");
	out.println("          <p>Posted by <a href='#'>"+A_POSTS_AUTHOR[c]+"</a></p>");
	out.println(A_POSTS_CONTENT[c]);
	out.println("          <p><a href='?p="
	+A_POSTS_ID[c]
	+"' class='obg'>"+READ_MORE+"</a> <span>&nbsp;&bull;&nbsp;</span> <a href='?p="+A_POSTS_ID[c]+"' class='obg'>"+COMMENTS+" ("
	+num_commnets[c]);
	out.println(" )</a> <span>&nbsp;&bull;&nbsp;</span> March 16, 2015&nbsp;&nbsp;&bull;&nbsp;&nbsp;<a href='?dir=editpost&p="+A_POSTS_ID[c]);
	out.println("' class='obg'>"+EDIT+"</a>&nbsp;&nbsp;&bull;&nbsp;&nbsp;<a href='?dir=manager&"+blocked2+"=");
	out.println(A_POSTS_ID[c]+"' class='obg'>"+blocked1+"</a>&nbsp;&nbsp;&bull;&nbsp;&nbsp;<a href='?dir=manager&delete="
	+A_POSTS_ID[c]
	+"' class='obg'>"+DELETE+"</a></p></td></tr>");
	c++;
	blocked1=BLOCK;
	blocked2="block";
}
out.println("      </table>");
if(olderEntries>1){
	out.println("<a href='?dir=manager&page="+olderEntries+"' class='obg'><< "+OLDER_ENTRIES+"</a>");
}
%>
<%@ include file="lower_content.jsp" %>  