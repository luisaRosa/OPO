package br.ufac.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.Logic.Hospital;
import br.ufac.es1.controleDeDoacoes.Logic.Paciente;
import br.ufac.es1.controleDeDoacoes.Logic.QuadroClinico;

public class QuadroClinicoDB {
	

	private Conexao conexao;
	private ResultSet rs;
	private PacienteDB pacienteDB = new PacienteDB();
	
	public void setConexao(Conexao conexao){
		this.conexao = conexao;
		this.pacienteDB.setConexao(conexao);

	}

	public QuadroClinico getQuadroClinico(int id) throws SQLException, ParseException{



		String strQuery = "SELECT id, pupilas, egAo,egMrv, egMrm, pressaoArterial, sedado, informacoesAdd, paciente_nome "+
				"FROM quadroClinico WHERE id = "+id+";";
		Paciente paciente = null;
		QuadroClinico quadroClinico = null;


		rs = conexao.consulte(strQuery);

		if(rs!=null){
			rs.beforeFirst();
			if(rs.next()){
				
				quadroClinico = new QuadroClinico();
				paciente = new Paciente();
				quadroClinico.setId(Integer.parseInt(rs.getString(1)));
				quadroClinico.setPupilas(rs.getString(2));
				quadroClinico.setEgAo(Integer.parseInt(rs.getString(3)));
				quadroClinico.setEgMrv(Integer.parseInt(rs.getString(4)));
				quadroClinico.setEgMrm(Integer.parseInt(rs.getString(5)));
				quadroClinico.setPressaoArterial(rs.getString(6));
				quadroClinico.setSedado(rs.getString(7));
				quadroClinico.setInformacoesAdd(rs.getString(8));
				paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));
				
				if(paciente!= null)
					quadroClinico.setPaciente(paciente);
			


			}
		}
		return quadroClinico;

	}

	public List<QuadroClinico> getQuadroClinico() throws ParseException {

		List<QuadroClinico> quadrosClinicos = new ArrayList<QuadroClinico>();
		QuadroClinico quadroClinico = null;
		Paciente paciente = null;
		

		String strQuery = "SELECT id, pupilas, egAo,egMrv, egMrm, pressaoArterial, sedado, informacoesAdd, paciente_nome  FROM hospital ORDER BY id";

		
			rs = conexao.consulte(strQuery);
		

		if(rs!=null){
			try{
				rs.beforeFirst();
				while(rs.next()){
					
					quadroClinico = new QuadroClinico();
					paciente = new Paciente();
					quadroClinico.setId(Integer.parseInt(rs.getString(1)));
					quadroClinico.setPupilas(rs.getString(2));
					quadroClinico.setEgAo(Integer.parseInt(rs.getString(3)));
					quadroClinico.setEgMrv(Integer.parseInt(rs.getString(4)));
					quadroClinico.setEgMrm(Integer.parseInt(rs.getString(5)));
					quadroClinico.setPressaoArterial(rs.getString(6));
					quadroClinico.setSedado(rs.getString(7));
					quadroClinico.setInformacoesAdd(rs.getString(8));
					
					paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));
					
					if(paciente!= null)
						quadroClinico.setPaciente(paciente);
					
					quadrosClinicos.add(quadroClinico);
				}
			}catch(SQLException sqle){
				
				sqle.getMessage();
				
			}



		}

		return quadrosClinicos;
	}

}
