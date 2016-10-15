package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.QuadroClinicoDB;

public class QuadroClinicoLogic {

	private QuadroClinicoDB qcdb = new QuadroClinicoDB();
	private PacienteLogic pacienteLogic = new PacienteLogic();

	public void setConexao(Conexao conexao) {
		qcdb.setConexao(conexao);
		pacienteLogic.setConexao(conexao);
	}

	public int addQuadroClinico(QuadroClinico quadroClinico) {

		return qcdb.addQuadroClinico(quadroClinico);
	}

	public int recuperaId() {
		return qcdb.recuperaId();
	}

	public QuadroClinico getQuadroClinico(int id) throws ParseException {
		QuadroClinico quadroClinico = null;
		try {
			return qcdb.getQuadroClinico(id);
		} catch (SQLException sqle) {

			return quadroClinico;
		}

	}

	public List<QuadroClinico> getQuadroClinico() throws SQLException, ParseException {

		return qcdb.getQuadroClinico();

	}

}
