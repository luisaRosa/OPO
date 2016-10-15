package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.UsuarioDB;

public class UsuarioLogic {

	private UsuarioDB udb = new UsuarioDB();

	public void setConexao(Conexao conexao) {
		udb.setConexao(conexao);
	}

	public int addUsuario(Usuario usuario) {

		return udb.addUsuario(usuario);
	}
	
	public int updUsuario(Usuario usuario) {

		return udb.updUsuario(usuario);
	}
	
	public int delUsuario(Usuario usuario) {

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

	// public List<Usuario> getUsuarios() throws SQLException, ParseException{
	//
	// return udb.getUsuarios();
	//
	// }

}
