package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.EvolucaoPacienteDB;

public class EvolucaoPacienteLogic {
	
	
	EvolucaoPacienteDB epdb = new EvolucaoPacienteDB();
	
	public void setConexao(Conexao conexao){
		epdb.setConexao(conexao);
	}
	
	public int addEvolucaoPaciente(EvolucaoPaciente evolucao){
		
		return epdb.addEvolucaoPaciente(evolucao);
	}
	
	public EvolucaoPaciente getEvolucaoPaciente(int id){
		EvolucaoPaciente evolucao = null;
		
		try {
			return epdb.getEvolucao(id);
		} catch (SQLException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evolucao;
	}
	
	public List<EvolucaoPaciente> getEvolucoes() throws SQLException, ParseException{
		
		 return epdb.getEvolucao();
		
	}

}
