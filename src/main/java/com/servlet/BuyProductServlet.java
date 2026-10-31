package com.servlet;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BuyProductDAO;
import com.bean.CustomerLoginBean;
import com.bean.ProductBean;
@WebServlet("/buy")
public class BuyProductServlet extends HttpServlet{
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if(session==null) {
			req.getRequestDispatcher("CustomerLogin.html").forward(req,res);
		}else {
			String pcode=req.getParameter("pcode");
			ProductBean pb=new BuyProductDAO().ProductDetails(pcode);
			req.setAttribute("pbean", pb);
			req.getRequestDispatcher("BuyProduct.jsp").forward(req,res);
			
		
			
		}
		
	}
		
	}
	


