package br.ufac.bsi.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario;

public class UsuarioDB {

	private Conexao conexao;
	private ResultSet rs;

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;

	}

	public int addUsuario(Usuario usuario) {

		String QueryUpdate = "INSERT INTO usuariosistema(cpf, nome, funcao, senha, localTrabalho)" + "VALUES('"
				+ usuario.getCpf() + "', '" + usuario.getNome() + "', '" + usuario.getFuncao() + "', '"
				+ usuario.getSenha() + "', '" + usuario.getLocalTrabalho() + "');";

		return conexao.atualize(QueryUpdate);

	}

	public Usuario getUsuario(String cpf) throws SQLException, ParseException {

		String strQuery = "select cpf, nome, senha, funcao, localtrabalho from usuariosistema where cpf = '" + cpf
				+ "';";
		Usuario usuario = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {
				usuario = new Usuario();
				usuario.setNome(rs.getString("nome"));
				usuario.setCpf(rs.getString("cpf"));
				usuario.setSenha(rs.getString("senha"));
				usuario.setFuncao(rs.getString("funcao"));
				usuario.setLocalTrabalho(rs.getString("localTrabalho"));

			}
		}
		return usuario;

	}

	public List<Usuario> getUsuarios() {

		List<Usuario> usuarios = new ArrayList<Usuario>();
		Usuario usuario = null;

		String strQuery = "SELECT * FROM usuario ORDER BY nome";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {

					usuario = new Usuario();
					usuario.setCpf(rs.getString("cpf"));
					usuario.setNome(rs.getString("nome"));
					usuario.setFuncao(rs.getString("funcao"));
					usuario.setLocalTrabalho(rs.getString("localTrabalho"));
					usuario.setSenha(rs.getString("senha"));

					usuarios.add(usuario);
				}
			} catch (SQLException sqle) {
				sqle.getMessage();
			}
		}
		return usuarios;

	}
}
