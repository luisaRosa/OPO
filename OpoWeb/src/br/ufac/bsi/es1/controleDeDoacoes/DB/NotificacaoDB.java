package br.ufac.bsi.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.es1.controleDeDoacoes.Logic.Notificacao;
import br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario;

public class NotificacaoDB {

	private Conexao conexao;
	private ResultSet rs;
	private UsuarioDB usuarioDB = new UsuarioDB();

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;
		usuarioDB.setConexao(conexao);

	}

	public int addNotificacao(Notificacao notificacao) {

		String QueryUpdate = "INSERT INTO notificacao(status, dt_notificacao, usuarioSistema_cpf)" + " VALUES('"
				+ notificacao.getStatus() + "', '" + notificacao.getDtNotificacao() + "', '"
				+ notificacao.getUsuario().getCpf() + "');";

		return conexao.atualize(QueryUpdate);

	}
	
	

	public int recuperaId() {

		String strQuery = "SELECT id FROM notificacao ORDER BY id DESC LIMIT 1;";
		rs = conexao.consulte(strQuery);
		try {
			rs.beforeFirst();
			if(rs.next())
				return rs.getInt("id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Notificacao getNotificacao(int id) throws SQLException, ParseException {

		String strQuery = "SELECT * FROM notificacao WHERE id = " + id + ";";

		Notificacao notificacao = null;
		Usuario usuario = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {

				notificacao = new Notificacao();
				notificacao.setId(rs.getInt("id"));
				notificacao.setStatus(rs.getString("status"));
				notificacao.setDtNotificacao(rs.getDate("dt_notificacao").toString());
				usuario = usuarioDB.getUsuario(rs.getString("usuarioSistema_cpf"));

				notificacao.setUsuario(usuario);
			}
		}
		return notificacao;

	}

	public List<Notificacao> getNotificacoes() throws ParseException {

		List<Notificacao> notificacoes = new ArrayList<Notificacao>();
		Notificacao notificacao = null;
		Usuario usuario = null;

		String strQuery = "SELECT * FROM notificacao ORDER BY id";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {
					notificacao = new Notificacao();
					notificacao.setId(rs.getInt("id"));
					notificacao.setStatus(rs.getString("status"));
					notificacao.setDtNotificacao(rs.getDate("dt_notificacao").toString());

					usuario = usuarioDB.getUsuario(rs.getString("usuarioSistema_cpf"));

					notificacao.setUsuario(usuario);

					notificacoes.add(notificacao);
				}
			} catch (SQLException sqle) {

				sqle.getMessage();

			}

		}

		return notificacoes;
	}

}
