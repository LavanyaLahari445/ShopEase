package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.customerLogin;
import com.DAO.customerRegistrationDAO;
import com.bean.CustomerLoginBean;

@WebServlet("/register")
public class customerRegistrationServlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		CustomerLoginBean cb=new CustomerLoginBean();
		 cb.setCuname(req.getParameter("uname"));
	        cb.setCpwd(req.getParameter("pwd"));
	        cb.setCfname(req.getParameter("fname"));
	        cb.setClname(req.getParameter("lname"));
	        cb.setCaddr(req.getParameter("addr"));
	        cb.setCmid(req.getParameter("email"));
		int rowCount=new customerRegistrationDAO().customerRegistration(cb);
		
		if(rowCount>0) {
			req.setAttribute("msg", "user registered succussfully");
			req.getRequestDispatcher("CustomerRegistration.jsp").forward(req, res);
		}else {
			req.setAttribute("msg", "user not registered ");
			req.getRequestDispatcher("CustomerRegistration.jsp").forward(req, res);
		}
	}
	

}
