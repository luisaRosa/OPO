package br.ufac.bsi.ihm.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.Logic.QuadroClinico;

public class QuadroClinicoDB {

	private Conexao conexao;
	private ResultSet rs;

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;

	}

	public int addQuadroClinico(QuadroClinico quadroClinico) {

		String QueryUpdate = "INSERT INTO quadroclinico(pupilas, egAo, egMrv, egMrm, pressaoArterial, sedado, informacoesAdd) VALUES('"
				+ quadroClinico.getPupilas() + "', " + quadroClinico.getEgAo() + ", " + quadroClinico.getEgMrv() + ", "
				+ quadroClinico.getEgMrm() + ", '" + quadroClinico.getPressaoArterial() + "', '"
				+ quadroClinico.getSedado() + "', '" 
				+ quadroClinico.getInformacoesAdd() + "');";

		return conexao.atualize(QueryUpdate);
	}

	public int recuperaId() {

		String strQuery = "SELECT id FROM quadroclinico ORDER BY id DESC LIMIT 1;";
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

	public QuadroClinico getQuadroClinico(int id) throws SQLException, ParseException {

		String strQuery = "SELECT id, pupilas, egAo,egMrv, egMrm, pressaoArterial, sedado, informacoesAdd "
				+ "FROM quadroClinico WHERE id = " + id + ";";

		QuadroClinico quadroClinico = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {

				quadroClinico = new QuadroClinico();
				quadroClinico.setId(Integer.parseInt(rs.getString("id")));
				quadroClinico.setPupilas(rs.getString("pupilas"));
				quadroClinico.setEgAo(Integer.parseInt(rs.getString("egAo")));
				quadroClinico.setEgMrv(Integer.parseInt(rs.getString("egMrv")));
				quadroClinico.setEgMrm(Integer.parseInt(rs.getString("egMrm")));
				quadroClinico.setPressaoArterial(rs.getString("pressaoArterial"));
				quadroClinico.setSedado(rs.getString("sedado"));
				quadroClinico.setInformacoesAdd(rs.getString("informacoesAdd"));
				
			}
		}
		return quadroClinico;

	}

	public List<QuadroClinico> getQuadroClinico() throws ParseException {

		List<QuadroClinico> quadrosClinicos = new ArrayList<QuadroClinico>();
		QuadroClinico quadroClinico = null;

		String strQuery = "SELECT id, pupilas, egAo,egMrv, egMrm, pressaoArterial, sedado, informacoesAdd FROM hospital ORDER BY id";

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {

					quadroClinico = new QuadroClinico();
					quadroClinico.setId(Integer.parseInt(rs.getString(1)));
					quadroClinico.setPupilas(rs.getString(2));
					quadroClinico.setEgAo(Integer.parseInt(rs.getString(3)));
					quadroClinico.setEgMrv(Integer.parseInt(rs.getString(4)));
					quadroClinico.setEgMrm(Integer.parseInt(rs.getString(5)));
					quadroClinico.setPressaoArterial(rs.getString(6));
					quadroClinico.setSedado(rs.getString(7));
					quadroClinico.setInformacoesAdd(rs.getString(8));

					quadrosClinicos.add(quadroClinico);
				}
			} catch (SQLException sqle) {

				sqle.getMessage();

			}

		}

		return quadrosClinicos;
	}

}
