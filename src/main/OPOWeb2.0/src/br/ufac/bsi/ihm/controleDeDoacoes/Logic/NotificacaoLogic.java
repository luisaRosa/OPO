package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.NotificacaoDB;

public class NotificacaoLogic {

	private NotificacaoDB ndb = new NotificacaoDB();
	private PacienteLogic pacienteLogic = new PacienteLogic();

	public void setConexao(Conexao conexao) {
		ndb.setConexao(conexao);
		pacienteLogic.setConexao(conexao);
	}

	public int addNotificacao(Notificacao notificacao) throws SQLException{
		return ndb.addNotificacao(notificacao);
	}
	
	

	public int recuperaId() {
		return ndb.recuperaId();
	}
	
	public int updNotificacao(Notificacao notificacao) throws SQLException{
		
		return ndb.updNotificacao(notificacao);
	}

	public Notificacao getNotificacao(int id) throws ParseException {
		Notificacao notificacao = null;
		try {
			return ndb.getNotificacao(id);
		} catch (SQLException sqle) {

			return notificacao;
		}

	}

	public List<Notificacao> getNotificacoes() throws SQLException, ParseException {

		return ndb.getNotificacoes();

	}

}
