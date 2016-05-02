package br.ufac.es1.controleDeDoacoes.Logic;

import java.util.Calendar;
import java.util.Date;

public class Paciente {
	
	private String nome;
	private int rgCT;
	private int cpf;
	private int cns;
	private int idade;
	private Calendar dt_nascimento;
	private Calendar dt_internacao;
	private String nomeMae;
	private String nomePai;
	private String religiao;
	private String doador;
	private Hospital hospital;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getRgCT() {
		return rgCT;
	}
	public void setRgCT(int rgCT) {
		this.rgCT = rgCT;
	}
	public int getCpf() {
		return cpf;
	}
	public void setCpf(int cpf) {
		this.cpf = cpf;
	}
	public int getCns() {
		return cns;
	}
	public void setCns(int cns) {
		this.cns = cns;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public Calendar getDt_nascimento() {
		return dt_nascimento;
	}
	public void setDt_nascimento(Calendar dt_nascimento) {
		this.dt_nascimento = dt_nascimento;
	}
	public Calendar getDt_internacao() {
		return dt_internacao;
	}
	public void setDt_internacao(Calendar dt_internacao) {
		this.dt_internacao = dt_internacao;
	}
	public String getNomeMae() {
		return nomeMae;
	}
	public void setNomeMae(String nomeMae) {
		this.nomeMae = nomeMae;
	}
	public String getNomePai() {
		return nomePai;
	}
	public void setNomePai(String nomePai) {
		this.nomePai = nomePai;
	}
	public String getReligiao() {
		return religiao;
	}
	public void setReligiao(String religiao) {
		this.religiao = religiao;
	}
	public String getDoador() {
		return doador;
	}
	public void setDoador(String doador) {
		this.doador = doador;
	}
	public Hospital getHospital() {
		return hospital;
	}
	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}
	
	
	

}
