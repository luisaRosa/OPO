package br.ufac.es1.controleDeDoacoes.Logic;

public class Evolucao {
	
	private int id;
	private Usuario usuarioSistema;
	private String evolucaoPaciente;
	private Paciente paciente;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Usuario getUsuarioSistema() {
		return usuarioSistema;
	}
	public void setUsuarioSistemaCPF(Usuario usuarioSistemaCPF) {
		this.usuarioSistema = usuarioSistema;
	}
	public String getEvolucaoPaciente() {
		return evolucaoPaciente;
	}
	public void setEvolucaoPaciente(String evolucaoPaciente) {
		this.evolucaoPaciente = evolucaoPaciente;
	}
	public Paciente getPacienteNome() {
		return paciente;
	}
	public void setPacienteNome(Paciente paciente) {
		this.paciente = paciente;
	}

}
