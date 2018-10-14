<%@ include file="upper_content.jsp" %> 
<%
if(POST_TYPE==1){
	out.println(POST_CONTENT);
}else{
	out.println("        <div class='article'>");
	out.println("          <h2><span>"+POST_TITLE+"</span></h2><div class='clr'></div>");
	out.println("          <p>"+POSTED_BY+" <a href='#'>"+POST_AUTHOR+"</a></p>");
	out.println(POST_CONTENT);
	out.println("          <p>"+POSTED_ON+": "+POST_MOD_DATE+"</p>");
	out.println("        </div>");
}
if(POST_ALLOW_COMMENTS==0){
	out.println("        <div class='article'>");
	out.println("          <h2><span>"+postCount+"</span> "+RESPONSES+"</h2><div class='clr'></div>");
	c=0;
	if(newerEntries!=0){
		out.println("<a href='?p="+request.getParameter("p")+"&page="+newerEntries+"' class='obg'>"+NEWER_ENTRIES+" >></a>");
	}
	c=0;
	while (c<COMMENTS_TO_SHOW&&COMMENT_AUTHOR[c]!=null){
		out.println("          <div class='comment'>");
		out.println("            <a href='#'><img src='themes/zen/images/userpic.gif' width='40' height='40' alt='user' class='userpic' /></a>");
		out.println("            <p><a href='#'>"+COMMENT_AUTHOR[c]+"</a> "+SAYS+":<br />"+COMMENT_DATE[c]+"</p>");
		out.println(COMMENT_CONTENT[c]);
		out.println("          </div>");
		c++;
	}
	out.println("        </div>");
	if(olderEntries>1){
		out.println("<a href='?p="+request.getParameter("p")+"&page="+olderEntries+"' class='obg'><< "+OLDER_ENTRIES+"</a>");
	}
	out.println("        <div class='article'>");
	out.println("          <h2><span>"+LEAVE_A_REPLY+"</span></h2><div class='clr'></div>");
	out.println("          <form action='#' method='post' id='leavereply'>");
	out.println("          <ol><li>");
	out.println("            <label for='name'>"+NAME+" ("+REQUIRED+")</label>");
	out.println("            <input id='name' name='cname' class='text' />");
	out.println("          </li><li>");
	out.println("            <label for='email'>"+EMAIL_ADDRESS+" ("+REQUIRED+")</label>");
	out.println("            <input id='email' name='cemail' class='text' />");
	out.println("          </li><li>");
	out.println("            <label for='website'>"+WEBSITE+"</label>");
	out.println("            <input id='website' name='cwebsite' class='text' />");
	out.println("          </li><li>");
	out.println("            <label for='message'>"+YOUR_MESSAGE+"</label>");
	out.println("            <textarea id='message' name='ccomment' rows='8' cols='50'></textarea>");
	out.println("          </li><li>");
	out.println("            <input type='image' name='imageField' id='imageField' src='themes/zen/images/submit.gif' class='send' />");
	out.println("            <div class='clr'></div>");
	out.println("          </li></ol>");
	out.println("          </form>");
	out.println("        </div>");
}
%>
<%@ include file="lower_content.jsp" %>  