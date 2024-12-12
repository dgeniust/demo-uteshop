package me.trihung.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;


@Entity
@Table(name = "Product")
@Getter
@Setter
@NamedQuery(name = "Product.findAll", query = "SELECT prod FROM Product prod")
public class Product implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ProductId")
	private int productId;
	
	@Column(name = "ProductName", columnDefinition = "NVARCHAR(200) NOT NULL")
	private String productName;
	
	@Column(name = "ProductImage", columnDefinition = "NVARCHAR(200) NULL")
	private String productImage;
	
	@Column(name = "ProductPrice", columnDefinition = "bigint")
	private long productPrice;
	
	@Column(name = "ProductAmount", columnDefinition = "bigint")
	private long productAmount;
	
	@ManyToOne
	@JoinColumn(name = "ProductCategoryId")
	private ProductCategory productCategory;
	
	@OneToMany(mappedBy = "productId")
	private List<Rating> ratings;

	public Product() {
		
	}
	

	
}
