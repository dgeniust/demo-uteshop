package me.trihung.jwt;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Orders;
import me.trihung.entity.Users;
import me.trihung.services.IOrdersService;
import me.trihung.services.IUserService;
import me.trihung.services.impl.OrdersServiceImpl;
import me.trihung.services.impl.UserServiceImpl;
import me.trihung.utils.Utils;

public class JwtAuthorize implements Filter{
	@Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String authHeader = getTokenFromCookie(httpRequest);
        String url = httpRequest.getRequestURI();
        System.out.println(url);
        
        
        httpRequest.removeAttribute("user");
        httpRequest.removeAttribute("username");
        if (authHeader == null || !authHeader.startsWith("Bearer_")) {
        	if (url.contains("/api")|| httpRequest.getRequestURI().contains("/image")) {
        		if (url.contains("/api/payment")) {
        			chain.doFilter(httpRequest, httpResponse);
        			return;
        		}
        		httpResponse.sendError(404, "Not find this url or u dont have permission");
        		return;
        	}
        	if (url.contains("/admin")) {
        		httpResponse.sendError(404, "Not find this url or u dont have permission");
        		httpResponse.setStatus(404);
        		return;
        	}
        		
        	chain.doFilter(httpRequest, httpResponse);
        	goLogin(httpRequest, httpResponse);
            return;
        }

        String token = authHeader.substring(7); 

        if (!JwtUtil.validateToken(token)) {
        	
        	Utils.resetCookie(httpRequest, httpResponse);
        	if (url.contains("/admin")) {
        		httpResponse.sendError(404, "Not find this url or u dont have permission");
        		httpResponse.setStatus(404);
        		return;
        	}
        	chain.doFilter(httpRequest, httpResponse);
        	goLogin(httpRequest, httpResponse);
//        	if (httpRequest.getRequestURI().contains("/api") || httpRequest.getRequestURI().contains("/image")) {
//        		httpResponse.sendError(404, "Not find this url or u dont have permission");
//        		return;
//        	}
//        		
//        	chain.doFilter(httpRequest, httpResponse);
//        	goLogin(httpRequest, httpResponse);
            return;
        }

        String username = JwtUtil.getUsernameFromToken(token);
        httpRequest.setAttribute("username", username);
        IUserService ius = new UserServiceImpl();
        Users user = ius.findByUserName(username);
        if (!user.getUserIsAdmin()) {
        	if (httpRequest.getRequestURI().contains("/api/product/add") ||
        			httpRequest.getRequestURI().contains("/api/product/delete")||
        			httpRequest.getRequestURI().contains("/api/product/update") ||
        			httpRequest.getRequestURI().contains("/admin")) {
        		httpResponse.sendError(404, "Not find this url or u dont have permission");
        		return;
        	}
        }
        
        httpRequest.setAttribute("user", user);
        System.out.println("load from jwt img: "+user.getUserImage());
        httpRequest.setAttribute("imageUser", "http://localhost:8080/DAWEBB/image?from=user&fname="+user.getUserImage());
        chain.doFilter(httpRequest, httpResponse);
    }
    
    public String getTokenFromCookie(HttpServletRequest req) {
    	if (req.getCookies()==null)
    		return "";
    	Cookie[] cookies = req.getCookies();
    	for (Cookie cook : cookies) {
    		if (cook.getName().equals("authToken"))
    			return cook.getValue();
    	}
    	return "";
    }
    
    
    public void goLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	if (req.getRequestURI().contains("/login") || req.getRequestURI().contains("/register") ||req.getRequestURI().contains("/logout")) {
    		return;
    	}
    	System.out.println("Not find authorize, redirect to login");
    	resp.sendRedirect(req.getContextPath() + "/login");
    }

    @Override
    public void destroy() {}

}
