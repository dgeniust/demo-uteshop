package me.trihung.entity.model;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import me.trihung.entity.Orders;

@Getter
@Setter
public class OrdersModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private int orderId;
	
	private long orderPrice;
	
	private long orderCount;
	
	//1 = in cart, 2 = complete buy
	private int orderStatus;
	
	private int userid;

	private int productId;
	
	private String productName;
	
	private String productImg;
	
	
	public OrdersModel(Orders order) {
		orderId = order.getOrderId();
		orderPrice = order.getOrderPrice();
		orderCount = order.getOrderCount();
		orderStatus = order.getOrderStatus();
		userid = order.getUser().getUserId();
		productId = order.getProduct().getProductId();
		productName = order.getProduct().getProductName();
		productImg = "http://localhost:8080/DAWEBB/image?from=user&fname="+order.getProduct().getProductImage();
	}
}