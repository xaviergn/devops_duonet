<%
//Check if input is correct to login.
if(request.getParameter("username")!=null){
	if(request.getParameter("username")!=""){
		if(request.getParameter("username")!=" "){
			if(request.getParameter("pass")!=null){
				if(request.getParameter("pass")!=""){
					if(request.getParameter("pass")!=" "){
					//Checl if user is Admin o Regular User.
						String username = request.getParameter("username");
						squerry="SELECT COUNT(username) AS usercount FROM "+TABLE_PREFIX+"users WHERE status = 0 AND username = '"+username+"' AND password = '"+request.getParameter("pass")+"' AND type = 1 ;"; 
						c=0;
						rs = stmt.executeQuery(squerry);
						if (rs.next()) {
							c=rs.getInt("usercount");
						}
						if (c==1){
							session.setAttribute("email", username);
							session.setAttribute("admin", "1");
							SITE_LOCATION="ADMIN";
						}
						squerry="SELECT COUNT(username) AS usercount FROM "+TABLE_PREFIX+"users WHERE status = 0 AND username = '"+username+"' AND password = '"+request.getParameter("pass")+"' AND type = 0 ;"; 
						c=0;
						rs = stmt.executeQuery(squerry);
						if (rs.next()) {
							c=rs.getInt("usercount");
						}
						if (c==1){
							session.setAttribute("email", username);
							session.setAttribute("admin", "0");
							SITE_LOCATION="LOGIN_SUCCESS";
						}
						
					}
				}
			}
		}
	}
}
%>