package me.trihung.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import me.trihung.entity.Product;
import me.trihung.services.IProductCategoryService;
import me.trihung.services.IProductService;
import me.trihung.services.ITransactionService;
import me.trihung.services.impl.ProductCategoryServiceImpl;
import me.trihung.services.impl.ProductServiceImpl;
import me.trihung.services.impl.TransactionServiceImpl;
import me.trihung.utils.Utils;

import java.io.IOException;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = { "/admin/product", "/admin/product/edit", "/admin/product/update", "/admin/product/delete"}) 
public class ProductManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();
		IProductService ips = new ProductServiceImpl();
		IProductCategoryService ipcs = new ProductCategoryServiceImpl();
		System.out.println("================================= ok admin edit");
		if (url.endsWith("/admin/product")) {
			resp.setStatus(200);
			System.out.println("================================= ok admin edit 3333");
			req.getRequestDispatcher("/views/admin/product/product-action.jsp").forward(req, resp);
			
		}else if (url.contains("/admin/product/edit")) {
			int id = Integer.parseInt(req.getParameter("id"));
			Product p = ips.findById(id);
			req.setAttribute("name", p.getProductName());
			req.setAttribute("price", p.getProductPrice());
			req.setAttribute("amount", p.getProductAmount());
			req.setAttribute("cateid", p.getProductCategory().getProductCategoryId());
			req.setAttribute("id", p.getProductId());
			req.setAttribute("img", "http://localhost:8080/DAWEBB/image?from=product&fname="+p.getProductImage());
			req.getRequestDispatcher("/views/admin/product/edit-product.jsp").forward(req, resp);
		}else if (url.contains("/admin/product/delete")) {
			System.out.println("xoa");
			String ids = req.getParameter("id");
			System.out.println("xoa "+ids);
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
			resp.sendRedirect(req.getContextPath() + "/admin/product");
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI();
		IProductService ips = new ProductServiceImpl();
		IProductCategoryService ipcs = new ProductCategoryServiceImpl();
		if (url.contains("/admin/product/update")) {
			System.out.println("go admin update");
			try {
				String cateid = req.getParameter("cateid");
				String id = req.getParameter("productid");
				String name = req.getParameter("productname");
				String price = req.getParameter("productprice");
				String amount = req.getParameter("productamount");
				int cateidso = Integer.parseInt(cateid);
				int idso = Integer.parseInt(id);
				long priceso = Long.parseLong(price);
				long amountso = Long.parseLong(amount);
				
				Product duct = ips.findById(idso);
				duct.setProductAmount(amountso);
				duct.setProductPrice(priceso);
				duct.setProductCategory(ipcs.findById(cateidso));
				duct.setProductName(name);
				String img = "";
				System.out.println("update old img= "+duct.getProductImage());
				if (duct.getProductImage()!=null && duct.getProductImage().trim().length()>0) {
					img = Utils.uploadFileImage(req, 1,
							duct.getProductImage().substring(0, duct.getProductImage().length() - 5));
				}else {
					img = Utils.uploadFileImage(req, 1, Utils.generateRandomString(20));
					
				}
				if (img!=null && img.trim().length()>0)
					duct.setProductImage(img);
				ips.update(duct);
				resp.setStatus(200);
			} catch (Exception e) {
				e.printStackTrace();
			}
			resp.sendRedirect(req.getContextPath() + "/admin/product");
			
			
		}
	}

}
