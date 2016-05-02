package br.ufac.es1.controleDeDoacoes.Logic;

public class Usuario {
	
	private int cpf;
	private String nome;
	private String funcao;
	private String senha;
	private String localTrabalho;
	
	public int getCpf() {
		return cpf;
	}
	public void setCpf(int cpf) {
		this.cpf = cpf;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getFuncao() {
		return funcao;
	}
	public void setFuncao(String funcao) {
		this.funcao = funcao;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getLocalTrabalho() {
		return localTrabalho;
	}
	public void setLocalTrabalho(String localTrabalho) {
		this.localTrabalho = localTrabalho;
	}

}
