package br.ufac.bsi.ihm.controleDeDoacoes.Logic;

public class EvolucaoPaciente {

	private int id;
	private Usuario usuario;
	private String evolucaoPaciente;
	private String dataEvolucao;
	private String horaEvolucao;
	private Paciente paciente;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Usuario getUsuarioSistema() {
		return usuario;
	}

	public void setUsuarioSistemaCPF(Usuario usuarioSistemaCPF) {
		this.usuario = usuarioSistemaCPF;
	}

	public String getEvolucaoPaciente() {
		return evolucaoPaciente;
	}

	public void setEvolucaoPaciente(String evolucaoPaciente) {
		this.evolucaoPaciente = evolucaoPaciente;
	}

	public Paciente getPaciente() {
		return paciente;
	}

	public void setPaciente(Paciente paciente) {
		this.paciente = paciente;
	}

	public String getDataEvolucao() {
		return dataEvolucao;
	}

	public void setDataEvolucao(String dataEvolucao) {
		this.dataEvolucao = dataEvolucao;
	}

	public String getHoraEvolucao() {
		return horaEvolucao;
	}

	public void setHoraEvolucao(String horaEvolucao) {
		this.horaEvolucao = horaEvolucao;
	}

}
