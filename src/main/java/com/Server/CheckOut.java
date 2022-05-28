package com.Server;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

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
 * Servlet implementation class CheckOut
 */
@WebServlet("/CheckOut")
public class CheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/Home/Login");
		} else {
			String urlString = "/pay.jsp";
			String action = request.getParameter("action");
			if (action != null) {
				if (action.equals("order")) {
					Boolean checkOrderBoolean = order(user, request, response);
					if (checkOrderBoolean == true) {
						session.setAttribute("listFood", null);
						session.setAttribute("total", 0);
						urlString = "/confirm.jsp";
					} else
						urlString = "/pay.jsp";
				}
			}

			Date date = new Date();
			DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			df.setTimeZone(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
			request.setAttribute("date", df.format(date));
			df = new SimpleDateFormat("HH:mm:ss");
			df.setTimeZone(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
			request.setAttribute("hour", df.format(date));
			request.getRequestDispatcher(urlString).forward(request, response);

		}
	}

	protected Boolean order(User user, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String csrf = (String) session.getAttribute("csrf");
		String ucsrf = (String) request.getParameter("csrf");
		if (csrf.equals(ucsrf)) {
			@SuppressWarnings("unchecked")
			List<FoodOrder> list = (List<FoodOrder>) session.getAttribute("listFood");
			if (list == null || list.size() < 1) {
				request.setAttribute("error", "You don't have any food in your cart!!!");
				return false;
			} else {
				try {
					Date date = new Date();
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					df.setTimeZone(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
					Order order = new Order();
					order.setDate(Timestamp.valueOf(df.format(date)));
					order.setFoodOrders(list);
					order.setStatus(0);
					order.setUser(user);
					for (FoodOrder foodOrder : list) {
						foodOrder.setOrder(order);
					}
					String fullname = request.getParameter("fullname");
					String address = request.getParameter("address");
					String city = request.getParameter("city");
					String email = request.getParameter("email");
					String phone = request.getParameter("phone");
					String type = request.getParameter("payment_method");
					if (fullname.equals("") || address.equals("") || city.equals("") || email.equals("")
							|| phone.equals("") || type.equals("")) {
						request.setAttribute("error", "Empty Field !!!");
						return false;
					}
					InfoOrder infoOrder = new InfoOrder(address, city, email, fullname, phone, type);
					infoOrder.setOrder(order);
					InfoOrderDao infoOrderDao = new InfoOrderDao();
					OrderDao orderDao = new OrderDao();
					orderDao.insert(order);
					infoOrderDao.insert(infoOrder);
					return true;
				} catch (Exception e) {
					request.setAttribute("error", e.getMessage());
					return false;
				}
			}
		} else {
			request.setAttribute("error", "You don't have permission");
			return false;
		}
	}

}
