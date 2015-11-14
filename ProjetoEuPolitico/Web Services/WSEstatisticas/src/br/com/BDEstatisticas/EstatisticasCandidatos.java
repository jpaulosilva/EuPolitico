package br.com.BDEstatisticas;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class EstatisticasCandidatos {
	
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
	private String partido;
	
	@Persistent
	private double totalBens;
	
	@Persistent
	private double totalDoacoes;
	
	@Persistent
	private double gastosCampanha;
	

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

	public double getTotalBens() {
		return totalBens;
	}

	public void setTotalBens(double totalBens) {
		this.totalBens = totalBens;
	}

	public double getTotalDoacoes() {
		return totalDoacoes;
	}

	public void setTotalDoacoes(double totalDoacoes) {
		this.totalDoacoes = totalDoacoes;
	}

	public double getGastosCampanha() {
		return gastosCampanha;
	}

	public void setGastosCampanha(double gastosCampanha) {
		this.gastosCampanha = gastosCampanha;
	}
	
	

}
