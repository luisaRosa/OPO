package br.ufac.es1.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.DB.Conexao;
import br.ufac.es1.controleDeDoacoes.DB.HospitalDB;

public class HospitalLogic {
	
	private HospitalDB hdb = new HospitalDB();
	
		
		public void setConexao(Conexao conexao){
			hdb.setConexao(conexao);
			
		}
		
		public Hospital getHospital(int id) throws ParseException{
			Hospital hospital  = null;
			try {
				return hdb.getHospital(id);
			} catch (SQLException sqle) {
				
					
				return hospital;
			}
			
			
		}

		
		public List<Hospital> getHospitais() throws SQLException, ParseException{
			
			return hdb.getHospitais();
			
		}

		
}




