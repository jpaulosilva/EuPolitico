package br.com.BDEstatisticas;

public class EstatisticasEleitoradoResultado {
	
	private String id;
	
	private String estado;
	
	private String cidade;
	
	private int qtdEleitores;
	
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
