package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.MotivoNaoDoacaoDB;

public class MotivoNaoDoacaoLogic {

	private MotivoNaoDoacaoDB mndDB = new MotivoNaoDoacaoDB();

	public void setConexao(Conexao conexao) {
		mndDB.setConexao(conexao);
	}

	public int addMotivo(MotivoNaoDoacao motivoNaoDoacao) throws SQLException{

		return mndDB.addMotivoNaoDoacao(motivoNaoDoacao);
	}
	
	public int updMotivoNaoDoacao(MotivoNaoDoacao motivo)throws SQLException{
		return mndDB.updMotivoNaoDoacao(motivo);
	}

	public MotivoNaoDoacao getMotivo(int id) {
		MotivoNaoDoacao mNaoDoacao = null;
		try {
			return mndDB.getMotivo(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}

		return mNaoDoacao;
	}

	public List<MotivoNaoDoacao> getMotivos() {
		return mndDB.getMotivos();
	}

}
