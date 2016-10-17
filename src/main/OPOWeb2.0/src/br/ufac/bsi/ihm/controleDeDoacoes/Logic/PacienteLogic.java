package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.PacienteDB;

public class PacienteLogic {

	private PacienteDB pdb = new PacienteDB();

	public void setConexao(Conexao conexao) {
		pdb.setConexao(conexao);

	}
	
	public int addPaciente(Paciente paciente) throws SQLException{
		
			return pdb.addPaciente(paciente);
		
	}
	
	public int updPaciente(Paciente paciente) throws SQLException{
		
		return pdb.updPaciente(paciente); 
	}

	public Paciente getPaciente(String nome) throws ParseException {
		Paciente paciente = null;
		try {
			return pdb.getPaciente(nome);
		} catch (SQLException sqle) {

			return paciente;
		}

	}

	public List<Paciente> getPacientes() throws SQLException, ParseException {

		return pdb.getPacientes();

	}

}
