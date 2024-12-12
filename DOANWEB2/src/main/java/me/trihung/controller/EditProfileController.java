package me.trihung.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import me.trihung.config.Constant;
import me.trihung.entity.Users;
import me.trihung.services.IUserService;
import me.trihung.services.impl.UserServiceImpl;
import me.trihung.utils.Utils;

import java.io.File;
import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/editprofile", "/editprofile/updateprofile", "/editprofile/updatepass" })
public class EditProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Users user = (Users) req.getAttribute("user");
		String url = req.getRequestURI();
		if (user != null) {
			if (url.endsWith("/editprofile")) {
				req.setAttribute("password", user.getUserPassword());
				req.setAttribute("fullname", user.getUserfullName());
				req.setAttribute("address", user.getUseraddress());
				req.setAttribute("email", user.getUserEmail());
				req.setAttribute("phone", user.getUserPhone());
				req.setAttribute("password2", user.getUserPassword());
				System.out.println("get img "+req.getAttribute("imageUser"));
				req.getRequestDispatcher("/views/editprofile.jsp").forward(req, resp);
				return;
			}
		}
	}
	

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		Users userg = (Users) req.getAttribute("user");
		System.out.println("===================================== ok");
		if (userg==null)
			return;
		System.out.println("===================================== ok go 2222");
		IUserService ius = new UserServiceImpl();
		String url = req.getRequestURI();
		String password = req.getParameter("password");
		String password2 = req.getParameter("password2");
		String fullname = req.getParameter("fullname");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		Users user = userg;
		if (url.contains("/editprofile/updateprofile")) {
			user.setUserfullName(fullname);
			user.setUserPhone(phone);
			user.setUserEmail(email);
			user.setUseraddress(address);
			String img = "";
			if (user.getUserImage()!= null && user.getUserImage().length()>0) {
				img = Utils.uploadFileImage(req, 2,
				user.getUserImage().substring(0, user.getUserImage().length() - 5));
				
			}else 
				img = Utils.uploadFileImage(req, 2, Utils.generateRandomString(20));
			System.out.println("update image url: "+img);
			if (img!=null && img.trim().length()>0)
				user.setUserImage(img);
			
			System.out.println("change info");
		}
//		req.setAttribute("msg", "Cập nhập thành công thông tin");
//		req.setAttribute("msg", "color");
		if (url.contains("/editprofile/updatepass")) {
			password = password.trim();
			if (!isValidPassword(password)) {
				req.setAttribute("msg", "Mật khẩu phải từ 8-20 kí tự (chữ cái thường, hoa, số, kí tự đặc biệt)!");
				req.getRequestDispatcher("/views/editprofile.jsp").forward(req, resp);
				return;
			}
			if (!password.equals(password2)) {
				req.setAttribute("msg", "Nhập lại mật khẩu phải giống mật khẩu trước đó");
				req.getRequestDispatcher("/views/editprofile.jsp").forward(req, resp);
				return;
			}
			req.setAttribute("msg", "Cập nhập thành công mật khẩu");
			System.out.println("change pass ok");
			user.setUserPassword(password);
		}
		ius.update(user);
		
		resp.sendRedirect(req.getContextPath() + "/editprofile");
	}

	public boolean isValidPassword(String password) {
		password = password.strip();
		return password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$");
	}

}
