package com.servlet;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AddProductDDAO;
import com.bean.ProductBean;
@WebServlet("/aps")

public class AddProductServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if(session==null) {
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		}else {
			ProductBean pb=new ProductBean();
			pb.setPcode(req.getParameter("pcode"));
			pb.setPname(req.getParameter("pname"));
			pb.setPcompany(req.getParameter("pcompany"));
			pb.setPprice(req.getParameter("ppricee"));
			pb.setPqty(req.getParameter("pqnty"));
			
			
			int rowcount=new AddProductDDAO().addProduct(pb);
			
			if(rowcount>0) {
				req.setAttribute("msg", "product data inserted");
				req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
			}else {
				throw new RuntimeException();
			}
		}
		
		
	}

}
