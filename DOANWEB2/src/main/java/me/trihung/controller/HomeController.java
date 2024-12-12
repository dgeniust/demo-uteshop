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

@WebServlet(urlPatterns = { "/home"})
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
	}
	public String getTokenFromCookie(HttpServletRequest req) {
    	Cookie[] cookies = req.getCookies();
    	for (Cookie cook : cookies) {
    		if (cook.getName().equals("authToken"))
    			return cook.getValue();
    	}
    	return "";
    }
    
    public Users getUserFromToken(HttpServletRequest req) {
    	String authHeader = getTokenFromCookie(req);
        String token = authHeader.substring(7);
        System.out.println(token);
        if (token==null) return null;
        String username = JwtUtil.getUsernameFromToken(token);
        IUserService ius = new UserServiceImpl();
        Users user = ius.findByUserName(username);
        return user;
    }
	
	

}
