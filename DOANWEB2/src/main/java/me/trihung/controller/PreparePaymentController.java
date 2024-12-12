package me.trihung.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Orders;
import me.trihung.entity.Users;
import me.trihung.services.IOrdersService;
import me.trihung.services.impl.OrdersServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = {"/preparepayment", "/preparepayment/pay"}) 
public class PreparePaymentController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Users user = (Users) req.getAttribute("user");
		if (user==null)
			return;
		String url = req.getRequestURI();
		if (url.endsWith("preparepayment/pay")) {
			int price = Integer.parseInt(req.getParameter("lastprice"));
			resp.sendRedirect(req.getContextPath() + "/api/payment/create?price="+price);
		}
		
	}
	
		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Users user = (Users) req.getAttribute("user");
		if (user==null)
			return;
		req.setAttribute("fullname", user.getUserfullName());
		req.setAttribute("email", user.getUserEmail());
		req.setAttribute("address", user.getUseraddress());
		req.setAttribute("phone", user.getUserPhone());
		IOrdersService ios = new OrdersServiceImpl();
		List<Orders> ors = ios.findByIdUser(user.getUserId(), 1);
		if (ors==null||ors.size()==0)
			return;
		req.setAttribute("productname", ors.get(0).getProduct().getProductName());
		req.setAttribute("productprice", ors.get(0).getProduct().getProductPrice());
		req.setAttribute("productamount", ors.get(0).getProduct().getProductAmount());
		long price = ors.get(0).getProduct().getProductAmount() * ors.get(0).getProduct().getProductPrice();
		req.setAttribute("lastprice", price);
		req.getRequestDispatcher("/views/preparepayment.jsp").forward(req, resp);
	}
}
