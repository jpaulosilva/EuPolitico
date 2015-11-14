package br.com.BDEstatisticas;

public class EstatisticasPoliticosResultado {
	
	private String id;
	
	private String estado;
	
	private String cidade;
	
	private String cargo;
	
	private String partido;
	
	private double faixaEtariaMedia;
	
	private double escolaridadeEnsinoMedio;
	

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

	public String getPartido() {
		return partido;
	}

	public void setPartido(String partido) {
		this.partido = partido;
	}

	public double getFaixaEtariaMedia() {
		return faixaEtariaMedia;
	}

	public void setFaixaEtariaMedia(double faixaEtariaMedia) {
		this.faixaEtariaMedia = faixaEtariaMedia;
	}

	public double getEscolaridadeEnsinoMedio() {
		return escolaridadeEnsinoMedio;
	}

	public void setEscolaridadeEnsinoMedio(double escolaridadeEnsinoMedio) {
		this.escolaridadeEnsinoMedio = escolaridadeEnsinoMedio;
	}
	

}
