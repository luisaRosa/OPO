package br.ufac.es1.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.DB.Conexao;
import br.ufac.es1.controleDeDoacoes.DB.PacienteDB;

public class PacienteLogic {
	private PacienteDB pdb = new PacienteDB();
	
		
		public void setConexao(Conexao conexao){
			pdb.setConexao(conexao);
			
		}
		
		public Paciente getPaciente(String nome) throws ParseException {
			Paciente paciente = null;
			try {
				return pdb.getPaciente(nome);
			} catch (SQLException sqle) {
				
			
				return paciente;
			}
			
			
		}

		
		public List<Paciente> getPacientes() throws SQLException, ParseException{
			
			return pdb.getPacientes();
			
		}

		
		

	}


	
	


