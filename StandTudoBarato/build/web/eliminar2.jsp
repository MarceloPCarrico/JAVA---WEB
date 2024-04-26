<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Viatura</title>
    <meta http-equiv="refresh" content="2;url=Index.jsp">
</head>
<body>

<%
String idParam = request.getParameter("id");
int id = Integer.parseInt(idParam);

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_tudobarato", "root", "");

    String sql = "DELETE FROM T_viatura WHERE numero = ?";
    PreparedStatement stm = conn.prepareStatement(sql);
    stm.setInt(1, id);

    int rowsDeleted = stm.executeUpdate();

    if (rowsDeleted > 0) {
        out.println("<h2>Registo Eliminado.</h2>");
    } else {
        out.println("<h2>Ocorreu um erro ao Eliminar.</h2>");
    }
    
    stm.close();
    conn.close();
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>

</body>
</html>

