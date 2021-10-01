<%@page import="DAO.UsuarioDAO"%>
<%@page import="Model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    
    try {
        Usuario usuario = new Usuario();
        UsuarioDAO usuarioDAO = new UsuarioDAO();
  
        usuario.setNome(request.getParameter("nome"));
        usuario.setSobrenome(request.getParameter("sobrenome"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setSenha(request.getParameter("senha"));
        usuario.setEndereco(request.getParameter("endereco"));
        usuario.setCidade(request.getParameter("cidade"));
        usuario.setEstado(Integer.parseInt(request.getParameter("estado")));
        usuario.setCep(request.getParameter("cep"));
        usuario.setReceberAtualizacoes(request.getParameter("receberAtualizacoes"));
                

        usuarioDAO.inserirUsuario(usuario);  
        
        response.sendRedirect("../index.jsp");
        
        } catch (Exception e) {
            out.println("Erro executarInserirUsuario " + e);
        }
  

%>