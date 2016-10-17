package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.HospitalDB;

public class HospitalLogic {

	private HospitalDB hdb = new HospitalDB();

	public void setConexao(Conexao conexao) {
		hdb.setConexao(conexao);

	}

	public int addHospital(Hospital hospital)  throws SQLException{

		return hdb.addHospital(hospital);
	}
	
	public int updHospital(Hospital hospital) throws SQLException{
		
		return hdb.updHospital(hospital);
	}
	
	public int recuperaId(){
		return hdb.recuperaId();
	}

	

	public Hospital getHospital(int id) throws ParseException {
		Hospital hospital = null;
		try {
			return hdb.getHospital(id);
		} catch (SQLException sqle) {

			return hospital;
		}

	}

	public List<Hospital> getHospitais() throws SQLException, ParseException {

		return hdb.getHospitais();

	}

}
