package me.trihung.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.google.gson.Gson;

import jakarta.persistence.spi.PersistenceProvider;
import jakarta.persistence.spi.PersistenceProviderResolver;
import jakarta.persistence.spi.PersistenceProviderResolverHolder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import me.trihung.config.Constant;
import me.trihung.entity.Orders;
import me.trihung.entity.Product;
import me.trihung.entity.Rating;
import me.trihung.entity.Transaction;
import me.trihung.entity.Users;
import me.trihung.entity.model.OrdersModel;
import me.trihung.entity.model.ProductModel;
import me.trihung.entity.model.RatingModel;
import me.trihung.entity.model.TransactionModel;
import me.trihung.services.IOrdersService;
import me.trihung.services.IProductCategoryService;
import me.trihung.services.IProductService;
import me.trihung.services.IRatingService;
import me.trihung.services.ITransactionService;
import me.trihung.services.impl.OrdersServiceImpl;
import me.trihung.services.impl.ProductCategoryServiceImpl;
import me.trihung.services.impl.ProductServiceImpl;
import me.trihung.services.impl.RatingServiceImpl;
import me.trihung.services.impl.TransactionServiceImpl;
import me.trihung.utils.Utils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/api/product", "/api/product/add", "/api/product/delete", "/api/product/update", 
		"/api/trans", "/api/trans/add" , "/api/trans/delete", "/api/trans/update", "/api/product/rating", "/api/rating/add",
		"/api/order", "/api/order/add"})
