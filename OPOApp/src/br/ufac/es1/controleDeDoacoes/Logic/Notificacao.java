package br.ufac.es1.controleDeDoacoes.Logic;

import java.util.Calendar;

public class Notificacao {
	
	private Paciente paciente;
	private int id;
	private String status;
	private Calendar dtNotificacao;
	
	public int getId(){
		return this.id;
	}
	
	public String getStatus(){
		return this.status;
	}
	
	public Calendar getDtNotificacao(){
		return this.dtNotificacao;
	}
	
	public Paciente getPaciente(){
		return this.paciente;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public void setStatus(String status){
		this.status = status;
	}
	
	public void setDtNotificacao(Calendar dtNotificacao){
		this.dtNotificacao = dtNotificacao;
	}

	public void setPaciente(Paciente paciente){
		this.paciente = paciente;
	}

}
