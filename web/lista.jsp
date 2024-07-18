<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
    </head>
    <body>
        <%
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "root", "mysql");
                //Listar os dados da tabela produto do banco de dados
                st = conecta.prepareStatement("select *from produto ORDER BY preco");
                ResultSet rs = st.executeQuery();
        %>
        <table border="1">
            <tr>
                <th>Código</th><th>Nome</th><th>Descrição</th><th>Preço</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("descricao")%></td>
                <td><%= rs.getDouble("preco")%></td
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
                out.print("Mensagem de erro:" + x.getMessage());
            }
        %>
    </body>
</html>
