package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.UsuarioDB;
import br.ufac.bsi.ihm.controleDeDoacoes.Exception.IdException;

public class UsuarioLogic {

	private UsuarioDB udb = new UsuarioDB();

	public void setConexao(Conexao conexao) {
		udb.setConexao(conexao);
	}

	public int addUsuario(Usuario usuario)  {
		try{
		return udb.addUsuario(usuario);
		}catch (SQLException sqe) {
			if(sqe.getErrorCode() == 1062)
				throw new IdException("O CPF digitado já está cadastrado!");
			return 0;
		}
	}
	
	public int updUsuario(Usuario usuario) throws SQLException {

		return udb.updUsuario(usuario);
	}
	
	public int updSenhaUsuario(Usuario usuario) throws SQLException{
		return udb.updSenhaUsuario(usuario);
	}
	
	public int delUsuario(Usuario usuario) throws SQLException{

		return udb.delUsuario(usuario);
	}

	public Usuario getUsuario(String cpf) throws ParseException {
		Usuario usuario = null;
		try {
			return udb.getUsuario(cpf);
		} catch (SQLException sqle) {

			return usuario;
		}

	}

	 public List<Usuario> getUsuarios() throws SQLException, ParseException{
	
		 return udb.getUsuarios();
	
	 }
	 
	 public int verificaSenha(Usuario usuario, String senhaAtual ){
		 if(usuario.getSenha().equals(senhaAtual)){
			return 1;
		 }
		 return 0;
	 }
	 
	 public int confirmasenha(String novasenha, String confirmaSenha){
		 if(novasenha.equalsIgnoreCase(confirmaSenha)){
			 return 1;
		 }
		 return 0;
	 }

}
