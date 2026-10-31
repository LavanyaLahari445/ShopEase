package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UpdateProduct;
import com.bean.ProductBean;
@WebServlet("/updateProduct")
public class UpdateProductsServlet extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException
    {
        HttpSession session = req.getSession(false);

        if(session == null)
        {
            req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
        }
        else
        {
            String pCode = req.getParameter("pcode");

            ProductBean pb = null;

            ArrayList<ProductBean> al =
                    (ArrayList<ProductBean>) session.getAttribute("productsList");

            Iterator<ProductBean> i = al.iterator();

            while(i.hasNext())
            {
                pb = i.next();

                if(pCode.equals(pb.getPcode()))
                {
                    break;
                }
            }
            if(Integer.parseInt(req.getParameter("pqnty"))>=Integer.parseInt(req.getParameter("reqpqnty")) && Integer.parseInt(req.getParameter("reqpqnty"))>0) {
            pb.setPqty(String.valueOf(Integer.parseInt(req.getParameter("pqnty")) - Integer.parseInt(req.getParameter("reqpqnty"))));
            Integer amnt = Integer.parseInt(req.getParameter("reqpqnty")) * Integer.parseInt(req.getParameter("pprice"));
            int rowCount = new UpdateProduct().UpdateProduct(pb);
            if(rowCount > 0)
            {
                req.setAttribute("amnt", amnt);
                req.getRequestDispatcher("UpdateProductQuantity.jsp").forward(req, res);
            }
            }else {
            	req.setAttribute("msg", "Requested quantity is currently unavailable. Please reduce the quantity or try again later.");
            	req.getRequestDispatcher("UpdateProductQuantity.jsp").forward(req, res);
            	
            }
        }

    }
}
