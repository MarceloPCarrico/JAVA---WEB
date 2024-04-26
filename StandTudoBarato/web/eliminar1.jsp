<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Viatura</title>
</head>
<body>
    
<form method="post" action="eliminar2.jsp">    
    <h1>Eliminação de Viaturas</h1>
    <label>Viatura: <select name="id">
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_tudobarato", "root", "");
    Statement stmt = conn.createStatement();

    // Consulta para obter os dados das viaturas
    ResultSet rs = stmt.executeQuery("SELECT * FROM T_viatura ORDER BY numero ASC;");

    while(rs.next()) {
%>
        <option value="<%= rs.getInt("numero") %>"><%= rs.getString("modelo") %></option>
<%
    }
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>
    </select></label>
    <input type="submit" value="Eliminar">
</form>

</body>
</html>



