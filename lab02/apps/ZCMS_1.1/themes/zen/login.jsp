<%@ include file="upper_content.jsp" %> 
<%
out.println("        <div class='article'>");
out.println("          <h2><span>"+LOGIN+"</span></h2><div class='clr'></div>");
out.println("          <form action='#' method='post' id='leavereply'>");
out.println("          <ol><li>");   
out.println("            <label for='username'>"+USERNAME+":</label>");
out.println("            <input id='username' name='username' class='text' />");
out.println("          </li><li>");
out.println("            <label for='pass'>"+PASSWORD+":</label>");
out.println("            <input id='pass' name='pass' class='text' />");
out.println("          </li><li>");
out.println("            <input type='image' name='imageField' id='imageField' src='themes/zen/images/submit.gif' class='send' />");
out.println("            <div class='clr'></div>");
out.println("          </li></ol>");
out.println("          </form>");
out.println("        </div>");
%> 
<%@ include file="lower_content.jsp" %>  