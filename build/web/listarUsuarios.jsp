
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Usuario"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aprendendo Bootstrap</title>
        <link rel="stylesheet" type="text/css" href="bootstrap-5.1.1-dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-brand">
            <a href="#" class="navbar-brand">
                <img class="company-brand" src="img/company-brand.png" height="50" width="70">
            </a>      
        </div>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>

                <li class="nav-tem active">
                    <a class="nav-link" href="#">Listar Usuários</a>
                </li>

            </ul>
        </div>

    </nav>
        
        <%
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            ArrayList<Usuario> listaUsuarios = usuarioDAO.listarUsuarios();
            out.println("<div class='container'>");
            out.println("<table class='table table-striped table-bordered'>");
                out.println("<tr>");
                    out.println("<th>Código</th>");
                    out.println("<th>Nome</th>");
                    out.println("<th>Sobrenome</th>");
                    out.println("<th>E-mail</th>");
                    out.println("<th>Endereço</th>");
                    out.println("<th>Cidade</th>");
                    out.println("<th>Estado</th>");
                    out.println("<th>CEP</th>");
                    out.println("<th>Receber Atualizações</th>");
                    out.println("<th>Status</th>");
                out.println("</tr>");
            
            try {
                    for(int index=0; index < listaUsuarios.size(); index++){
                        out.println("<tr>");
                            out.println("<td>" + listaUsuarios.get(index).getId() + "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getNome()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getSobrenome()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getEmail()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getEndereco()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getCidade()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getEstadoString()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getCep()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getReceberAtualizacoes()+ "</td>");
                            out.println("<td>" + listaUsuarios.get(index).getStatus()+ "</td>");
                        out.println("</tr>");
                    }
                    
                    out.println("</table>");
                    out.println("</div>");
                } catch (Exception e) {
                    out.println("Erro listarUsuarios " + e);
                }

        %>
        
        
        
    </body>
</html>
