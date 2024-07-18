<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Alterar produtos</title>
    </head>
    <body>
        <%
            //Recebe o código do produto alterado
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            //Conectar ao banco de dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "root", "mysql");
            //Buscar o produto pelo código recebido
            st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo=?");
            st.setInt(1, cod);
            ResultSet resultado = st.executeQuery(); //Executa o comando SELECT
            //Verifica se o produto de código informado foi encontrado
            if (!resultado.next()) { // se não encontrou o produto
                out.print("Este produto não está cadastrado!");
            } else {//se encontrou o produto
        %>
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= resultado.getString("codigo")%>" readonly>
            </p>
            <p>
                <label for="nome">Nome do produto:</label>
                <input type="text" name="nome" id="nome" size="50" maxlength="50" value="<%= resultado.getString("nome")%>">
            </p>
            <p>
                <label for="descricao">Descrição do produto:</label>
                <input type="text" name="descricao" id="descricao" maxlength="50" value="<%= resultado.getString("descricao")%>">
            </p>
            <p>
                <label for="preco">Valor do produto:</label>
                <input type="number" step="0.10" name="preco" id="preco" value="<%= resultado.getDouble("preco")%>">
            </p>
            <p>
                <input type="submit" value="Salvar alterações">
            </p>
        </form>
        <%
            }
        %>
    </body>
</html>
