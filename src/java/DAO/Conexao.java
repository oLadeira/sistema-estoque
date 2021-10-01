package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
    
    Connection con;
    
    public Connection getConexao(){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/sistema_estoque?user=root&password=";
            con = DriverManager.getConnection(url); 
        } catch (Exception e) {
            System.out.println("Erro classe Conexao " + e);
        }
                
        return con;
    }
}
