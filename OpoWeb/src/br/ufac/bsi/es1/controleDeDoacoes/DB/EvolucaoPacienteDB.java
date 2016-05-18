package br.ufac.bsi.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.es1.controleDeDoacoes.Logic.EvolucaoPaciente;
import br.ufac.bsi.es1.controleDeDoacoes.Logic.Paciente;
import br.ufac.bsi.es1.controleDeDoacoes.Logic.Usuario;

public class EvolucaoPacienteDB {
	private Conexao conexao;
	private ResultSet rs;
	private PacienteDB pacienteDB = new PacienteDB();
	private UsuarioDB usuarioDB = new UsuarioDB();

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;
		this.pacienteDB.setConexao(conexao);
		this.usuarioDB.setConexao(conexao);

	}

	public int addEvolucaoPaciente(EvolucaoPaciente evolucao) {

		String UpdateQuery="INSERT INTO evolucaopaciente(EvolucaoPaciente, dataEvolucao, paciente_nome, usuarioSistema_cpf)"
				+ " VALUES('"+evolucao.getEvolucaoPaciente()+"', '"
				+evolucao.getDataEvolucao()+"', '"
				+evolucao.getPaciente().getNome()+"', '"
				+evolucao.getUsuarioSistema().getCpf()+"');";
				
				

		return conexao.atualize(UpdateQuery);
	}

	public int recuperaId() {

		String strQuery = "SELECT idEvolucaoPaciente FROM evolucaopaciente ORDER BY id DESC LIMIT 1;";
		rs = conexao.consulte(strQuery);
		try {
			rs.beforeFirst();
			if (rs.next())
				return rs.getInt("idEvolucaoPaciente");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public EvolucaoPaciente getEvolucao(int id) throws SQLException, ParseException {

		String strQuery = "SELECT idEvolucaoPaciente, EvolucaoPaciente, usuarioSistema_cpf, pacienete_nome, dataEvolucao"
				+ " FROM notificacao WHERE idEvolucaoPaciente = " + id + ";";
		EvolucaoPaciente evolucao = null;
		Paciente paciente = null;
		Usuario usuario = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {

				evolucao = new EvolucaoPaciente();
				paciente = new Paciente();
				usuario = new Usuario();
				evolucao.setId(Integer.parseInt(rs.getString(1)));
				evolucao.setEvolucaoPaciente(rs.getString("EvolucaoPaciente"));
				evolucao.setDataEvolucao(rs.getDate("dataEvolucao").toString());

				paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));

				usuario = usuarioDB.getUsuario(rs.getString("usuarioSistema_cpf"));

				if (paciente != null)
					evolucao.setPaciente(paciente);

				if (usuario != null)
					evolucao.setUsuarioSistemaCPF(usuario);

			}
		}
		return evolucao;

	}

	public List<EvolucaoPaciente> getEvolucao() throws ParseException {

		List<EvolucaoPaciente> evolucoes = new ArrayList<EvolucaoPaciente>();
		EvolucaoPaciente evolucao = null;
		Paciente paciente = null;
		Usuario usuario = null;

		String strQuery = "SELECT EvolucaoPaciente, usuarioSistema_cpf, paciente_nome, dataEvolucao from evolucaopaciente ORDER BY idEvolucaoPaciente";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {
					evolucao = new EvolucaoPaciente();
					paciente = new Paciente();
					usuario = new Usuario();
					
					evolucao.setEvolucaoPaciente(rs.getString("EvolucaoPaciente"));
					evolucao.setDataEvolucao(rs.getDate("dataEvolucao").toString());
					paciente = pacienteDB.getPaciente(rs.getString("paciente_nome"));

					usuario = usuarioDB.getUsuario(rs.getString("usuarioSistema_cpf"));

					if (paciente != null)
						evolucao.setPaciente(paciente);

					if (usuario != null)
						evolucao.setUsuarioSistemaCPF(usuario);

					evolucoes.add(evolucao);
				}
			} catch (SQLException sqle) {

				sqle.getMessage();

			}

		}

		return evolucoes;
	}
}
