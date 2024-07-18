<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de produtos</title>
    </head>
    <body>
        <%
            //Receber os dados ALTERADOS no formulário carregaprod.jsp
            int codigo;
            String nome, descricao;
            double preco;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            descricao = request.getParameter("descricao");
            preco = Double.parseDouble(request.getParameter("preco"));
            //Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "root", "mysql");
            //Alterar os dados na tabela produtos do BD
            st = conecta.prepareStatement("UPDATE produto SET nome=?, descricao=?, preco=? WHERE codigo=?");
            st.setString(1, nome);
            st.setString(2, descricao);
            st.setDouble(3, preco);
            st.setInt(4, codigo);
            st.executeUpdate();//Executa o UPDATE(ALTERAÇÃO NO BANCO DE DADOS)
            out.print("Os dados do produto " + codigo + " foram alterados com sucesso!");            

        %>    
    </body>
</html>
