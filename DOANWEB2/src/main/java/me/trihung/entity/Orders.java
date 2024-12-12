package me.trihung.entity;

import java.io.Serializable;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "Orders")
@NamedQuery(name = "Orders.findAll", query = "SELECT ord FROM Orders ord")
public class Orders implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "OrderId")
	private int orderId;
	
	@Column(name = "OrderPrice", columnDefinition = "BIGINT NOT NULL")
	private long orderPrice;
	
	@Column(name = "OrderCount", columnDefinition = "BIGINT NOT NULL")
	private long orderCount;
	
	//1 = in cart, 2 = complete buy, 3= deny
	@Column(name = "OrderStatus", columnDefinition = "INT NOT NULL")
	private int orderStatus;
	
	@ManyToOne
	@JoinColumn(name = "UserId")
	private Users user;
	
	@ManyToOne
	@JoinColumn(name = "ProductId")
	private Product product;

	public Orders() {
	}

	
	
}
