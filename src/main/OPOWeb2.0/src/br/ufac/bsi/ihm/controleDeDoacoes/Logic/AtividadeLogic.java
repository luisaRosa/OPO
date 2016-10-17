package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.AtividadeDB;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;


public class AtividadeLogic {
	
AtividadeDB adb = new AtividadeDB();
	
	public void setConexao(Conexao conexao){
		adb.setConexao(conexao);
	}
	
	public int addAtividades(Atividade atividade) throws SQLException{
		
		return adb.addAtividades(atividade);
	}
	
	
		
	public Atividade getAtividades(int id){
		
		Atividade atividade = null;
		
		try {
			return adb.getAtividades(id);
		} catch (SQLException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return atividade;
	}
	
	public java.util.List<Atividade> getAtividades() throws ParseException{
		
		return adb.getAtividades();
		
	}

}
