<%
//Create a new Post
if(request.getParameter("title")!=null){
	squerry = "SELECT post_id FROM "+TABLE_PREFIX+"posts ORDER BY post_id DESC LIMIT 0, 1 ;";
	rs = stmt.executeQuery(squerry);
    c=0;
    while (rs.next()) {
		c=rs.getInt("post_id");
	}
	c++;
	char quotes0='"';
	String quotes1 = Character.toString(quotes0);
	String quotes2 = "'";
	squerry="INSERT INTO "+TABLE_PREFIX+"posts(post_id, title, content, author, visibility, type, comments) VALUES 	('"+c+"','"+request.getParameter("title").replace(quotes1,"&#34;").replace(quotes2,"&#39;")+"','"+request.getParameter("content").replace(quotes1,"&#34;").replace(quotes2,"&#39;") +"','"+request.getParameter("author").replace(quotes1,"&#34;").replace(quotes2,"&#39;")+"','"+request.getParameter("visibility")+"','"+request.getParameter("type")+"','"+request.getParameter("comm")+"') ";   
	stmt.executeUpdate(squerry);	
	MESSAGE=NEW_POST_CREATED;	
}
%>