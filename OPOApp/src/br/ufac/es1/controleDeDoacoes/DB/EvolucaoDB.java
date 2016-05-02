package br.ufac.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.Logic.Evolucao;
import br.ufac.es1.controleDeDoacoes.Logic.Notificacao;
import br.ufac.es1.controleDeDoacoes.Logic.Paciente;
import br.ufac.es1.controleDeDoacoes.Logic.Usuario;

public class EvolucaoDB {
	
	private Conexao conexao;
	private ResultSet rs;
	private PacienteDB pacienteDB = new PacienteDB();
	private UsuarioDB usuarioDB = new UsuarioDB();

	
	public void setConexao(Conexao conexao){
		this.conexao = conexao;
		this.pacienteDB.setConexao(conexao);
		this.usuarioDB.setConexao(conexao);

	}

	public Evolucao getEvolucao(int id) throws SQLException, ParseException{



		String strQuery = "SELECT id, EvolucaoPaciente, usuarioSistema_cpf, pacienete_nome"+
				"FROM notificacao WHERE id = "+id+";";
		Evolucao evolucao = null;
		Paciente paciente = null;
		Usuario usuario = null;

		rs = conexao.consulte(strQuery);

		if(rs!=null){
			rs.beforeFirst();
			if(rs.next()){
				
				evolucao = new Evolucao();
				paciente = new Paciente();
				usuario = new Usuario();
				evolucao.setId(Integer.parseInt(rs.getString(1)));
				
				paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));
				
				usuario = usuarioDB.getUsuario(rs.getInt("usuarioSistema_cpf"));
				
				if(paciente!= null)
					evolucao.setPacienteNome(paciente);
				
				if(usuario!= null)
					evolucao.setUsuarioSistemaCPF(usuario);
					
			


			}
		}
		return evolucao;

	}

	public List<Evolucao> getEvolucao() throws ParseException {

		List<Evolucao> evolucoes = new ArrayList<Evolucao>();
		Evolucao evolucao = null;
		Paciente paciente = null;
		Usuario usuario = null;
		

				String strQuery = "SELECT id, EvolucaoPaciente, usuarioSistema_cpf, pacienete_nome ORDER BY id";

		
			rs = conexao.consulte(strQuery);
		

		if(rs!=null){
			try{
				rs.beforeFirst();
				while(rs.next()){
					evolucao = new Evolucao();
					paciente = new Paciente();
					usuario = new Usuario();
					evolucao.setId(Integer.parseInt(rs.getString(1)));
					
					paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));
					
					usuario = usuarioDB.getUsuario(rs.getInt("usuarioSistema_cpf"));
					
					if(paciente!= null)
						evolucao.setPacienteNome(paciente);
					
					if(usuario!= null)
						evolucao.setUsuarioSistemaCPF(usuario);
						
				
					evolucoes.add(evolucao);
				}
			}catch(SQLException sqle){
				
				sqle.getMessage();
				
			}

		}

		return evolucoes;
	}
}
