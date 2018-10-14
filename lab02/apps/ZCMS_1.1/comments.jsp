<%@ page import="java.util.regex.Matcher" %>  
<%@ page import="java.util.regex.Pattern" %>  
<%
//Check if the email is correct to create the comment.		  
if(request.getParameter("cemail")!=null){
	if(request.getParameter("cemail")!=""){
		if(request.getParameter("cemail")!=" "){
			Pattern pattern;
			Matcher matcher;
			String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
			pattern = Pattern.compile(EMAIL_PATTERN);
			if(pattern.matcher(request.getParameter("cemail")).matches()){
				char quotes0='"';
				String quotes1 = Character.toString(quotes0);
				String quotes2 = "'";
				squerry="INSERT INTO "+TABLE_PREFIX+"comments(post_id, author, email, website,content) VALUES 	('"+request.getParameter("p")+"','"+request.getParameter("cname").replace("<","&lt;").replace(quotes1,"&#34;").replace(quotes2,"&#39;")+"','"+request.getParameter("cemail").replace("<","&lt;").replace(quotes1,"&#34;").replace(quotes2,"&#39;")+"','"+request.getParameter("cwebsite").replace("<","&lt;").replace(quotes1,"&#34;").replace(quotes2,"&#39;")+"','"+request.getParameter("ccomment").replace("\n", "<br>").replace("<","&lt;").replace(quotes1,"&#34;").replace(quotes2,"&#39;")+"') ;";
				stmt.executeUpdate(squerry);
				MESSAGE=MODERATION;	
			}else{
				MESSAGE=WRONG_EMAIL;	
			}
		}
	}
}
//Create the older/newer posts link
numPage=1;
if(request.getParameter("page")!=null){
	try {
		numPage=Integer.valueOf(request.getParameter("page"));
		ManagePage = numPage*COMMENTS_TO_SHOW;
	}catch(NumberFormatException nfe){
		ManagePage=COMMENTS_TO_SHOW;
	}
}else{
	ManagePage=COMMENTS_TO_SHOW;
}
squerry="SELECT COUNT(id) AS postcount FROM "+TABLE_PREFIX+"comments WHERE status = 0 AND post_id = '"+request.getParameter("p")+"';";
rs = stmt.executeQuery(squerry);
if (rs.next()) {
	postCount=rs.getInt("postcount");
}
olderEntries=2;
if(postCount>COMMENTS_TO_SHOW){
	olderEntries=0;
	if(postCount>(COMMENTS_TO_SHOW*numPage)){
		olderEntries=numPage+1;
	}
}else{
	olderEntries=0;
}
if((ManagePage-COMMENTS_TO_SHOW)!=0){
newerEntries=numPage-1;
}
//Get the comments to display
String SITE_COMMENTS;
SITE_COMMENTS="<br>"+"<br>"+COMMENTS;
squerry="SELECT content,author,DATE_FORMAT(date_born,'%b %d %Y %h:%i %p') AS moddate  FROM "+TABLE_PREFIX+"comments WHERE status = 0 AND post_id = '"+request.getParameter("p")+"' ORDER BY date_born DESC LIMIT "+(ManagePage-COMMENTS_TO_SHOW)+", "+COMMENTS_TO_SHOW+" ;";
rs = stmt.executeQuery(squerry);
c=0;
while (rs.next()) {
	COMMENT_AUTHOR[c]=rs.getString("author");
	COMMENT_CONTENT[c]=rs.getString("content");
	COMMENT_DATE[c]=rs.getString("moddate");
	c++;
}
%>