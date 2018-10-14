<%
if(request.getParameter("fname")!=null){
	if(request.getParameter("fname")!=""){
		if(request.getParameter("fname")!=" "){
			if(request.getParameter("lname")!=null){
				if(request.getParameter("lname")!=""){
					if(request.getParameter("lname")!=" "){
						if(request.getParameter("email")!=null){
							if(request.getParameter("email")!=""){
								if(request.getParameter("email")!=" "){
									if(request.getParameter("username")!=null){
										if(request.getParameter("username")!=""){
											if(request.getParameter("username")!=" "){
												if(request.getParameter("pass")!=null){
													if(request.getParameter("pass")!=""){
														if(request.getParameter("pass")!=" "){
															//Create Regular User
															squerry="INSERT INTO "+TABLE_PREFIX+"users(email, fist_name, last_name, username, password, type) VALUES 	('"+request.getParameter("email")+"','"+request.getParameter("fname")+"','"+request.getParameter("lname")+"','"+request.getParameter("username")+"','"+request.getParameter("pass")+"', 0) ;";
															stmt.executeUpdate(squerry);
															MESSAGE=MSG_REGISTERED;
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}
%>