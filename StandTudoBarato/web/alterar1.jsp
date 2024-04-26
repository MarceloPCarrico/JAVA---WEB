<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alterar Viatura</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"> 
</head>
<body>

<form method="post" action="alterar2.jsp">
    <h1>Alteração de Viaturas</h1>
    <label>Selecione a viatura a ser alterada: </label>
    <select name="id_viatura">
        <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_tudobarato", "root", "");
            Statement stmt = conn.createStatement();
            
            ResultSet rs = stmt.executeQuery("SELECT numero, matricula FROM T_viatura ORDER BY numero ASC;");


            while (rs.next()) {
                int viaturaId = rs.getInt("numero");
                String viaturaMatricula = rs.getString("matricula");
        %>
                <option value="<%= viaturaId %>"><%= viaturaMatricula %></option>
        <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
        }
        %>
    </select>
    <br><br>
    <input type="submit" value="Alterar Viatura" class="botao">
</form><br/>
    <form method="get" action="Index.jsp">
        <input type="submit" value="Voltar" class="botao">
    </form>

</body>
</html>




