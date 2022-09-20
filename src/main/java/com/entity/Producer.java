package com.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Producers")
public class Producer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	@Column(name="ID")
	private int id;
	
	@Column(name="Name", nullable = false)
	private String name;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "producer", cascade={CascadeType.ALL})
	private List<Product> list;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}
	
	
	
}
