package br.ufac.bsi.es1.controleDeDoacoes.Logic;



public class Notificacao {

	private int id;
	private String status;
	private String dtNotificacao;
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

}
