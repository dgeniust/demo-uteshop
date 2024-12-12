package me.trihung.entity.model;

import java.io.Serializable;
import lombok.Getter;
import lombok.Setter;
import me.trihung.entity.Product;
import me.trihung.entity.Rating;


@Getter
@Setter
public class ProductModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int productId;
	
	private String productName;
	
	private String productImage;
	
	private long productPrice;
	
	private long productAmount;
		
	private int productCategory;

	private String productCategoryName;
	
	private double avgRating;
	
	public ProductModel(Product product) {
		productId = product.getProductId();
		productName = product.getProductName();
		productImage = "http://localhost:8080/DAWEBB/image?from=product&fname="+product.getProductImage();
		productPrice = product.getProductPrice();
		productAmount = product.getProductAmount();
		productCategory = product.getProductCategory().getProductCategoryId();
		productCategoryName = product.getProductCategory().getProductCategoryName();
		avgRating = 0;
		if(product.getRatings().size() > 0) {
			for(Rating x : product.getRatings()) {
				avgRating += x.getRatingValue();
			}
			avgRating = avgRating / product.getRatings().size();
		}
	}
	

	
}