<%
//Connection to DB, configure your DB in config.jsp not here.
String connectionURL = "jdbc:mysql://localhost:3306/"+DATA_BASE;
Connection connection = null;
PreparedStatement pstatement = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
int updateQuery = 0;
connection = DriverManager.getConnection
(connectionURL, DB_USER_NAME, DB_USER_PASSWORD);
Statement stmt = connection.createStatement();
ResultSet rs;
String squerry="";
%>