package br.ufac.bsi.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufac.bsi.es1.controleDeDoacoes.Logic.Endereco;


public class EnderecoDB {

	private Conexao conexao;
	private ResultSet rs;

	public void setConexao(Conexao conexao) {
		this.conexao = conexao;

	}
	

	public int addEndereco(Endereco endereco) {

		String QueryUpdate = "INSERT INTO endereco(cep, cidade, rua, bairro, numCasa, complemento) VALUES("
				+ endereco.getCep() + ", '" + endereco.getCidade() + "', '" + endereco.getRua() + "', '"
				+ endereco.getBairro() + "', " + endereco.getNumCasa() + ", '" + endereco.getComplemento() + "');";

		return conexao.atualize(QueryUpdate);

	}
	
public int recuperaId(){
		
		String strQuery = "SELECT id FROM endereco ORDER BY id DESC LIMIT 1;";
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
	
	
	
	public int updEndereco(Endereco endereco){
		
		String QueryUpdate="UPDATE endereco SET cep = "+ endereco.getCep()+", "
				+ "cidade = '"+ endereco.getCidade()+"', "
				+ "bairro = '"+ endereco.getBairro()+"', "
				+ "rua = '"+ endereco.getRua()+"', "
				+ "numCasa = "+endereco.getNumCasa()+", "
				+ "complemento = '"+endereco.getComplemento()+"' "				
				+"WHERE id ="+ endereco.getId()+";";
		
		return conexao.atualize(QueryUpdate);
		
	}

	public Endereco getEndereco(int id) throws SQLException {

		String query = "SELECT * FROM endereco WHERE id = " + id + ";";
		Endereco endereco = null;

		rs = conexao.consulte(query);

		if (rs != null) {
			rs.beforeFirst();
			if (rs.next()) {
				endereco = new Endereco();
				endereco.setId(rs.getInt("id"));
				endereco.setCep(rs.getInt("cep"));
				endereco.setCidade(rs.getString("cidade"));
				endereco.setBairro(rs.getString("bairro"));
				endereco.setRua(rs.getString("rua"));
				endereco.setNumCasa(rs.getInt("numCasa"));
				endereco.setComplemento(rs.getString("complemento"));
			}

		}
		return endereco;
	}

	public List<Endereco> getEnderecos() {

		List<Endereco> enderecos = new ArrayList<Endereco>();

		String strQuery = "SELECT * FROM endereco ORDER BY id";
		Endereco endereco = null;

		rs = conexao.consulte(strQuery);

		if (rs != null) {

			try {

				rs.beforeFirst();
				while (rs.next()) {
					endereco = new Endereco();
					endereco.setId(rs.getInt("id"));
					endereco.setCep(rs.getInt("cep"));
					endereco.setCidade(rs.getString("cidade"));
					endereco.setBairro(rs.getString("bairro"));
					endereco.setRua(rs.getString("rua"));
					endereco.setNumCasa(rs.getInt("numCasa"));
					endereco.setComplemento(rs.getString("complemento"));

				}

			} catch (SQLException sqle) {
				sqle.getMessage();
			}

		}
		return enderecos;
	}
}
