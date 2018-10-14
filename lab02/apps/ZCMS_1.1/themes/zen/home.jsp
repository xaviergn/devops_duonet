<%@ include file="upper_content.jsp" %>  
<%
if(newerEntries!=0){
	out.println("<a href='?page="+newerEntries+"' class='obg'>"+NEWER_ENTRIES+" >></a>");
}
c=0;
while(c<POSTS_TO_SHOW){
	out.println("        <div class='article'>");
	out.println("          <h2><span>"+A_POSTS_TITLE[c]+"</span></h2>");
	out.println("          <p>"+POSTED_BY+" <a href='#'>"+A_POSTS_AUTHOR[c]+"</a></p>");
	if(A_POSTS_CONTENT[c].indexOf("<break>") > 0){
		out.println(A_POSTS_CONTENT[c].substring(0, A_POSTS_CONTENT[c].indexOf("<break>")));
	}else{
	if(A_POSTS_CONTENT[c].length()>255){
		out.println(A_POSTS_CONTENT[c].substring(0, 255)+"...");
	}else{
		out.println(A_POSTS_CONTENT[c]);
	}
	}
	out.println("          <p><a href='?p="+A_POSTS_ID[c]+"' class='obg'>"+READ_MORE+"</a> <span>&nbsp;&bull;&nbsp;</span> <a href='?p="+A_POSTS_ID[c]+"' class='obg'>"+COMMENTS+" ("+num_commnets[c]+")</a> <span>&nbsp;&bull;&nbsp;</span> "+A_POSTS_DATE[c]+"</p>");
	out.println("        </div>");
	c++;
}
if(olderEntries>1){
	out.println("<a href='?page="+olderEntries+"' class='obg'><< "+OLDER_ENTRIES+"</a>");
}
%>
<%@ include file="lower_content.jsp" %>  