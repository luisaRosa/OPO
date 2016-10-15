package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.text.ParseException;



import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.RegistroAtividadesDB;

public class RegistroAtividadesLogic {
	
	RegistroAtividadesDB radb = new RegistroAtividadesDB();
	
	public void setConexao(Conexao conexao){
		radb.setConexao(conexao);
	}
	
	public int addAtividades(RegistroAtividades registro){
		
		return radb.addAtividades(registro);
	}
	
	public int recuperaId(){
		
		return radb.recuperaId();
	}
	
	public RegistroAtividades getAtividades(int id){
		
		RegistroAtividades registro = null;
		
		try {
			return radb.getAtividades(id);
		} catch (SQLException | ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return registro;
	}
	
	public java.util.List<RegistroAtividades> getAtividades() throws ParseException{
		
		return radb.getAtividades();
		
	}

}
