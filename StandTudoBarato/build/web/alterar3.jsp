<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alterar Viatura</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"> 
    <% if(request.getMethod().equals("POST")){ %>
    <meta http-equiv="refresh" content="2;url=Index.jsp">
    <% } %>
</head>
<body>
<%
    String idParam = request.getParameter("numero");
    int numero = Integer.parseInt(idParam);
    String matricula = request.getParameter("matricula");
    int ano = Integer.parseInt(request.getParameter("ano"));
    int cilindrada = Integer.parseInt(request.getParameter("cilindrada"));
    int kms = Integer.parseInt(request.getParameter("kms"));
    int id_tipo = Integer.parseInt(request.getParameter("id_tipo"));
    int id_marca = Integer.parseInt(request.getParameter("id_marca"));
    String modelo = request.getParameter("modelo");
    double preco = Double.parseDouble(request.getParameter("preco"));
    
    String url = "jdbc:mysql://localhost:3306/bd_tudobarato";
    String username = "root";
    String password ="";
    
try {
    Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection(url,username,password);
    
    String sql = "UPDATE T_viatura SET matricula = ?, ano = ?, cilindrada = ?, kms = ?, id_tipo = ?, id_marca = ?, modelo = ?, preco = ? WHERE numero = ?";
    PreparedStatement statement = conn.prepareStatement(sql);
        
    statement.setString(1, matricula);
    statement.setInt(2, ano);
    statement.setInt(3, cilindrada);
    statement.setInt(4, kms);
    statement.setInt(5, id_tipo);
    statement.setInt(6, id_marca);
    statement.setString(7, modelo);
    statement.setDouble(8, preco);
    statement.setInt(9, numero);
   
    int rowsUpdated = statement.executeUpdate();

    if (rowsUpdated > 0){
        out.println("<h2> Registo alterado com sucesso.</h2>");
        
    }else{
        out.println("<h2>Erro ao alterar.</h2>");
    }
    conn.close();
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>
</body>
</html>
