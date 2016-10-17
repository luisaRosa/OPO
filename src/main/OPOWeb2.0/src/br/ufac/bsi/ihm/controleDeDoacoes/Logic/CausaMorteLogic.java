package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.CausaMorteDB;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;

public class CausaMorteLogic {

	private CausaMorteDB cmdb = new CausaMorteDB();

	public void setConexao(Conexao conexao) {
		cmdb.setConexao(conexao);
	}

	public int addCausaMorte(CausaMorte causaMorte)throws SQLException {

		return cmdb.addCausaMorte(causaMorte);

	}

	public CausaMorte getCausaMorte(int id) {
		CausaMorte causaMorte = null;

		try {
			return cmdb.getCausaMorte(id);
		} catch (SQLException sqle) {
			sqle.getMessage();
		}
		return causaMorte;
	}

	public List<CausaMorte> getCausaMorte() {

		return cmdb.getCausaMorte();
	}

}
