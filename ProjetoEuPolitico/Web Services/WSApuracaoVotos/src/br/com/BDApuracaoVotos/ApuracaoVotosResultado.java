package br.com.BDApuracaoVotos;

public class ApuracaoVotosResultado {
	
	private String id;
	
	private String estado;
	
	private String cidade;
	
	private String cargo;
	
	private int numeroCandidato;
	
	private String candidato;
	
	private int numeroVotos;
	
	private double porcentagemVotos;
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public int getNumeroCandidato() {
		return numeroCandidato;
	}

	public void setNumeroCandidato(int numeroCandidato) {
		this.numeroCandidato = numeroCandidato;
	}

	public String getCandidato() {
		return candidato;
	}

	public void setCandidato(String candidato) {
		this.candidato = candidato;
	}

	public int getNumeroVotos() {
		return numeroVotos;
	}

	public void setNumeroVotos(int numeroVotos) {
		this.numeroVotos = numeroVotos;
	}

	public double getPorcentagemVotos() {
		return porcentagemVotos;
	}

	public void setPorcentagemVotos(double porcentagemVotos) {
		this.porcentagemVotos = porcentagemVotos;
	}
	
	

}
