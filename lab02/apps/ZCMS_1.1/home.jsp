<%
//homepage data gathering
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
squerry="SELECT COUNT(post_id) AS postcount FROM "+TABLE_PREFIX+"posts WHERE visibility = 0 AND status = 0;";
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
//Get posts Data
squerry="SELECT post_id, author, title, content,DATE_FORMAT(date_mod,'%b %d %Y %h:%i %p') AS moddate FROM "+TABLE_PREFIX+"posts WHERE visibility = 0 AND status = 0 ORDER BY date_mod DESC LIMIT "+(ManagePage-POSTS_TO_SHOW)+", "+POSTS_TO_SHOW+" ;";
rs = stmt.executeQuery(squerry);
c=0;
while (rs.next()) {
	A_POSTS_ID[c]=rs.getInt("post_id");
	A_POSTS_AUTHOR[c]=rs.getString("author");
	A_POSTS_TITLE[c]=rs.getString("title");
	A_POSTS_CONTENT[c]=rs.getString("content");
	A_POSTS_DATE[c]= rs.getString("moddate");
	c++;
}
POSTS_TO_SHOW=c;
//Get the number of comments for each post
for(k=0;k<c;k++){
	squerry="SELECT COUNT(post_id) AS ccount FROM "+TABLE_PREFIX+"comments WHERE status = 0 AND post_id = "+A_POSTS_ID[k]+" ;"; 
	rs = stmt.executeQuery(squerry);
	if (rs.next()) {
		num_commnets [k]=rs.getInt("ccount");
	}
}
%>