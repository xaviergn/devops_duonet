<%@ include file="upper_content.jsp" %> 
<%
out.println("        <div class='article'>");
out.println("          <h2><span>"+EDIT_A_POST+"</span></h2><div class='clr'></div>");
out.println("          <form action='#' method='post' id='leavereply'>");
out.println("          <ol><li>");   
out.println("            <label for='email'>"+TITLE+" ("+REQUIRED+")</label>");
out.println("            <input id='email' name='title' class='text' value='"+POST_TITLE+"' />");
out.println("          </li><li>");
out.println("            <label for='author'>"+AUTHOR+"</label>");
out.println("            <input id='author' name='author' class='text' value='"+POST_AUTHOR+"' />");
out.println("          </li><li>");
out.println("            <label for='comm'>"+COMMENTS+"</label>");
out.println("            <select name='comm'><option value='0' ");
if (POST_ALLOW_COMMENTS==0){
	out.println("selected");
}
out.println(">"+ALLOWED+"</option><option value='1' ");
if (POST_ALLOW_COMMENTS==1){
	out.println("selected");
}
out.println(">"+NOT_ALLOWED+"</option></select>");
out.println("          </li><li>");
out.println("            <label for='visibility'>"+VISIBILITY+"</label>");
out.println("            <select name='visibility'><option value='0' >"+POST_PUBLIC+"</option><option value='1' >"+POST_PRIVATE+"</option></select>");
out.println("          </li><li>");
out.println("            <label for='type'>"+THE_TYPE+":</label>");
out.println("            <select name='type'><option value='0' >"+POST+"</option><option value='1' >"+PAGE+"</option></select>");
out.println("          </li><li>");
out.println("            <label for='content'>"+CONTENT+"</label>");
out.println("            <textarea id='content' name='content' rows='8' cols='50' >"+POST_CONTENT+"</textarea>");
out.println("          </li><li>");
out.println("            <input type='image' name='imageField' id='imageField' src='themes/zen/images/submit.gif' class='send' />");
out.println("            <div class='clr'></div>");
out.println("          </li></ol>");
out.println("          </form>");
out.println("        </div>");
%>
<%@ include file="lower_content.jsp" %>  