<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //Receber os dados digitados no formulário cadpro.html
            int codigo;
            String nome, descricao;
            double preco;
            codigo = Integer.parseInt(request.getParameter("codigo"));
            nome = request.getParameter("nome");
            descricao = request.getParameter("descricao");
            preco = Double.parseDouble(request.getParameter("preco"));
            try {
                //Fazer a conexão com o Banco de Dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "root", "mysql");
                //Inserir os dados na tabela produtos do banco de dados aberto
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
                st.setInt(1, codigo);
                st.setString(2, nome);
                st.setString(3, descricao);
                st.setDouble(4, preco);
                st.executeUpdate();//Executa o comando INSERT
                out.print("Produto cadastrado com sucesso!");
            } catch (Exception x) {
                String erro = x.getMessage();
                if(erro.contains("Duplicate entry")){
                out.print("Este produto já está cadastrado!");
                }else{
                out.print("Mensagem de erro:" + erro);
                }
            }
        %>
    </body>
</html>
