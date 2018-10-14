<%@ include file="upper_content.jsp" %> 
<%
int menuNum;
if(request.getParameter("menu")!=null){
	menuNum = Integer.parseInt(request.getParameter("menu"));
}else{
	menuNum=0;
}
out.println("<h2><span><a href='?dir=admin'>"+ADMINISTRATION_PANEL+"</a> / "+MENU_MANAGER+"</span></h2>");
out.println("<p><a href='?dir=menu&menu=0'>"+MENU+" 0</a>&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;&nbsp;&nbsp;&nbsp;<a href='?dir=menu&menu=1'>"+MENU+" 1</a></p>"); 
out.println("<form method='post' action='?dir=menu&menu="+menuNum+"'>");  
out.println("          <ol>");  
for(c=0;menuTitles[menuNum][c]!=null;c++){
	out.println("          <li>");   
	out.println("<h3>Place "+c+" </h3>");  
	out.println("            <label for='title'>"+TITLE+" ("+REQUIRED+")</label>");
	out.println("            <input id='title' name='title"+c+"' class='text' value='"+menuTitles[menuNum][c]+"' />");
	out.println("            <label for='link'>"+LINK+" ("+REQUIRED+")</label>");
	out.println("            <input id='link' name='link"+c+"' class='text' value='"+menuLinks[menuNum][c]+"' />");
	out.println("          </li>");
}
out.println("          <li>");
out.println("<a href='?dir=menu&menu="+menuNum+"&menuaction=1'>"+ADD_NEW+"</a>"); 
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;&nbsp;&nbsp;&nbsp;<a href='?dir=menu&menu="+menuNum+"&menuaction=2'>"+DELETE_LAST+"</a>"); 
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&bull;&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' value='"+SAVE_ALL+"' />"); 
out.println("          </li>"); 
out.println("          </ol>");
out.println("</form>"); 
out.println("<td><tr>");
out.println("      </table>");
%>
<%@ include file="lower_content.jsp" %>  