package br.ufac.bsi.ihm.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.Logic.Atividade;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.RegistroAtividades;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario;

public class AtividadeDB {
	
	private Conexao conexao;
	private ResultSet rs;
	private UsuarioDB usuarioDB = new UsuarioDB();
	private RegistroAtividadesDB registroDB = new RegistroAtividadesDB();

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;
		this.usuarioDB.setConexao(conexao);
		this.registroDB.setConexao(conexao);
	}
	
	public int addAtividades(Atividade atividade) throws SQLException{
		
		String UpdateQuery = "INSERT INTO atividades(atividade, quantidade, local, informacoes, registroAtividades_usuarioSistema_cpf, registroAtividades_id)"
				+ "VALUES('"+atividade.getAtividade()+"',"+atividade.getQuantidade()+", '"+ atividade.getLocal()+"', '"+atividade.getInformacoes()+"', '"
				+atividade.getUsuario().getCpf()+"', "+atividade.getRegistro().getId()+");";
		
		return conexao.atualize(UpdateQuery);
		
	}
	

	
	
	public Atividade getAtividades(int id) throws SQLException, ParseException {

		String strQuery = "SELECT * FROM atividades WHERE id = " + id + ";";
		Atividade atividade = null;
		RegistroAtividades registro= null;
		Usuario usuario = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {

				atividade = new Atividade();
				registro = new RegistroAtividades();
				usuario = new Usuario();
				atividade.setId(Integer.parseInt(rs.getString("id")));
				atividade.setAtividade(rs.getString("atividade"));
				atividade.setQuantidade(Integer.parseInt(rs.getString("quantidade")));
				atividade.setLocal(rs.getString("local"));
				atividade.setInformacoes(rs.getString("informacoes"));
				
				registro = registroDB.getAtividades(rs.getInt("registroAtividades_id"));				
				usuario = usuarioDB.getUsuario(rs.getString("registroAtividades_usuarioSistema_cpf"));

				if (usuario != null)
					atividade.setUsuario(usuario);
				
				if (registro != null)
					atividade.setRegistro(registro);

			}
		}
		return atividade;

	}

	public List<Atividade> getAtividades() throws ParseException {

		List<Atividade> atividades = new ArrayList<Atividade>();
		Atividade atividade = null;
		RegistroAtividades registro = null;
		Usuario usuario = null;

		String strQuery = "SELECT * FROM Atividades";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {
					
					atividade = new Atividade();
					registro = new RegistroAtividades();
					usuario = new Usuario();
					atividade.setId(Integer.parseInt(rs.getString("id")));
					atividade.setAtividade(rs.getString("atividade"));
					atividade.setQuantidade(Integer.parseInt(rs.getString("quantidade")));
					atividade.setLocal(rs.getString("local"));
					atividade.setInformacoes(rs.getString("informacoes"));
					
					registro = registroDB.getAtividades(rs.getInt("registroAtividades_id"));				
					usuario = usuarioDB.getUsuario(rs.getString("registroAtividades_usuarioSistema_cpf"));

					if (usuario != null)
						atividade.setUsuario(usuario);
					
					if (registro != null)
						atividade.setRegistro(registro);
					
					

					atividades.add(atividade);
				}
			} catch (SQLException sqle) {

				sqle.getMessage();

			}

		}

		return atividades;
	}

}
