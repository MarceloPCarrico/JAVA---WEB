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

<%
try {

    String idParam = request.getParameter("id_viatura");
    int idViatura = Integer.parseInt(idParam);

    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_tudobarato", "root", "");
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM T_viatura WHERE numero = ?");
    stmt.setInt(1, idViatura);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {

        int numero = rs.getInt("numero");
        String matricula = rs.getString("matricula");
        int ano = rs.getInt("ano");
        int cilindrada = rs.getInt("cilindrada");
        int kms = rs.getInt("kms");
        int idTipo = rs.getInt("Id_tipo");
        int idMarca = rs.getInt("Id_marca");
        String modelo = rs.getString("modelo");
        double preco = rs.getDouble("preco");
%>
        <form method="post" action="alterar3.jsp">
            <h1>Edição de Viatura</h1>
            <label>Número: </label><input type="text" name="numero" value="<%= numero %>" readonly><br><br>
            <label>Matrícula: </label><input type="text" name="matricula" value="<%= matricula %>"><br><br>
            <label>Ano: </label><input type="text" name="ano" value="<%= ano %>"><br><br>
            <label>Cilindrada: </label><input type="text" name="cilindrada" value="<%= cilindrada %>"><br><br>
            <label>KMs: </label><input type="text" name="kms" value="<%= kms %>"><br><br>
            <label>ID Tipo: </label><input type="text" name="id_tipo" value="<%= idTipo %>"><br><br>
            <label>ID Marca: </label><input type="text" name="id_marca" value="<%= idMarca %>"><br><br>
            <label>Modelo: </label><input type="text" name="modelo" value="<%= modelo %>"><br><br>
            <label>Preço: </label><input type="text" name="preco" value="<%= preco %>"><br><br>
            <input type="submit" value="Guardar Alterações" class="botao">
        </form><br/>
    <form method="get" action="Index.jsp" >
        <input type="submit" value="Voltar" class="botao">
    </form>
<%
    } else {
%>
        <h2>A viatura selecionada não foi encontrada.</h2>
<%
    }
    rs.close();
    stmt.close();
    conn.close();
} catch (Exception e) {
    out.println("An error occurred: " + e.getMessage());
}
%>
</body>
</html>


