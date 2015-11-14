package br.com.BDPesquisaEleitoral;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class PesquisaEleitoral {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private String id;
	
	@Persistent
	private String estado;
	
	@Persistent
	private String cidade;
	
	@Persistent
	private String cargo;
	
	@Persistent
	private String numeroCandidato;
	
	@Persistent
	private String nomeCandidato;
	
	@Persistent
	private String qtdVotos;
	
	@Persistent
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
