<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Eliminar Viatura</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"> 
</head>
<body>
    <h1>Eliminar Viatura</h1>
    <%
    if(request.getMethod().equals("POST")){
 
        String idParam = request.getParameter("id");
        int id = Integer.parseInt(idParam);

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_tudobarato", "root", "");

            String sql = "DELETE FROM T_viatura WHERE numero = ?;";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, id);

            int rowsDeleted = stm.executeUpdate();
            if (rowsDeleted > 0) {
                out.println("<h2>Viatura Eliminada.</h2>");
            } else {
                out.println("<h2>Ocorreu um erro ao eliminar a viatura.</h2>");
            }

            stm.close();
            conn.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
        }
    }
    %>

    <form method="post" action="eliminar.jsp">    
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
        </select></label><br/><br/>
        <input type="submit" value="Eliminar" class="botao">
    </form><br/>
    <form method="get" action="Index.jsp">
        <input type="submit" value="Voltar" class="botao">
    </form>
</body>
</html>



