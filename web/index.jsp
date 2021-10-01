
<%@page import="Model.Estado"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <a class="nav-link" href="listarUsuarios.jsp">Listar Usuários</a>
                </li>

            </ul>
        </div>

    </nav>


    <h3 class="text-center form-title">Formulário de Cadastro</h3>

    <div class="container">
        <form class="row g-3" action="executar/executarInserirUsuario.jsp" method="POST">

            <div class="col-md-6">
                <label class="form-label">Nome</label>
                <input class="form-control" type="text" name="nome">               
            </div>
            
            <div class="col-md-6">
                <label class="form-label">Sobrenome</label>
                <input class="form-control" type="text" name="sobrenome">  
            </div>



            <div class="col-md-8">
                <label class="form-label">Email</label>
                <input class="form-control" type="email" name="email">
            </div>  

            <div class="col-md-4">
                <label class="form-label">Senha</label>
                <input class="form-control" type="password" name="senha">
            </div>
            

            <div class="col-12">
                <label class="form-label">Endereço</label>
                <input class="form-control" type="text" placeholder="123 Rua exemplo" name="endereco">  
            </div>
            

            
            <div class="col-md-6">
                <label class="form-label">Cidade</label>
                <input class="form-control" type="text" name="cidade">
            </div>

            <div class="col-md-4">
                <label class="form-label">Estado</label>
                <select class="form-select" name="estado">
                    <option disabled="" selected>[Selecione]</option>
                    <%
                        UsuarioDAO usuarioDAO = new UsuarioDAO();
                        ArrayList<Estado> listaOptionEstado = usuarioDAO.listarEstados();
                        
                        for(int n=0; n<listaOptionEstado.size(); n++){
                            out.println("<option value=" + listaOptionEstado.get(n).getId() + ">" + listaOptionEstado.get(n).getNome() + "</option>");
                        }
                        
                    %>
                </select>
            </div>

            <div class="col-md-2">
                <label class="form-label">CEP</label>
                <input class="form-control" type="number" placeholder="00000-000" name="cep">
            </div>


            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="receberAtualizacoes" value="S">
                    <label class="form-check-label text-muted">Desejo receber atualizações no meu e-mail</label>
                </div>
            </div>

            <div class="col-12">
                <button class="btn btn-primary" type="submit">Enviar</button>
            </div>
            
        </form>

        

    </div>

    
</body>
</html>
