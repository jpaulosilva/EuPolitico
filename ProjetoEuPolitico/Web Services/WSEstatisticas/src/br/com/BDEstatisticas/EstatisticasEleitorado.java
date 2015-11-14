package br.com.BDEstatisticas;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class EstatisticasEleitorado {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private String id;
	
	@Persistent
	private String estado;
	
	@Persistent
	private String cidade;
	
	@Persistent
	private int qtdEleitores;
	
	@Persistent
	private double faixaEtariaMedia;
	

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

	public int getQtdEleitores() {
		return qtdEleitores;
	}

	public void setQtdEleitores(int qtdEleitores) {
		this.qtdEleitores = qtdEleitores;
	}

	public double getFaixaEtariaMedia() {
		return faixaEtariaMedia;
	}

	public void setFaixaEtariaMedia(double faixaEtariaMedia) {
		this.faixaEtariaMedia = faixaEtariaMedia;
	}
	
	

}
