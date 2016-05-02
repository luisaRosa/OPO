package br.ufac.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.Logic.Hospital;
import br.ufac.es1.controleDeDoacoes.Logic.Notificacao;
import br.ufac.es1.controleDeDoacoes.Logic.Paciente;

public class NotificacaoDB {
	

	private Conexao conexao;
	private ResultSet rs;
	private PacienteDB pacienteDB = new PacienteDB();
	SimpleDateFormat formatoData = new SimpleDateFormat("dd/MM/yyyy");
	Calendar dt_notificacao = Calendar.getInstance();
	String data;
	
	public void setConexao(Conexao conexao){
		this.conexao = conexao;
		this.pacienteDB.setConexao(conexao);

	}

	public Notificacao getNotificacao(int id) throws SQLException, ParseException{



		String strQuery = "SELECT id, status, dt_notificacao, paciente_nome "+
				"FROM notificacao WHERE id = "+id+";";
		Paciente paciente = null;
		Notificacao notificacao = null;


		rs = conexao.consulte(strQuery);

		if(rs!=null){
			rs.beforeFirst();
			if(rs.next()){
				
				notificacao = new Notificacao();
				paciente = new Paciente();
				notificacao.setId(Integer.parseInt(rs.getString(1)));
				notificacao.setStatus(rs.getString(2));
				
				data = rs.getDate(3).toString();
				dt_notificacao.setTime(formatoData.parse(data));
				notificacao.setDtNotificacao(dt_notificacao);
				
				paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));
				
				if(paciente!= null)
					notificacao.setPaciente(paciente);
			


			}
		}
		return notificacao;

	}

	public List<Notificacao> getNotificacoes() throws ParseException {

		List<Notificacao> notificacoes = new ArrayList<Notificacao>();
		Notificacao notificacao = null;
		Paciente paciente = null;
		

		String strQuery = "SELECT id, status, dt_notificacao, paciente_nome FROM hospital ORDER BY id";

		
			rs = conexao.consulte(strQuery);
		

		if(rs!=null){
			try{
				rs.beforeFirst();
				while(rs.next()){
					notificacao = new Notificacao();
					paciente = new Paciente();
					notificacao.setId(Integer.parseInt(rs.getString(1)));
					notificacao.setStatus(rs.getString(2));
					
					data = rs.getDate(3).toString();
					dt_notificacao.setTime(formatoData.parse(data));
					notificacao.setDtNotificacao(dt_notificacao);
					
					paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));
					
					if(paciente!= null)
						notificacao.setPaciente(paciente);
					
					notificacoes.add(notificacao);
				}
			}catch(SQLException sqle){
				
				sqle.getMessage();
				
			}



		}

		return notificacoes;
	}

}
