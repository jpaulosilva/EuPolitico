package br.com.BDPesquisaEleitoral;

public class PesquisaEleitoralResultado {
	
	private String id;
	
	private String estado;
	
	private String cidade;
	
	private String cargo;
	
	private String numeroCandidato;
	
	private String nomeCandidato;
	
	private String qtdVotos;
	
	
	public String getNumeroCandidato() {
		return numeroCandidato;
	}
	public void setNumeroCandidato(String numeroCandidato) {
		this.numeroCandidato = numeroCandidato;
	}
	public String getNomeCandidato() {
		return nomeCandidato;
	}
	public void setNomeCandidato(String nomeCandidato) {
		this.nomeCandidato = nomeCandidato;
	}
	private String institutoPesquisa;
	
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
	public String getQtdVotos() {
		return qtdVotos;
	}
	public void setQtdVotos(String qtdVotos) {
		this.qtdVotos = qtdVotos;
	}
	public String getInstitutoPesquisa() {
		return institutoPesquisa;
	}
	public void setInstitutoPesquisa(String institutoPesquisa) {
		this.institutoPesquisa = institutoPesquisa;
	}
	
	

}
