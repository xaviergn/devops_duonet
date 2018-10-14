<%
//Get the Menu data from DB to display
squerry="SELECT * FROM "+TABLE_PREFIX+"menu WHERE menu = 0 ORDER BY place ASC;"; 
rs = stmt.executeQuery(squerry);
for (c=0;rs.next();c++) {
	menuTitles[0][c]=rs.getString("title");
	menuLinks[0][c]=rs.getString("link");
}
squerry="SELECT * FROM "+TABLE_PREFIX+"menu WHERE menu = 1 ORDER BY place ASC;"; 
rs = stmt.executeQuery(squerry);
for (c=0;rs.next();c++){
	menuTitles[1][c]=rs.getString("title");
	menuLinks[1][c]=rs.getString("link");
}
%>