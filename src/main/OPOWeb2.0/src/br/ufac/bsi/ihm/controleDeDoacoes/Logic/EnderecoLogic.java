package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

import java.sql.SQLException;
import java.util.List;

import br.ufac.bsi.ihm.controleDeDoacoes.DB.Conexao;
import br.ufac.bsi.ihm.controleDeDoacoes.DB.EnderecoDB;

public class EnderecoLogic {

	private EnderecoDB edb = new EnderecoDB();

	public void setConexao(Conexao conexao) {
		edb.setConexao(conexao);
	}

	public int addEndereco(Endereco endereco) throws SQLException {

		return edb.addEndereco(endereco);
	}
	
	public int updEndereco(Endereco endereco) throws SQLException{
		
		return edb.updEndereco(endereco);
	}
	
	public int recuperaId(){
		
		return edb.recuperaId();
	}

	public Endereco getEndereco(int cep) {

		Endereco endereco = null;

		try {
			return edb.getEndereco(cep);
		} catch (SQLException e) {
			e.getMessage();
		}
		return endereco;
	}

	public List<Endereco> getEnderecos() {
		return edb.getEnderecos();
	}

}
