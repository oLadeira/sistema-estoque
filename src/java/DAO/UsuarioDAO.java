package DAO;

import Model.Estado;
import Model.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UsuarioDAO {
    Connection con = new Conexao().getConexao();
    PreparedStatement prst;
    Statement st;
    ResultSet rs;
    ArrayList<Estado> listaOptionEstado = new ArrayList<>();
    ArrayList<Usuario> listaUsuarios = new ArrayList<>();
    
    
    public void inserirUsuario(Usuario usuario){
        
        try {
            String sql  = "CALL insere_usuario(?,?,?,?,?,?,?,?,?,?)";
            
            prst = con.prepareStatement(sql);
            
            prst.setString(1, usuario.getNome());
            prst.setString(2, usuario.getSobrenome());
            prst.setString(3, usuario.getEmail());
            prst.setString(4, usuario.getSenha());
            prst.setString(5, usuario.getEndereco());
            prst.setString(6, usuario.getCidade());
            prst.setInt(7, usuario.getEstado());
            prst.setString(8, usuario.getCep());
            prst.setString(9, usuario.getReceberAtualizacoes());
            prst.setString(10, usuario.getStatus());
            
            prst.execute();
            prst.close();
            
        } catch (SQLException e) {
            System.out.println("Erro inserirUsuario() " + e);    
        }
        
    }
    
    public ArrayList<Estado> listarEstados(){
    
        try {
            String sql = "SELECT * FROM estado";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            
            while(rs.next()){
                Estado estado = new Estado();
                estado.setId(rs.getInt("id"));
                estado.setNome(rs.getString("nome"));
                estado.setUf(rs.getString("uf"));
                estado.setIbge(rs.getInt("ibge"));
                estado.setPais(rs.getInt("pais"));
                estado.setDdd(rs.getString("ddd"));
                
                listaOptionEstado.add(estado);
            }
            
            
        } catch (Exception e) {
            System.out.println("erro listarEstados " + e);
        }
        return listaOptionEstado;
    }
    
    
    public ArrayList<Usuario> listarUsuarios(){
    
        try {
            String sql = "CALL lista_usuario()";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            
            while(rs.next()){
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNome(rs.getString("nome"));
                usuario.setSobrenome(rs.getString("sobrenome"));
                usuario.setEmail(rs.getString("email"));
                usuario.setEndereco(rs.getString("endereco"));
                usuario.setCidade(rs.getString("cidade"));
                usuario.setEstadoString(rs.getString("estado"));
                usuario.setCep(rs.getString("cep"));
                usuario.setReceberAtualizacoes(rs.getString("receberAtualizacoes"));
                usuario.setStatus(rs.getString("status"));
                
                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            System.out.println("Erro listarUsuarios " + e);
        }
        
        return listaUsuarios;
    }
    
    
}
