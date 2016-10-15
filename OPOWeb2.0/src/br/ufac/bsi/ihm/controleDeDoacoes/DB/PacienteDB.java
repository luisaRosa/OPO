package br.ufac.bsi.ihm.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.Logic.CausaMorte;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.Endereco;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.Hospital;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.MotivoNaoDoacao;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.Notificacao;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.Paciente;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.QuadroClinico;

public class PacienteDB {

	private Conexao conexao;
	private ResultSet rs;
	private HospitalDB hospitalDB = new HospitalDB();
	private QuadroClinicoDB quadroClinicoDB = new QuadroClinicoDB();
	private NotificacaoDB notificacaoDB = new NotificacaoDB();
	private EnderecoDB enderecoDB = new EnderecoDB();
	private CausaMorteDB causaMorteDB = new CausaMorteDB();
	private MotivoNaoDoacaoDB motivoNaoDoacaoDB = new MotivoNaoDoacaoDB();

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;
		hospitalDB.setConexao(conexao);
		quadroClinicoDB.setConexao(conexao);
		notificacaoDB.setConexao(conexao);
		enderecoDB.setConexao(conexao);
		causaMorteDB.setConexao(conexao);
		motivoNaoDoacaoDB.setConexao(conexao);

	}

	public int addPaciente(Paciente paciente) {

		String UpdateQuery = "INSERT INTO paciente(nome, idade, notificacao_id, quadroClinico_id, hospital_id, causaMorte_id, MotivoNaoDoacao_id, endereco_id)"
				+ " VALUES('"+ paciente.getNome()+"', "+
				paciente.getIdade()+", "+
				paciente.getNotificacao().getId()+", "+
				paciente.getQuadroClinico().getId()+", "+
				paciente.getHospital().getId()+", "+
				paciente.getCausaMorte().getId()+", "+
				paciente.getmNaoDoacao().getId()+", "+
				paciente.getEndereco().getId()+");";

		return conexao.atualize(UpdateQuery);
	}
	
	public int updPaciente(Paciente paciente){
		
		String UpdateQuery = "UPDATE paciente SET "+
				"notificacao_id = "+paciente.getNotificacao().getId()+", "+
				"endereco_id = "+paciente.getEndereco().getId()+", "+
				"WHERE nome ='"+ paciente.getNome()+"';";
		
		return conexao.atualize(UpdateQuery);
	}

	public Paciente getPaciente(String nome) throws SQLException, ParseException {

		String strQuery = "SELECT nome, idade, hospital_id, notificacao_id, quadroClinico_id "
				+ "FROM paciente WHERE nome = '" + nome + "';";
		Paciente paciente = null;
		Notificacao notificacao = null;
		Hospital hospital = null;
		QuadroClinico quadroClinico = null;
//		Endereco endereco = null;
//		CausaMorte causaMorte = null;
//		MotivoNaoDoacao motivoNaoDoacao = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {
				paciente = new Paciente();
				paciente.setNome(rs.getString("nome"));
				paciente.setIdade(rs.getInt("idade"));
//				paciente.setRgCT(Integer.parseInt(rs.getString(2)));
//				paciente.setIdade(Integer.parseInt(rs.getString(3)));
//
//				paciente.setDt_nascimento(rs.getDate(4));
//				paciente.setDt_internacao(rs.getDate(5));
//
//				paciente.setCpf(Integer.parseInt(rs.getString(6)));
//				paciente.setCns(Integer.parseInt(rs.getString(7)));
//				paciente.setNomePai(rs.getString(8));
//				paciente.setNomeMae(rs.getString(9));
//				paciente.setReligiao(rs.getString(10));
//				paciente.setDoador(rs.getString(11));

				notificacao = notificacaoDB.getNotificacao(rs.getInt("notificacao_id"));
				paciente.setNotificacao(notificacao);

				hospital = hospitalDB.getHospital(rs.getInt("hospital_id"));
				paciente.setHospital(hospital);

				quadroClinico = quadroClinicoDB.getQuadroClinico(rs.getInt("quadroClinico_id"));
				paciente.setQuadroClinico(quadroClinico);

//				endereco = enderecoDB.getEndereco(rs.getInt("endereco_id"));
//				paciente.setEndereco(endereco);
//
//				causaMorte = causaMorteDB.getCausaMorte(rs.getInt("causaMorte_id"));
//				paciente.setCausaMorte(causaMorte);
//
//				motivoNaoDoacao = motivoNaoDoacaoDB.getMotivo(rs.getInt("motivoNaoDoacao_id"));
//				paciente.setmNaoDoacao(motivoNaoDoacao);

			}
		}
		return paciente;

	}

	public List<Paciente> getPacientes() throws ParseException {

		List<Paciente> pacientes = new ArrayList<Paciente>();
		Paciente paciente = null;
		Hospital hospital = null;
		QuadroClinico quadroClinico = null;
		Notificacao notificacao = null;
		Endereco endereco = null;
		CausaMorte causaMorte = null;
		MotivoNaoDoacao motivoNaoDoacao = null;

		String strQuery = "SELECT nome, idade, hospital_id, quadroClinico_id, notificacao_id, endereco_id, causaMorte_id, motivoNaoDoacao_id FROM paciente ORDER BY notificacao_id DESC";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {
					paciente = new Paciente();
					paciente.setNome(rs.getString("nome"));
					paciente.setIdade(rs.getInt("idade"));

					hospital = hospitalDB.getHospital(rs.getInt("hospital_id"));
					paciente.setHospital(hospital);

					quadroClinico = quadroClinicoDB.getQuadroClinico(rs.getInt("quadroClinico_id"));
					paciente.setQuadroClinico(quadroClinico);

					notificacao = notificacaoDB.getNotificacao(rs.getInt("notificacao_id"));
					paciente.setNotificacao(notificacao);

					endereco = enderecoDB.getEndereco(rs.getInt("endereco_id"));
					paciente.setEndereco(endereco);

					causaMorte = causaMorteDB.getCausaMorte(rs.getInt("causaMorte_id"));
					paciente.setCausaMorte(causaMorte);

					motivoNaoDoacao = motivoNaoDoacaoDB.getMotivo(rs.getInt("motivoNaoDoacao_id"));
					paciente.setmNaoDoacao(motivoNaoDoacao);

					pacientes.add(paciente);
				}
			} catch (SQLException sqle) {

				sqle.getMessage();

			}

		}

		return pacientes;

	}

}
