package br.ufac.bsi.ihm.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.Logic.MotivoNaoDoacao;


public class MotivoNaoDoacaoDB {

	private Conexao conexao;
	private ResultSet rs;

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;

	}

	public int addMotivoNaoDoacao(MotivoNaoDoacao motivoNaoDoacao) {

		String QueryUpdate = "INSERT INTO motivonaodoacao(motivo) VALUES('" + motivoNaoDoacao.getMotivo() + "');";

		return conexao.atualize(QueryUpdate);
	}
	
	public int updMotivoNaoDoacao(MotivoNaoDoacao motivo){
			
			String QueryUpdate="UPDATE motivonaodoacao SET motivo = '"+ motivo.getMotivo()+"' "
					+"WHERE id ="+ motivo.getId()+";";
			
			return conexao.atualize(QueryUpdate);
			
		}

	public MotivoNaoDoacao getMotivo(int id) throws SQLException {

		String query = "SELECT * FROM motivonaodoacao WHERE id = " + id + ";";
		MotivoNaoDoacao motivoNaoDoacao = null;

		rs = conexao.consulte(query);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {
				motivoNaoDoacao = new MotivoNaoDoacao();
				motivoNaoDoacao.setId(rs.getInt("id"));
				motivoNaoDoacao.setMotivo(rs.getString("motivo"));
			}
		}

		return motivoNaoDoacao;
	}

	public List<MotivoNaoDoacao> getMotivos() {

		List<MotivoNaoDoacao> motivos = new ArrayList<MotivoNaoDoacao>();
		MotivoNaoDoacao motivoNaoDoacao = null;

		String strQuery = "SELECT * from motivonaodoacao ORDER BY id";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {
					motivoNaoDoacao = new MotivoNaoDoacao();
					motivoNaoDoacao.setId(rs.getInt("id"));
					motivoNaoDoacao.setMotivo("motivo");

					motivos.add(motivoNaoDoacao);

				}
			} catch (SQLException sqle) {
				sqle.getMessage();
			}
		}
		return motivos;

	}

}
