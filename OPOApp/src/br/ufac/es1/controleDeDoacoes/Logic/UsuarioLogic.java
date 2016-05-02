package br.ufac.es1.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.DB.Conexao;
import br.ufac.es1.controleDeDoacoes.DB.HospitalDB;
import br.ufac.es1.controleDeDoacoes.DB.UsuarioDB;

public class UsuarioLogic {
	
	private UsuarioDB udb = new UsuarioDB();
	
		
		public void setConexao(Conexao conexao){
			udb.setConexao(conexao);
			}
		
		public Usuario getUsuario(int cpf) throws ParseException{
			Usuario usuario  = null;
			try {
				return udb.getUsuario(cpf);
			} catch (SQLException sqle) {
				
					
				return usuario;
			}
			
			
		}

		
		public List<Usuario> getUsuarios() throws SQLException, ParseException{
			
			return udb.getUsuarios();
			
		}

		
}




