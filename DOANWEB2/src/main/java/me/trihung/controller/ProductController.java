package me.trihung.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Users;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/product") 
public class ProductController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		
	}
		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Users user = (Users) req.getAttribute("user");
//		if (user==null) {
//			resp.sendRedirect(req.getContextPath() + "/login");
//			return;
//		}
		req.getRequestDispatcher("/views/user/product/product-list.jsp").forward(req, resp);

	}
}
