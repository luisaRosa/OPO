package br.ufac.bsi.ihm.controleDeDoacoes.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class Conexao {
	
	private Connection con;
	private Statement smt;
	private boolean conectado = false;
	
	
	public boolean conecte(String dbURL, String dbUser, String dbPassword){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbUser, dbPassword);
			conectado = true;
		}catch(SQLException sqle){
			System.out.printf("Erro: #%d[%s]\n", 
					sqle.getErrorCode(), sqle.getMessage());
			conectado = false;			
		}catch(ClassNotFoundException cnfe){
			System.out.printf("Erro: %s\n", 
					cnfe.getMessage());
			conectado = false;						
		}
		return conectado;
   }

	
	public boolean desconecte(){
		try {
			con.close();
			conectado = false;	
		}catch(SQLException sqle){
			System.out.printf("Erro: #%d [%s]\n", 
					sqle.getErrorCode(), sqle.getMessage());
	   }
		return conectado;
	}

	
	public ResultSet consulte(String sqlQuery){
		try {
			smt = con.createStatement();
			return smt.executeQuery(sqlQuery);
		}catch(SQLException sqle){
			System.out.printf("Erro: #%d [%s]\n", 
					sqle.getErrorCode(), sqle.getMessage());
		   return null;			
	   }
	}

	
	public int atualize(String sqlUpdate) throws SQLException{
					
			smt = con.createStatement();
			return smt.executeUpdate(sqlUpdate);
		
	}	

	
	public boolean estaConectado(){
		
		return conectado;
	}


}
