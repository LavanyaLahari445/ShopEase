package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.customerLogin;
import com.bean.CustomerLoginBean;

@WebServlet("/customerLogin")
public class CustomerLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException {
		String uname=req.getParameter("uname");
		String upwd=req.getParameter("upwd");
		CustomerLoginBean cb=customerLogin.checkLogin(uname, upwd);
		if(cb==null) {
			req.setAttribute("msg", "Incorrect username or password");
			req.getRequestDispatcher("CustomerLogin.jsp").forward(req, res);
			
		}else {
			HttpSession session=req.getSession();
			session.setAttribute("cbean", cb);
			req.getRequestDispatcher("CustomerLogin.jsp").forward(req, res);
		}
		
	}

}
