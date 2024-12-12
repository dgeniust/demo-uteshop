package me.trihung.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "ProductCategory")
@Getter
@Setter
@NamedQuery(name = "ProductCategory.findAll", query = "SELECT prodType FROM ProductCategory prodType")
public class ProductCategory implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ProductCategoryId")
	private int productCategoryId;
	
	@Column(name = "ProductCategoryName")
	private String productCategoryName;
	
	@OneToMany(mappedBy = "productCategory")
	private List<Product> products;

	public ProductCategory() {
		
	}

}
