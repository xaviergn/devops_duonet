<%
//Edit your Posts
//Check if the title has been input.
if(request.getParameter("title")!=null){
	squerry="UPDATE  "+TABLE_PREFIX+"posts SET  status= 1 WHERE  post_id = '"+request.getParameter("p")+"';";
	stmt.executeUpdate(squerry);
	squerry="INSERT INTO "+TABLE_PREFIX+"posts(post_id, title, content, author, visibility, type, comments) VALUES 	('"+request.getParameter("p")+"','"+request.getParameter("title")+"','"+request.getParameter("content")+"','"+request.getParameter("author")+"','"+request.getParameter("visibility")+"','"+request.getParameter("type")+"','"+request.getParameter("comm")+"'); ";
	stmt.executeUpdate(squerry);		
	MESSAGE="POST EDITED";		
}
//Get the old values.
squerry="SELECT title, content, author, comments FROM "+TABLE_PREFIX+"posts WHERE status=0 AND post_id = '"+request.getParameter("p")+"';"; 
rs = stmt.executeQuery(squerry); 
if (rs.next()) {
	POST_TITLE=rs.getString("title");
	POST_CONTENT=rs.getString("content");
	POST_AUTHOR=rs.getString("author");
	POST_ALLOW_COMMENTS=rs.getInt("comments");
}
%>