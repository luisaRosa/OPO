package br.ufac.es1.controleDeDoacoes.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.ufac.es1.controleDeDoacoes.Logic.Paciente;
import br.ufac.es1.controleDeDoacoes.Logic.Usuario;

public class UsuarioDB {
	
	private Conexao conexao;
	private ResultSet rs;
	

	public void setConexao(Conexao conexao){
		this.conexao = conexao;

	}

	public Usuario getUsuario(int cpf) throws SQLException, ParseException{


		String strQuery = "SELECT nome, cpf, funcao, senha, localTrabalho "+
				"FROM usuario WHERE cpf = "+cpf+";";
		Usuario usuario = null;


		rs = conexao.consulte(strQuery);

		if(rs!=null){
			rs.beforeFirst();
			if(rs.next()){
				usuario = new Usuario();
				usuario.setNome(rs.getString(1));
				usuario.setCpf(Integer.parseInt(rs.getString(2)));
				usuario.setFuncao(rs.getString(3));
				usuario.setLocalTrabalho(rs.getString(4));


			}
		}
		return usuario;

	}

	public List<Usuario> getUsuarios() throws ParseException {

		List<Usuario> usuarios = new ArrayList<Usuario>();
		Paciente paciente = null;
		

		String strQuery = "SELECT nome, cpf, funcao, senha, localTrabalho FROM paciente ORDER BY nome";

		
			rs = conexao.consulte(strQuery);
			Usuario usuario = null;
		

		if(rs!=null){
			try{
				rs.beforeFirst();
				while(rs.next()){
					usuario = new Usuario();
					usuario.setNome(rs.getString(1));
					usuario.setCpf(Integer.parseInt(rs.getString(2)));
					usuario.setFuncao(rs.getString(3));
					usuario.setLocalTrabalho(rs.getString(4));
					
					usuarios.add(usuario);
				}
			}catch(SQLException sqle){
				
				sqle.getMessage();
				
			}



		}

		return usuarios;

	}


}
