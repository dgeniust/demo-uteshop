package me.trihung.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Users;
import me.trihung.jwt.JwtUtil;
import me.trihung.services.IUserService;
import me.trihung.services.impl.UserServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/login") 
public class LoginController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		if (username == null || password == null) {
			req.setAttribute("msg", "Trống!");
			req.setAttribute("color", "red");
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);

			//return to login page 
			return;
		}
		IUserService ius = new UserServiceImpl();
		if (ius.login(username, password)) {
			String token = JwtUtil.generateToken(username);
			resp.setHeader("Authorization", "Bearer_" + token);
			resp.addCookie(getCookie(token));
			
			resp.setStatus(HttpServletResponse.SC_OK);

			req.setAttribute("msg", "Đăng nhập thành công!");
			req.setAttribute("color", "green");
			resp.sendRedirect(req.getContextPath() + "/home");
			System.out.println("Thành công");
		}else {
			req.setAttribute("msg", "Đăng nhập thất bại!");
			req.setAttribute("color", "red");
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
			System.out.println("thất bại");

		}
	}
	
	public Cookie getCookie(String token) {
		Cookie cookie = new Cookie("authToken", "Bearer_" + token);
		cookie.setPath("/");  
        cookie.setHttpOnly(true);  
//        cookie.setSecure(true);  
        cookie.setMaxAge(60 * 60);  // 1 hour

        try {
            cookie.setComment("SameSite=Strict"); 
        } catch (Exception e) {
        }
        return cookie;
	}
		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("run run run");
		Users user = (Users) req.getAttribute("user");
		if (user!=null) {
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}
}
