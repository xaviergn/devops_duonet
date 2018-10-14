<%
if (request.getParameter("menu")!=null){
	//Get the Menu number
	if (request.getParameter("menu").equals("0")){
		if (request.getParameter("menuaction")!=null){
			//Get last menu place create the next menu item.
			if (request.getParameter("menuaction").equals("1")){
				squerry="SELECT COUNT(*) AS menuplace FROM "+TABLE_PREFIX+"menu WHERE menu=0;"; 
				rs = stmt.executeQuery(squerry);
				int menuPlace=0;
				if (rs.next()) {
					menuPlace=rs.getInt("menuplace");
				}
				//create the next menu item.
				squerry="INSERT INTO "+TABLE_PREFIX+"menu(title, link, place, menu) VALUES (' ',' ','"+(menuPlace)+"','0') ";
				stmt.executeUpdate(squerry);	
			}
			//Get the last item and Delete it.
			if (request.getParameter("menuaction").equals("2")){
				squerry="SELECT COUNT(*) AS menuplace FROM "+TABLE_PREFIX+"menu WHERE menu=0;"; 
				rs = stmt.executeQuery(squerry);
				int menuPlace=0;
				if (rs.next()) {
					menuPlace=rs.getInt("menuplace");
				}
				squerry="DELETE FROM "+TABLE_PREFIX+"menu WHERE place='"+(menuPlace-1)+"' AND menu=0;"; 
				stmt.executeUpdate(squerry);	
			}
		}
		for (c=0;request.getParameter("title"+c)!=null;c++){
			//Update the menu items
			squerry="UPDATE "+TABLE_PREFIX+"menu SET title= '"+request.getParameter("title"+c)+"' WHERE place='"+(c)+"' AND menu=0;";        
			stmt.executeUpdate(squerry);
			squerry="UPDATE "+TABLE_PREFIX+"menu SET link= '"+request.getParameter("link"+c)+"' WHERE place='"+(c)+"' AND menu=0;";
			stmt.executeUpdate(squerry);		
		}
	}
	//Get the Menu number
	if (request.getParameter("menu").equals("1")){
		if (request.getParameter("menuaction")!=null){
			//Get last menu place create the next menu item.
			if (request.getParameter("menuaction").equals("1")){
				squerry="SELECT COUNT(*) AS menuplace FROM "+TABLE_PREFIX+"menu WHERE menu=1;"; 
				rs = stmt.executeQuery(squerry);
				int menuPlace=0;
				if (rs.next()) {
					menuPlace=rs.getInt("menuplace");
				}
				//create the next menu item.
				squerry="INSERT INTO "+TABLE_PREFIX+"menu(title, link, place, menu) VALUES (' ',' ','"+(menuPlace)+"','1') ";
				stmt.executeUpdate(squerry);	
			}
			//Get the last item and Delete it.
			if (request.getParameter("menuaction").equals("2")){
				squerry="SELECT COUNT(*) AS menuplace FROM "+TABLE_PREFIX+"menu WHERE menu=1;"; 
				rs = stmt.executeQuery(squerry);
				int menuPlace=0;
				if (rs.next()) {
					menuPlace=rs.getInt("menuplace");
				}
				squerry="DELETE FROM "+TABLE_PREFIX+"menu WHERE place='"+(menuPlace-1)+"' AND menu=1;";
				stmt.executeUpdate(squerry);	
			}
		}
		for (c=0;request.getParameter("title"+c)!=null;c++){
			//Update the menu items
			squerry="UPDATE "+TABLE_PREFIX+"menu SET title= '"+request.getParameter("title"+c)+"' WHERE place='"+(c)+"' AND menu=1;";
			stmt.executeUpdate(squerry);
			squerry="UPDATE "+TABLE_PREFIX+"menu SET link= '"+request.getParameter("link"+c)+"' WHERE place='"+(c)+"' AND menu=1;";
			stmt.executeUpdate(squerry);		
		}
	}
}

%>