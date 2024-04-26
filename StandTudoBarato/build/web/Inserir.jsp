<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Inserção de Viaturas</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"> 
</head>
<body>
    <h1>Inserir Viaturas</h1>
    
    <%
    if(request.getMethod().equals("POST")){
        String matricula = request.getParameter("matricula");
        String ano = request.getParameter("ano");
        String cilindrada = request.getParameter("cilindrada");
        String kms = request.getParameter("kms");
        String id_tipo = request.getParameter("id_tipo");
        String id_marca = request.getParameter("id_marca");
        String modelo = request.getParameter("modelo");
        String preco = request.getParameter("preco");
        
        String url = "jdbc:mysql://localhost:3306/bd_tudobarato";
        String username = "root";
        String password ="";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url,username,password);

            String sql = "INSERT INTO T_viatura (matricula, ano, cilindrada, kms, id_tipo, id_marca, modelo, preco) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";  
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setString(1, matricula);
            statement.setInt(2, Integer.parseInt(ano)); 
            statement.setInt(3, Integer.parseInt(cilindrada)); 
            statement.setInt(4, Integer.parseInt(kms)); 
            statement.setInt(5, Integer.parseInt(id_tipo));
            statement.setInt(6, Integer.parseInt(id_marca));
            statement.setString(7, modelo);
            statement.setDouble(8, Double.parseDouble(preco)); 
            
            int rowsInserted = statement.executeUpdate();
       
            if (rowsInserted > 0){
                out.println("<h2> Viatura inserida com sucesso.</h2>");

            }else{
                out.println("<h2>Erro ao inserir a viatura.</h2>");
            }
            conn.close();
        } catch (Exception e) {
            out.println("Ocorreu um erro: " + e.getMessage());
        }
    }  
    %>
</body>
</html>
