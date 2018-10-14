<%
//create the connection with the DB
try{
    if(stmt!=null){
		stmt.close();
	}        
    if(connection!=null){
		connection.close();
	}
}catch(Exception e){
	out.println("Error Close DB");
}
%>