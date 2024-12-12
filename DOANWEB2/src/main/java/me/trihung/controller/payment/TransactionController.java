/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package me.trihung.controller.payment;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Orders;
import me.trihung.entity.Transaction;
import me.trihung.entity.Users;
import me.trihung.services.IOrdersService;
import me.trihung.services.IProductService;
import me.trihung.services.ITransactionService;
import me.trihung.services.impl.OrdersServiceImpl;
import me.trihung.services.impl.ProductServiceImpl;
import me.trihung.services.impl.TransactionServiceImpl;
import me.trihung.vnpay.VNPayConfig;

@WebServlet(urlPatterns = { "/payment/check" })
public class TransactionController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		Users user = (Users) req.getAttribute("user");
		System.out.println("ok trans");
		if (getStatus(req).equals("ordersuccess")) {
			System.out.println("complete transaction");
			IOrdersService ios = new OrdersServiceImpl();
			IProductService ips = new ProductServiceImpl();
	        List<Orders> list = ios.findAll(); 
	        if (list!=null && list.size() >0) {
	        	for (Orders o: list) {
	            	o.setOrderStatus(2);
	            	if (o.getProduct().getProductAmount()>=o.getOrderCount()) {
	            		o.getProduct().setProductAmount(o.getProduct().getProductAmount()-o.getOrderCount());
	            		System.out.println(o.getProduct().getProductAmount()+" reduce -> "+o.getOrderCount());
	            		ips.update(o.getProduct());
	            	}
	            	ios.update(o);
	            }
	        	System.out.println("orders complete: "+list.size());
	        }
	        Transaction tran = new Transaction();
	        tran.setTransactionDay(new Date(System.currentTimeMillis()));
	        tran.setTransAddress(user.getUseraddress());
	        tran.setTransStatus(1);
	        long price = Long.parseLong(req.getParameter("vnp_Amount"));
	        tran.setTransTotalValue(price);
	        tran.setUser(user);

	        ITransactionService its = new TransactionServiceImpl();
	        its.insert(tran);
	        req.getRequestDispatcher("/views/success.jsp").forward(req, resp);
		}else {
			System.out.println("fail transaction");
			req.getRequestDispatcher("/views/fail.jsp").forward(req, resp);
		}

	}

	public String getStatus(HttpServletRequest request) {
		int paymentStatus = orderReturn(request);

		String orderInfo = request.getParameter("vnp_OrderInfo");
		String paymentTime = request.getParameter("vnp_PayDate");
		String transactionId = request.getParameter("vnp_TransactionNo");
		String totalPrice = request.getParameter("vnp_Amount");
		
//        model.addAttribute("orderId", orderInfo);
//        model.addAttribute("totalPrice", totalPrice);
//        model.addAttribute("paymentTime", paymentTime);
//        model.addAttribute("transactionId", transactionId);

		return paymentStatus == 1 ? "ordersuccess" : "orderfail";
	}

	public int orderReturn(HttpServletRequest request) {
		Map fields = new HashMap();
		for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
			String fieldName = null;
			String fieldValue = null;
			try {
				fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
				fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				fields.put(fieldName, fieldValue);
			}
		}

		String vnp_SecureHash = request.getParameter("vnp_SecureHash");
		if (fields.containsKey("vnp_SecureHashType")) {
			fields.remove("vnp_SecureHashType");
		}
		if (fields.containsKey("vnp_SecureHash")) {
			fields.remove("vnp_SecureHash");
		}
		String signValue = VNPayConfig.hashAllFields(fields);
		if (signValue.equals(vnp_SecureHash)) {
			if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
				return 1;
			} else {
				return 0;
			}
		} else {
			return -1;
		}
	}

}
