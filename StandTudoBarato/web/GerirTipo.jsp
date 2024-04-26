<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Gerir Tipo</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <% if (request.getMethod().equals("POST")) {
            String acao = request.getParameter("acao");
            String url = "jdbc:mysql://localhost:3306/bd_tudobarato";
            String username = "root";
            String password = "";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, username, password);
                if (acao.equals("inserir")) {
                    String Tipo = request.getParameter("tipo");
                    try {
                        String sql = "INSERT INTO T_tipo (tipo) VALUES (?)";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setString(1, Tipo);
                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            out.println("<h2>Registo inserido com sucesso </h2>");
                        } else {
                            out.println("Erro na inserção");
                        }
                        statement.close();
                        conn.close();
                    } catch (Exception e) {
                        out.println("Ocorreu um erro:" + e.getMessage());
                    }
                } else {
                    String idParam = request.getParameter("id");
                    int id = Integer.parseInt(idParam);
                    Statement stmt = conn.createStatement();
                    String sql = "DELETE FROM t_tipo WHERE Id=?";
                    PreparedStatement stm = conn.prepareStatement(sql);
                    stm.setInt(1, id);
                    int rowsDeleted = stm.executeUpdate();
                    if (rowsDeleted > 0) {
                        out.println("<h2>Registo Apagado com sucesso</h2>");
                    } else {
                        out.println("Não existe nenhum registo com esse id " + id);
                    }
                    stm.close();
                }
                conn.close();
            } catch (Exception e) {
                out.println("Ocorreu um erro:" + e.getMessage());
            }
        } %>
</head>
<body>
<div class="container">
    <h1>Gerir Tipos</h1>
    <table border="1" class="tabela">
        <tr>
            <th>Id</th>
            <th>Tipo</th>
            <th>Ação</th>
        </tr>
        <% int num = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_tudobarato", "root", "");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM T_tipo ORDER BY Id");
                while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString("Id") %></td>
                        <td><%= rs.getString("Tipo") %></td>
                        <td>
                            <form method="post" action="GerirTipo.jsp">
                                <input type="hidden" name="acao" value="apagar">
                                <input type="hidden" name="id" value ="<%= rs.getInt("id") %>">
                                <input type="submit" value="apagar">
                            </form>
                        </td>
                        <% num++; %>
                    </tr>
                <% }
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            } %>
        <tr>
            <th colspan="5">Número de registo na BD</th>
            <td><%= num %></td>
        </tr>
    </table>
    <h3>Inserir Tipo</h3>
       <form method="post" action="GerirTipo.jsp">
            <input type="hidden" name="acao" value="inserir">
            <label>Tipo: <input name="tipo" type="text" size="50" placeholder="Tipo abastecimento"></label><br><br>

            <input type="submit" value="Inserir" class="botao">
            <br><br>
        </form>

</div>
<a href="Index.jsp" target="_self" class="botao">Voltar ao Menu</a>
</body>
</html>


