package com.servlet;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AdminLoginDAO;
import com.bean.AdminLoginBean;
@WebServlet("/AdminLogin")

public class AdminLoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException {
		AdminLoginBean abean=new AdminLoginDAO().checkLogin(req.getParameter("uname"),req.getParameter("upwd"));
		if(abean==null) {
			req.setAttribute("msg", "Incorrect username or password");
			req.getRequestDispatcher("AdminHome.jsp").forward(req, res);
			
		}else {
			HttpSession session=req.getSession();
			session.setAttribute("abean", abean);
			req.getRequestDispatcher("AdminHome.jsp").forward(req, res);
		}
		
	}

}
