package me.trihung.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Orders;
import me.trihung.entity.Product;
import me.trihung.entity.Rating;
import me.trihung.entity.Users;
import me.trihung.entity.model.RatingModel;
import me.trihung.services.IOrdersService;
import me.trihung.services.IProductService;
import me.trihung.services.IRatingService;
import me.trihung.services.impl.OrdersServiceImpl;
import me.trihung.services.impl.ProductServiceImpl;
import me.trihung.services.impl.RatingServiceImpl;

@WebServlet(urlPatterns = { "/product/details", "/product/details/addcmt", "/product/details/pay"})
public class ProductDetailsController extends HttpServlet {
	IProductService sv = new ProductServiceImpl();
	
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String id = req.getParameter("id");
			int idso = Integer.parseInt(id);
			Product pd = sv.findById(idso);
			req.setAttribute("pd", pd);
			req.setAttribute("id", pd.getProductId());
			req.setAttribute("name", pd.getProductName());
			req.setAttribute("price", pd.getProductPrice() + "VND");
			req.setAttribute("amount", pd.getProductAmount());
			req.setAttribute("Images", "http://localhost:8080/DAWEBB/image?from=product&fname="+ pd.getProductImage());
			List<RatingModel> rmodels = new ArrayList<>();
			pd.getRatings().forEach(r->{
				rmodels.add(new RatingModel(r));
			});
			req.setAttribute("rating", rmodels);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		req.getRequestDispatcher("/views/user/product/product-details.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Users user = (Users) req.getAttribute("user");
		String url = req.getRequestURI();
		if (url.contains("/product/details/addcmt")) {
			try {
				int id = Integer.parseInt(req.getParameter("id"));
				String newcomment = req.getParameter("newcomment");
				int value = Integer.parseInt(req.getParameter("rating"));
				System.out.println(value);
				IRatingService irs = new RatingServiceImpl();
				IProductService ips = new ProductServiceImpl();
				Rating rate = new Rating();
				rate.setProductId(id);
				rate.setRatingComment(newcomment);
				rate.setRatingDate(new Date(System.currentTimeMillis()));
				rate.setRatingValue(value);
				rate.setUser(user);
				irs.insert(rate);
				System.out.println("ok ne rating");
				resp.setStatus(HttpServletResponse.SC_OK);
				resp.sendRedirect(req.getContextPath() + "/product/details?id="+id);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (url.contains("/product/details/pay")) {
			String pid =  req.getParameter("pid");
			String pprice =  req.getParameter("pprice");
			String pamount =  req.getParameter("pamount");
			try {
				int pidso = Integer.parseInt(pid);
				long ppriceso = Long.parseLong(pprice.substring(0, pprice.length()-4));
				long pamountso = Long.parseLong(pamount);
				IOrdersService ios = new OrdersServiceImpl();
				IProductService ips = new ProductServiceImpl();
				Orders order = new Orders();
				order.setOrderCount(pamountso);
				order.setOrderPrice(ppriceso);
				order.setOrderStatus(1);
				order.setProduct(ips.findById(pidso));
				order.setUser(user);
				ios.insert(order);
				resp.sendRedirect(req.getContextPath() + "/preparepayment");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}