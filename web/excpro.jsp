<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
    </head>
    <body>
        <%
            //Recebe o código digitado no formulário
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            try {
                //Conecta ao Banco de dados chamado banco
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "root", "mysql");
                //Excluem o produto de código informado
                PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); //Executa o comando DELETE
                //Verifica se o produto foi ou não excluído
                if (resultado == 0) {
                    out.print("Este produto não está cadastrado");
                } else {
                    out.print("O produto de código " + cod + " foi excluído com sucesso!");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
            }
        %>
    </body>
</html>
