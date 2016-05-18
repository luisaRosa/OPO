package br.ufac.bsi.es1.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;

import br.ufac.bsi.es1.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.es1.controleDeDoacoes.DB.UsuarioDB;

public class UsuarioLogic {

	private UsuarioDB udb = new UsuarioDB();

	public void setConexao(Conexao conexao) {
		udb.setConexao(conexao);
	}

	public int addUsuario(Usuario usuario) {

		return udb.addUsuario(usuario);
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
