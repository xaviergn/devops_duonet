<%
//Delete Allowed Comments
if(request.getParameter("delete")!=null){
	squerry="UPDATE  "+TABLE_PREFIX+"comments SET  status= 2 WHERE id = '"+request.getParameter("delete")+"';";
	stmt.executeUpdate(squerry);
}
//Create the older/newer posts link
numPage=1;
if(request.getParameter("page")!=null){
	try {
		numPage=Integer.valueOf(request.getParameter("page"));
		ManagePage = numPage*POSTS_TO_SHOW;
	}catch(NumberFormatException nfe){
		ManagePage=POSTS_TO_SHOW;
	}
}else{
	ManagePage=POSTS_TO_SHOW;
}
squerry="SELECT COUNT(id) AS postcount FROM "+TABLE_PREFIX+"comments WHERE status = 0;";
rs = stmt.executeQuery(squerry);
if (rs.next()) {
	postCount=rs.getInt("postcount");
}
olderEntries=2;
if(postCount>POSTS_TO_SHOW){
	olderEntries=0;
	if(postCount>(POSTS_TO_SHOW*numPage)){
		olderEntries=numPage+1;
	}
}else{
	olderEntries=0;
}
if((ManagePage-POSTS_TO_SHOW)!=0){
newerEntries=numPage-1;
}
//Get the allowed comments to display
squerry="SELECT * FROM "+TABLE_PREFIX+"comments WHERE status = 0 ORDER BY date_born DESC LIMIT "+(ManagePage-POSTS_TO_SHOW)+", "+POSTS_TO_SHOW+" ;";
rs = stmt.executeQuery(squerry);
c=0;
while (rs.next()) {
	A_CPOST_ID[c]=rs.getInt("post_id");
    A_COMMENT_ID[c]=rs.getInt("id");
    A_COMMENT_AUTHOR[c]=rs.getString("author");
    A_COMMENT_EMAIL[c]=rs.getString("email");
    A_COMMENT_WEB[c]=rs.getString("website");
    A_COMMENT_CONTENT[c]=rs.getString("content");
    A_COMMENT_DATE[c]=rs.getString("date_born");
	c++;
}
COMMENTS_TO_SHOW=c;
%>