public class ApiController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private IProductService ips = new ProductServiceImpl();
	private IProductCategoryService ipcs = new ProductCategoryServiceImpl();

	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		PersistenceProviderResolver resolver = PersistenceProviderResolverHolder.getPersistenceProviderResolver();
		List<PersistenceProvider> providers = resolver.getPersistenceProviders();
		System.out.println(providers);
		String url = req.getRequestURI();
		Gson gson = new Gson();
		PrintWriter out = resp.getWriter();
		Users user = (Users) req.getAttribute("user");
		if (url.endsWith("/api/product")) {
			List<Product> products = ips.findAll();
			List<ProductModel> pmodels = new ArrayList<>();
			products.forEach(p -> {
				pmodels.add(new ProductModel(p));
			});
			out.print(gson.toJson(pmodels));
			resp.setStatus(HttpServletResponse.SC_OK);
		} else if (url.contains("/api/product/search")) {
			String name = req.getParameter("search");
			String ids = req.getParameter("idcate");
			String spage = req.getParameter("page");
			int page = spage == null ? 0 : Integer.parseInt(spage);
			System.out.println("search by title: " + name + " | cate=" + ids);
			req.setAttribute("idcate", ids);
			req.setAttribute("search", name);
			if (ids == null || ids.strip().length() == 0) {
				if (name.strip().length() == 0) {
					List<Product> list = ips.findAll(page, 10);
					List<ProductModel> pmodels = new ArrayList<>();
					list.forEach(p -> {
						pmodels.add(new ProductModel(p));
					});
					out.print(gson.toJson(pmodels));
					return;
				}
				List<Product> list = ips.findByName(name, page, 10);
				List<ProductModel> pmodels = new ArrayList<>();
				list.forEach(p -> {
					pmodels.add(new ProductModel(p));
				});
				out.print(gson.toJson(pmodels));
				return;
			}
			Integer idcate = Integer.parseInt(ids);
			if (name == null || name.strip().length() == 0) {
				List<Product> list = ipcs.findById(idcate).getProducts();
				List<ProductModel> pmodels = new ArrayList<>();
				list.forEach(p -> {
					pmodels.add(new ProductModel(p));
				});
				out.print(gson.toJson(pmodels));
				return;
			}
			List<Product> list = ipcs.findById(idcate).getProducts().stream()
					.filter(vid -> vid.getProductName().toLowerCase().contains(name.toLowerCase())).toList();
			List<ProductModel> pmodels = new ArrayList<>();
			list.forEach(p -> {
				pmodels.add(new ProductModel(p));
			});
			out.print(gson.toJson(pmodels));
			resp.setStatus(HttpServletResponse.SC_OK);
		} else if (url.contains("api/product/rating")) {
			System.out.println("rating list");
			try {
				int id = Integer.parseInt(req.getParameter("id"));
				String spage = req.getParameter("page");
				int page = spage == null ? 0 : Integer.parseInt(spage);
				IRatingService irs = new RatingServiceImpl();
				List<Rating> rates = irs.findByIdList(id, page+1, 10);
				List<RatingModel> ratemodels = new ArrayList<>();
				rates.forEach(r->{
					ratemodels.add(new RatingModel(r));
				});
				out.print(gson.toJson(ratemodels));
				resp.setStatus(HttpServletResponse.SC_OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (url.endsWith("api/trans")) {
			String date1 = req.getParameter("date1");
			String date2 = req.getParameter("date2");
			String spage = req.getParameter("page");
			int page = spage == null ? 0 : Integer.parseInt(spage);
			Date d1 = Utils.getDateFrom(date1);
			Date d2 = Utils.getDateFrom(date2);
			List<TransactionModel> tmodels = new ArrayList<>();
			if (d1.getTime() > d2.getTime()) {
				out.print(tmodels);
			}
			ITransactionService its = new TransactionServiceImpl();
			List<Transaction> list = its.findByRangeDate(date1, date2, page, 10);
			
			list.forEach(t -> {
				tmodels.add(new TransactionModel(t));
			});
			out.print(gson.toJson(tmodels));
			resp.setStatus(HttpServletResponse.SC_OK);
		
		
		}else if (url.endsWith("api/order")) {
			try {
//				int id = Integer.parseInt(req.getParameter("id"));
//				String spage = req.getParameter("page");
//				int page = spage == null ? 0 : Integer.parseInt(spage);
				IOrdersService ios = new OrdersServiceImpl();
				List<Orders> orders = ios.findByIdUser(user.getUserId(), 1);
				List<OrdersModel> ordersmodels = new ArrayList<>();
				orders.forEach(o->{
					ordersmodels.add(new OrdersModel(o));
				});
				out.print(gson.toJson(ordersmodels));
				resp.setStatus(HttpServletResponse.SC_OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}else {
			// return view page 404 error
		}
		out.flush();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();
		Users user = (Users) req.getAttribute("user");
		System.out.println("post " + url);
		if (url.contains("/api/product/delete")) {
			String ids = req.getParameter("id");
			if (ids == null || ids.strip().length() == 0) {
				resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid id product");
				return;
			}
			int id = -1;
			try {
				id = Integer.parseInt(ids);
			} catch (Exception e) {
				e.printStackTrace();
				resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid id product");
				return;
			}
			ips.delete(id);
			resp.setStatus(HttpServletResponse.SC_OK);
		} else if (url.contains("/api/product/add")) {
			
			try {
				System.out.println(" xin chao");

				Product product = new Product();
				String name = req.getParameter("productname");
				String idcate = req.getParameter("cateid");
				int idcateso = Integer.parseInt(idcate);
				String price = req.getParameter("productprice");
				String amount = req.getParameter("productamount");
				System.out
						.println(ipcs.findById(idcateso).getProductCategoryName() + " ---------------------------------23");
				String img = Utils.uploadFileImage(req, 1, Utils.generateRandomString(20));
				product.setProductName(name);
				System.out.println(ipcs.findById(idcateso).getProductCategoryName() + " ---------------------------------");
				product.setProductCategory(ipcs.findById(idcateso));
				product.setProductPrice(Long.parseLong(price));
				product.setProductAmount(Long.parseLong(amount));
				if (img!=null && img.trim().length()>0)
					product.setProductImage(img);
				ips.insert(product);

				resp.setStatus(HttpServletResponse.SC_OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/product");
		} else if (url.contains("/api/product/update")) {
			String idproduce = req.getParameter("productid");
			String name = req.getParameter("productname");
			String idcate = req.getParameter("cateid");
			int idcateso = Integer.parseInt(idcate);
			String price = req.getParameter("productprice");
			String amount = req.getParameter("productamount");
			try {
				Product product = ips.findById(Integer.parseInt(idproduce));
				product.setProductName(name);
				product.setProductCategory(ipcs.findById(idcateso));
				product.setProductPrice(Long.parseLong(price));
				product.setProductAmount(Long.parseLong(amount));
				String img = Utils.uploadFileImage(req, 1,
						product.getProductImage().substring(0, product.getProductImage().length() - 5));
				if (img!=null && img.trim().length()>0)
					product.setProductImage(img);
				ips.update(product);
				resp.setStatus(HttpServletResponse.SC_OK);
			} catch (Exception e) {
				
				//resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Error value for add new product");
			}
			resp.sendRedirect(req.getContextPath() + "/admin/product");
		}else if (url.contains("api/trans/add")) {
			Date d = new Date(System.currentTimeMillis());
			
			ITransactionService its = new TransactionServiceImpl();
			IOrdersService ios = new OrdersServiceImpl();
			Transaction trans = new Transaction();
			trans.setTransactionDay(d);
			trans.setTransAddress(user.getUseraddress());
			trans.setTransStatus(1);
			long value = 0;
			for (Orders order : ios.findByIdUser(user.getUserId(), 1))
				value += order.getOrderPrice()*order.getOrderCount();
			trans.setTransTotalValue(serialVersionUID);
			trans.setUser(user);
			trans.setTransTotalValue(value);
			its.insert(trans);
			for (Orders order : ios.findByIdUser(user.getUserId(), 1)) {
				order.setOrderStatus(2);
				ios.update(order);
			}
			resp.setStatus(HttpServletResponse.SC_OK);
			
		}else if (url.contains("api/trans/delete")) {
			try {
				int id = Integer.parseInt(req.getParameter("id"));
				ITransactionService its = new TransactionServiceImpl();
				its.delete(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (url.contains("api/rating/add")) {
			try {
				int id = Integer.parseInt(req.getParameter("id"));
				String newcomment = req.getParameter("newcomment");
				int value = Integer.parseInt(req.getParameter("value"));
				IRatingService irs = new RatingServiceImpl();
				IProductService ips = new ProductServiceImpl();
				Rating rate = new Rating();
				rate.setProductId(id);
				rate.setRatingComment(newcomment);
				rate.setRatingDate(new Date(System.currentTimeMillis()));
				rate.setRatingValue(value);
				rate.setUser(user);
				irs.insert(rate);
				resp.setStatus(HttpServletResponse.SC_OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (url.contains("api/order/add")) {
			try {
				int id = Integer.parseInt(req.getParameter("id"));
				Long amount = Long.parseLong(req.getParameter("amount"));
				Long price = Long.parseLong(req.getParameter("price"));
				IOrdersService ios = new OrdersServiceImpl();
				IProductService ips = new ProductServiceImpl();
				Orders order = new Orders();
				order.setOrderCount(amount);
				order.setOrderPrice(price);
				order.setOrderStatus(1);
				order.setProduct(ips.findById(id));
				order.setUser(user);
				ios.insert(order);
				resp.setStatus(HttpServletResponse.SC_OK);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
