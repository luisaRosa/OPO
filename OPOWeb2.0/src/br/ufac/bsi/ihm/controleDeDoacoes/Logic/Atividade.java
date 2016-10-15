package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

public class Atividade {
	
	private int id;
	private String atividade;
	private int quantidade;
	private String local;
	private String informacoes;
	private Usuario usuario;
	private RegistroAtividades registro;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAtividade() {
		return atividade;
	}
	public void setAtividade(String atividade) {
		this.atividade = atividade;
	}
	public int getQuantidade() {
		return quantidade;
	}
	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getInformacoes() {
		return informacoes;
	}
	public void setInformacoes(String informacoes) {
		this.informacoes = informacoes;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public RegistroAtividades getRegistro() {
		return registro;
	}
	public void setRegistro(RegistroAtividades registro) {
		this.registro = registro;
	}
	
	

}
