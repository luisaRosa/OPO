package br.ufac.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.Logic.Hospital;
import br.ufac.es1.controleDeDoacoes.Logic.Paciente;

public class HospitalDB {

	private Conexao conexao;
	private ResultSet rs;
	
	
	public void setConexao(Conexao conexao){
		this.conexao = conexao;
		

	}

	public Hospital getHospital(int id) throws SQLException, ParseException{



		String strQuery = "SELECT id, hospitalOrigem, hospitalNotificador "+
				"FROM hospital WHERE id = "+id+";";
		
		Hospital hospital = null;


		rs = conexao.consulte(strQuery);

		if(rs!=null){
			rs.beforeFirst();
			if(rs.next()){
				
				hospital = new Hospital();
				hospital.setId(Integer.parseInt(rs.getString(1)));
				hospital.setHospitalOrigem(rs.getString(2));
				hospital.setHospitalNotificador(rs.getString(3));
				
				
			


			}
		}
		return hospital;
		
	}
	public List<Hospital> getHospitais() throws ParseException {

		List<Hospital> hospitais = new ArrayList<Hospital>();
		Hospital hospital = null;
		
		

		String strQuery = "SELECT id, hospitalOrigem, hospitalNotificador, paciente_nome  FROM hospital ORDER BY id";

		
			rs = conexao.consulte(strQuery);
		

		if(rs!=null){
			try{
				rs.beforeFirst();
				while(rs.next()){
					
					hospital = new Hospital();
					
					hospital.setId(Integer.parseInt(rs.getString(1)));
					hospital.setHospitalOrigem(rs.getString(2));
					hospital.setHospitalNotificador(rs.getString(3));
					
					
					
				
					
					hospitais.add(hospital);
				}
			}catch(SQLException sqle){
				
				sqle.getMessage();
				
			}



		}

		return hospitais;
	}
}
