package br.ufac.bsi.ihm.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.Logic.RegistroAtividades;
import br.ufac.bsi.ihm.controleDeDoacoes.Logic.Usuario;

public class RegistroAtividadesDB {

	
	private Conexao conexao;
	private ResultSet rs;
	private UsuarioDB usuarioDB = new UsuarioDB();

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;
		this.usuarioDB.setConexao(conexao);
	}
	
	public int addAtividades(RegistroAtividades registro) throws SQLException{
		
		String UpdateQuery = "INSERT INTO registroatividades(data, usuarioSistema_cpf)"
				+ "VALUES('"+registro.getData()+"','"+registro.getUsuario().getCpf()+"');";
		
		return conexao.atualize(UpdateQuery);
		
	}
	
	public int recuperaId(){
			
			String strQuery = "SELECT id FROM registroatividades ORDER BY id DESC LIMIT 1;";
			rs = conexao.consulte(strQuery);
			try {
				rs.beforeFirst();
				if(rs.next())
					return rs.getInt("id");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0;
		}
	
	
	public RegistroAtividades getAtividades(int id) throws SQLException, ParseException {

		String strQuery = "SELECT * FROM registroatividades WHERE id = " + id + ";";
		RegistroAtividades registro= null;
		Usuario usuario = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {

				registro = new RegistroAtividades();
				usuario = new Usuario();
				registro.setId(Integer.parseInt(rs.getString("id")));
				registro.setData(rs.getDate("data").toString());
								
				usuario = usuarioDB.getUsuario(rs.getString("usuarioSistema_cpf"));

				if (usuario != null)
					registro.setUsuario(usuario);

			}
		}
		return registro;

	}

	public List<RegistroAtividades> getAtividades() throws ParseException {

		List<RegistroAtividades> atividades = new ArrayList<RegistroAtividades>();
		RegistroAtividades registro = null;
		Usuario usuario = null;

		String strQuery = "SELECT * FROM registroAtividades";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {
					registro = new RegistroAtividades();
					usuario = new Usuario();
					
					registro.setId(Integer.parseInt(rs.getString("id")));
					registro.setData(rs.getDate("data").toString());
									
					usuario = usuarioDB.getUsuario(rs.getString("usuarioSistema_cpf"));


					if (usuario != null)
						registro.setUsuario(usuario);

					atividades.add(registro);
				}
			} catch (SQLException sqle) {

				sqle.getMessage();

			}

		}

		return atividades;
	}
}
