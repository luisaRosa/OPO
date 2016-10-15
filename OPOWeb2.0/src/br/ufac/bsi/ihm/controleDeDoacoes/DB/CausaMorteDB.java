package br.ufac.bsi.ihm.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.Logic.CausaMorte;


public class CausaMorteDB {

	private Conexao conexao;
	private ResultSet rs;

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;

	}

	public int addCausaMorte(CausaMorte causaMorte) {
		
		String UpdateQuery = "INSERT INTO causamorte(causa) VALUES('" + causaMorte.getCausa() + "');";
		
		return conexao.atualize(UpdateQuery);
	}
	
	public int updCausaMorte(CausaMorte causa){
		
		String QueryUpdate="UPDATE causamorte SET causa = '"+ causa.getCausa()+"' "
				+"WHERE id ="+ causa.getId()+";";
		
		return conexao.atualize(QueryUpdate);
		
	}

	public CausaMorte getCausaMorte(int id) throws SQLException {

		String query = "SELECT * FROM causamorte WHERE id = " + id + ";";
		CausaMorte causaMorte = null;

		rs = conexao.consulte(query);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {

				causaMorte = new CausaMorte();
				causaMorte.setId(rs.getInt("id"));
				causaMorte.setCausa(rs.getString("causa"));

			}
		}

		return causaMorte;
	}

	public List<CausaMorte> getCausaMorte() {

		List<CausaMorte> causas = new ArrayList<CausaMorte>();

		String strQuery = "SELECT * from causamorte ORDER BY id;";
		CausaMorte causaMorte = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {
			try {
				rs.beforeFirst();
				while (rs.next()) {
					causaMorte = new CausaMorte();
					causaMorte.setId(rs.getInt("id"));
					causaMorte.setCausa(rs.getString("causa"));

					causas.add(causaMorte);

				}
			} catch (SQLException sqle) {

			}
		}
		return causas;

	}
}
