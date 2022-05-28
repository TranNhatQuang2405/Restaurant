package com.Server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ExcuteData.OrderDao;
import com.Model.Order;
import com.Model.User;
@WebServlet("/YourOrder")
public class YourOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/Home/Login");
		}else {
			getData(request,response,user);
			request.getRequestDispatcher("/yourorder.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath()+"/Home/Login");
		}else {
			getData(request,response, user);
			request.getRequestDispatcher("/yourorder.jsp").forward(request, response);
		}
	}
	protected void getData(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException{
		try {
			OrderDao orderDao = new OrderDao();
			List<Order> orderNowList = orderDao.findOrderNowOfUser(user);
			List<Order> orderWaitList= orderDao.findOrderWaitOfUser(user);
			List<Order> orderHistoryList = orderDao.findOrderHistoryOfUser(user);
			request.setAttribute("order_now", orderNowList);
			request.setAttribute("order_wait", orderWaitList);
			request.setAttribute("order_history", orderHistoryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
