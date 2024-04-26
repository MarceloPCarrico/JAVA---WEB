<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inserir</title>
<meta http-equiv="refresh" content="2;url=Index.jsp">
<link href="css/style.css" rel="stylesheet" type="text/css"> 
</head>
<body>
<%
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
        Connection conn = DriverManager.getConnection(url, username, password);
        
        String sql = "INSERT INTO T_viatura (matricula, ano, cilindrada, kms, id_tipo, id_marca, modelo, preco) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        
        pstmt.setString(1, matricula);
        pstmt.setInt(2, Integer.parseInt(ano)); 
        pstmt.setInt(3, Integer.parseInt(cilindrada)); 
        pstmt.setInt(4, Integer.parseInt(kms)); 
        pstmt.setInt(5, Integer.parseInt(id_tipo));
        pstmt.setInt(6, Integer.parseInt(id_marca));
        pstmt.setString(7, modelo);
        pstmt.setDouble(8, Double.parseDouble(preco)); 

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("<h2>Viatura inserida com sucesso!</h2>");
        } else {
            out.println("<h2>Falha ao inserir os dados da viatura.</h2>");
        }

        pstmt.close();
        conn.close();
    } catch (Exception e) {
        out.println("Ocorreu um erro: " + e.getMessage());
    }
%>
</body>
