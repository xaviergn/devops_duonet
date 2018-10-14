<%

if(request.getParameter("delete")!=null){
	squerry="UPDATE  "+TABLE_PREFIX+"posts SET  status= 3 WHERE status = 0 AND post_id = '"+request.getParameter("delete")+"' OR status = 2 AND post_id = '"+request.getParameter("delete")+"';";
	stmt.executeUpdate(squerry);
}
if(request.getParameter("block")!=null){
	squerry="UPDATE  "+TABLE_PREFIX+"posts SET  status= 2 WHERE status = 0 AND  post_id = '"+request.getParameter("block")+"';";
	stmt.executeUpdate(squerry);
}
if(request.getParameter("unblock")!=null){
	squerry="UPDATE  "+TABLE_PREFIX+"posts SET  status= 0 WHERE status = 2 AND post_id = '"+request.getParameter("unblock")+"';";
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
squerry="SELECT COUNT(post_id) AS postcount FROM "+TABLE_PREFIX+"posts WHERE status = 0 OR status = 2;";
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
//Get the posts to display
squerry="SELECT post_id, author, title, status, content,DATE_FORMAT(date_mod,'%b %d %Y %h:%i %p') AS moddate FROM "+TABLE_PREFIX+"posts WHERE status = 0 OR status = 2 ORDER BY date_mod DESC LIMIT "+(ManagePage-POSTS_TO_SHOW)+", "+POSTS_TO_SHOW+" ;";
rs = stmt.executeQuery(squerry);
c=0;
while (rs.next()) {
	A_POSTS_ID[c]=rs.getInt("post_id");
	A_POSTS_AUTHOR[c]=rs.getString("author");
	A_POSTS_TITLE[c]=rs.getString("title");
	A_POSTS_CONTENT[c]=rs.getString("content");
	A_POSTS_DATE[c]=rs.getString("moddate");
	A_POSTS_STATUS[c]=rs.getInt("status");
	c++;
}
POSTS_TO_SHOW=c;
for(k=0;k<c;k++){
	squerry="SELECT COUNT(post_id) AS ccount FROM "+TABLE_PREFIX+"comments WHERE status = 0 AND post_id = "+A_POSTS_ID[k]+" ;"; 
	rs = stmt.executeQuery(squerry);
	if (rs.next()) {
		num_commnets [k]=rs.getInt("ccount");
	}
}
%>