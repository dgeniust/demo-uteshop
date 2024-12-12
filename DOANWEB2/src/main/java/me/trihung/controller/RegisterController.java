package me.trihung.controller;

import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Users;
import me.trihung.services.IUserService;
import me.trihung.services.impl.UserServiceImpl;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/register") 
public class RegisterController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		IUserService ius = new UserServiceImpl();

		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String fullname = req.getParameter("fullname");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		Boolean isadmin = false;
		Date dateRegis = new Date(System.currentTimeMillis());
		if (username == null || password == null) {
			req.getRequestDispatcher("/views/signup.jsp").forward(req, resp);
			//return to login page 
			return;
		}
		Users user = new Users();
		user.setUserfullName(fullname);
		user.setUserPhone(phone);
		user.setUserEmail(email);
		user.setUseraddress(address);
		password = password.trim();
		if (!isValidPassword(password)) {
			req.setAttribute("msg", "Mật khẩu phải từ 8-20 kí tự (chữ cái thường, hoa, số, kí tự đặc biệt)!");
			req.setAttribute("color", "red");
			req.getRequestDispatcher("/views/signup.jsp").forward(req, resp);
			return;
		}
		user.setUserName(username);
		user.setUserPassword(password);
		user.setUserIsAdmin(isadmin);
		user.setUserRegisDay(dateRegis);
		if (ius.register(user)) {
			//dang ky thanh cong
			req.setAttribute("msg", "Đăng ký thành công!");
			req.setAttribute("color", "green");

		}else {
			//error fail
			req.setAttribute("msg", "Đăng ký thất bại, vui lòng kiểm tra lại thông tin!");
			req.setAttribute("color", "red");
		}
		req.getRequestDispatcher("/views/signup.jsp").forward(req, resp);
	}
	
	public boolean isValidPassword(String password) {
		password = password.strip();
		return password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$");
	}
		
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Users user = (Users) req.getAttribute("user");
		if (user!=null) {
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}
		req.getRequestDispatcher("/views/signup.jsp").forward(req, resp);
	}
}
