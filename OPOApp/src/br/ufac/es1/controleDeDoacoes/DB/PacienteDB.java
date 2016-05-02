package br.ufac.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import java.util.List;

import br.ufac.es1.controleDeDoacoes.Logic.Hospital;
import br.ufac.es1.controleDeDoacoes.Logic.Paciente;

public class PacienteDB {

	private Conexao conexao;
	private ResultSet rs;
	SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
	Calendar dt_nascimento = Calendar.getInstance();
	Calendar dt_internacao = Calendar.getInstance();
	String data; 
	HospitalDB hospitalDB = new HospitalDB();

	public void setConexao(Conexao conexao){
		this.conexao = conexao;
		hospitalDB.setConexao(conexao);

	}

	public Paciente getPaciente(String nome) throws SQLException, ParseException{



		String strQuery = "SELECT nome, rg_ct, idade, dt_nascimento, dt_internacao, cpf, cns, nomePai, nomeMae, religiao, doador "+
				"FROM paciente WHERE nome = "+nome+";";
		Paciente paciente = null;


		rs = conexao.consulte(strQuery);

		if(rs!=null){
			rs.beforeFirst();
			if(rs.next()){
				paciente = new Paciente();
				paciente.setNome(rs.getString(1));
				paciente.setRgCT(Integer.parseInt(rs.getString(2)));
				paciente.setIdade(Integer.parseInt(rs.getString(3)));

				

				data = rs.getDate(4).toString();					 
				dt_nascimento.setTime(formatoData.parse(data));
				paciente.setDt_nascimento(dt_nascimento);
				
				data = rs.getDate(5).toString();
				dt_internacao.setTime(formatoData.parse(data));
				paciente.setDt_internacao(dt_internacao);				 

				paciente.setCpf(Integer.parseInt(rs.getString(6)));
				paciente.setCns(Integer.parseInt(rs.getString(7)));
				paciente.setNomePai(rs.getString(8));
				paciente.setNomeMae(rs.getString(9));
				paciente.setReligiao(rs.getString(10));
				paciente.setDoador(rs.getString(11));


			}
		}
		return paciente;

	}

	public List<Paciente> getPacientes() throws ParseException {

		List<Paciente> pacientes = new ArrayList<Paciente>();
		Paciente paciente = null;
		Hospital hospital = null;
		

		String strQuery = "SELECT nome,idade,hospital_id FROM paciente ORDER BY nome";

		
			rs = conexao.consulte(strQuery);
		

		if(rs!=null){
			try{
				rs.beforeFirst();
				while(rs.next()){
					paciente = new Paciente();
					paciente.setNome(rs.getString("nome"));
					paciente.setIdade(Integer.parseInt(rs.getString("idade")));
					//paciente.setRgCT(Integer.parseInt(rs.getString("rg_ct")));
					//paciente.setCpf(Integer.parseInt(rs.getString("cpf")));
				//	paciente.setCns(Integer.parseInt(rs.getString("cns")));
					
					//data = rs.getDate("dt_nascimento").toString();
					//dt_nascimento.setTime(formatoData.parse(data));
					//paciente.setDt_nascimento(dt_nascimento);
					
				//	data = rs.getDate("dt_internacao").toString();
				//	dt_internacao.setTime(formatoData.parse(data));
				//	paciente.setDt_internacao(dt_internacao);
//					
//					paciente.setNomePai(rs.getString("nomePai"));
//					paciente.setNomeMae(rs.getString("nomeMae"));
//					paciente.setReligiao(rs.getString("religiao"));
//					paciente.setDoador(rs.getString("doador"));
//					
					hospital = hospitalDB.getHospital(rs.getInt("hospital_id"));
					paciente.setHospital(hospital);
					
					pacientes.add(paciente);
				}
			}catch(SQLException sqle){
				
				sqle.getMessage();
				
			}



		}

		return pacientes;

	}

	

}
