package br.ufac.es1.controleDeDoacoes.Logic;

public class QuadroClinico {
	
	private int id;
	private String pupilas;
	private int egAo;
	private int egMrv;
	private int egMrm;
	private String pressaoArterial;
	private String sedado;
	private String informacoesAdd;
	private Paciente paciente;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPupilas() {
		return pupilas;
	}
	public void setPupilas(String pupilas) {
		this.pupilas = pupilas;
	}
	public int getEgAo() {
		return egAo;
	}
	public void setEgAo(int egAo) {
		this.egAo = egAo;
	}
	public int getEgMrv() {
		return egMrv;
	}
	public void setEgMrv(int egMrv) {
		this.egMrv = egMrv;
	}
	public int getEgMrm() {
		return egMrm;
	}
	public void setEgMrm(int egMrM) {
		this.egMrm = egMrM;
	}
	public String getPressaoArterial() {
		return pressaoArterial;
	}
	public void setPressaoArterial(String pressaoArterial) {
		this.pressaoArterial = pressaoArterial;
	}
	public String getSedado() {
		return sedado;
	}
	public void setSedado(String sedado) {
		this.sedado = sedado;
	}
	public String getInformacoesAdd() {
		return informacoesAdd;
	}
	public void setInformacoesAdd(String informacoesAdd) {
		this.informacoesAdd = informacoesAdd;
	}
	public Paciente getPaciente() {
		return paciente;
	}
	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}


}
