<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Cars</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"> 
    </head>
    <body>
        <h1>Carros Disponíveis</h1> 
        <table class="table table-dark table-striped">
        <tr>
          <th>Numero</th>
          <th>Matricula</th>
          <th>Ano</th>
          <th>Cilindrada</th>
          <th>KMS</th>
          <th>Tipo</th>
          <th>Marca</th>
          <th>Modelo</th>
          <th>Preço</th>
        </tr>
        
        <% 
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_tudobarato", "root", "");
            Statement stmt = conn.createStatement();

            String query = "SELECT v.numero, v.matricula, v.ano, v.cilindrada, v.kms, t.tipo, m.marca, v.modelo, v.preco " +
                           "FROM t_viatura v " +
                           "INNER JOIN T_tipo t ON v.Id_tipo = t.id " +
                           "INNER JOIN T_marca m ON v.Id_marca = m.id";

            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                %>
                <tr>
                  <td><%= rs.getInt("numero") %></td>
                  <td><%= rs.getString("matricula") %></td>
                  <td><%= rs.getString("ano") %></td>
                  <td><%= rs.getString("cilindrada") %></td>
                  <td><%= rs.getString("kms") %></td>
                  <td><%= rs.getString("tipo") %></td> <!-- Tipo do carro -->
                  <td><%= rs.getString("marca") %></td> <!-- Marca do carro -->
                  <td><%= rs.getString("modelo") %> </td>
                  <td><%= String.format("%.2f", rs.getDouble("preco")) %> €</td>
                </tr>
                <% 
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
           out.println("An error occurred: " + e.getMessage());
        }
        %>
        </table>
        </br>
        <a href="Index.jsp" target="_self" class="botao">Voltar</a><br/><br/><br/>
        <center>
            <img src="https://carro.co/my/blog/wp-content/uploads/2021/12/22222.jpg" alt="Imagem de carro"  >
        </center>
    </body>
</html>
