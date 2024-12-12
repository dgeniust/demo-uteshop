package me.trihung.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.utils.Utils;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/logout") 
public class LogoutController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		Utils.resetCookie(req, resp);
		resp.sendRedirect(req.getContextPath() + "/login");
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
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		Utils.resetCookie(req, resp);
		resp.sendRedirect(req.getContextPath() + "/login");
	}
}
