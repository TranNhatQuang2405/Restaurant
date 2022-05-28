package com.Server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ExcuteData.InfoOrderDao;
import com.ExcuteData.OrderDao;
import com.Model.FoodOrder;
import com.Model.InfoOrder;
import com.Model.Order;
import com.Model.User;

/**
 * Servlet implementation class OrderView
 */
@WebServlet("/OrderView")
public class OrderView extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/Home/Login");
		} else {
			String action = request.getParameter("action");
			if (action != null) {
				if (action.equals("view")) {
					boolean kq = view(request, response);
					if (!kq)
						return;
				}
			}
			request.getRequestDispatcher("/view_order.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected boolean view(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ID = request.getParameter("ID");
		if (ID == null || ID.equals("")) {
			response.sendRedirect(request.getContextPath() + "/YourOrder");
			return false;
		} else {
			int id = Integer.valueOf(ID);
			OrderDao orderDao = new OrderDao();
			Order order = orderDao.FindByID(id);

			if (order == null) {
				response.sendRedirect(request.getContextPath() + "/YourOrder");
				return false;
			}
			request.setAttribute("order", order);
			InfoOrderDao infoOrderDao = new InfoOrderDao();
			InfoOrder infoOrder = infoOrderDao.FindByID(order);
			request.setAttribute("info", infoOrder);
			Total(order, request, response);
			return true;
		}
	}

	protected void Total(Order order, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int kq = 0;
		for (FoodOrder foodOrder : order.getFoodOrders()) {
			kq += foodOrder.getAmount() * foodOrder.getFood().getPrice();
		}
		request.setAttribute("Total", kq);
	}

}
