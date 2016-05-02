package br.ufac.es1.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.DB.Conexao;
import br.ufac.es1.controleDeDoacoes.DB.HospitalDB;
import br.ufac.es1.controleDeDoacoes.DB.QuadroClinicoDB;

public class QuadroClinicoLogic {

	
	private QuadroClinicoDB qcdb = new QuadroClinicoDB();
	private PacienteLogic pacienteLogic = new PacienteLogic();
	private Paciente paciente = null;
		
		public void setConexao(Conexao conexao){
			qcdb.setConexao(conexao);
			pacienteLogic.setConexao(conexao);
		}
		
		public QuadroClinico getQuadroClinico(int id) throws ParseException{
			QuadroClinico quadroClinico  = null;
			try {
				return qcdb.getQuadroClinico(id);
			} catch (SQLException sqle) {
				
					
				return quadroClinico;
			}
			
			
		}

		
		public List<QuadroClinico> getQuadroClinico() throws SQLException, ParseException{
			
			return qcdb.getQuadroClinico();
			
		}

		
}


