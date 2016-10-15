package br.ufac.bsi.ihm.controleDeDoacoes.Logic;



public class Notificacao {

	private int id;
	private String status;
	private String dtNotificacao;
	private String horaNotificacao;
	private Usuario usuario;

	public int getId() {
		return this.id;
	}

	public String getStatus() {
		return this.status;
	}

	public String getDtNotificacao() {
		return this.dtNotificacao;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDtNotificacao(String dtNotificacao) {
		this.dtNotificacao = dtNotificacao;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getHoraNotificacao() {
		return horaNotificacao;
	}

	public void setHoraNotificacao(String horaNotificacao) {
		this.horaNotificacao = horaNotificacao;
	}

}
