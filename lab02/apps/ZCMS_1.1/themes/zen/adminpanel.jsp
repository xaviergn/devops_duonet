<%@ include file="upper_content.jsp" %> 
<%
out.println("        <div class='article'>");
out.println("          <h2><span>"+ADMINISTRATION_PANEL+"</span></h2><div class='clr'></div>");
out.println("<h2><a href='?dir=create'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;"+CREATE_A_NEW_POST+"</a><br><br>");
out.println("<a href='?dir=manager'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;"+MANAGE_POSTS+"</a><br><br>");
out.println("<a href='?dir=managec'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;"+MANAGE_COMMENTS+"</a><br><br>");
out.println("<a href='?dir=allowedc'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;"+MANAGE_ALLOWED_C+"</a><br><br>");
out.println("<a href='?dir=menu'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;"+MENU_MANAGER+"</a></h2><br>");
out.println("        </div>");
%>
<%@ include file="lower_content.jsp" %>  