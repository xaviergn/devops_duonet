<%
out.println("<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>");
out.println("<!--");
out.println("Design by http://www.bluewebtemplates.com");
out.println("Released for free under a Creative Commons Attribution 3.0 License");
out.println("-->");
out.println("<html xmlns='http://www.w3.org/1999/xhtml'>");
out.println("<head>");
out.println("<title>ZCMS</title>");
out.println("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />");
out.println("<link href='themes/zen/style.css' rel='stylesheet' type='text/css' />");
out.println("<!-- CuFon: Enables smooth pretty custom font rendering. 100% SEO friendly. To disable, remove this section -->");
out.println("<script type='text/javascript' src='themes/zen/js/cufon-yui.js'></script>");
out.println("<script type='text/javascript' src='themes/zen/js/arial.js'></script>");
out.println("<script type='text/javascript' src='themes/zen/js/cuf_run.js'></script>");
out.println("<!-- CuFon ends -->");
out.println("</head>");
out.println("<body>");
if(!MESSAGE.equals("")){
	out.println("<h2><p align='center'>"+MESSAGE+"</p></h2>");
}
out.println("<div class='main'>");
out.println("  <div class='header'>");
out.println("    <div class='header_resize'>");
out.println("      <div class='logo'><h1><a href='/zcms'><span>"+SITE_TITLE_1+"</span>"+SITE_TITLE_2+"<br /><small>"+SLOGAN+"</small></a></h1></div>");
out.println("      <div class='clr'></div>");
out.println("      <div class='menu_nav'>");
out.println("        <ul>");
for(c=0;menuTitles[0][c]!=null;c++){
	out.println("<li><a href='"+menuLinks[0][c]+"'>"+menuTitles[0][c]+"</a></li>");
}
out.println("        </ul>");
out.println("      </div>");
out.println("      <div class='clr'></div>");
out.println("    </div>");
out.println("  </div>");
out.println("  <div class='content'>");
out.println("    <div class='content_resize'>");
out.println("      <div class='mainbar'>");
%>