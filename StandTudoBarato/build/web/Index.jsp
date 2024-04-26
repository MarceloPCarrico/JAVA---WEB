<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tudo Barato</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">   
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
    </style>
</head>
<body>
    <div>
        <h1>Stand Tudo Barato</h1>
        <p>Esta é uma aplicação onde pode gerir dados de viaturas de um stand, de forma prática.</p>
        <div class="linha" >
            <div class="celula-esq">
                <img src="https://www.hdcarwallpapers.com/walls/mercedes_amg_one_4k-HD.jpg" alt="Imagem de carro" width="700"><br/><br/>
                <div class="menu">
                    <a href="Insere.html" target="_self" class="botao">Inserir</a>
                    <a href="ListarCarros.jsp" target="_self" class="botao">Listar</a>
                    <a href="alterar1.jsp" target="_self" class="botao">Editar</a>
                    <a href="eliminar.jsp" target="_self" class="botao">Eliminar</a>
                    <a href="GerirTipo.jsp" target="_self" class="botao">Tipo</a>
                    <a href="GerirMarca.jsp" target="_self" class="botao">Marcas</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

