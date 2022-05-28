package com.Server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ExcuteData.FoodDao;
import com.Model.Food;
import com.Model.FoodOrder;
import com.Model.User;

@WebServlet("/YourCart")
public class YourCart extends HttpServlet {
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
			String action = request.getParameter("action");
			if (action != null) {
				if (action.equals("add")) {
					add(request, response);
				} else if (action.equals("update")) {
					update(request, response);
				}
			}
			request.getRequestDispatcher("/cart.jsp").forward(request, response);
		}
	}

	protected int Total(List<FoodOrder> a) {
		int kq = 0;
		for (FoodOrder foodOrder : a) {
			kq += foodOrder.getAmount() * foodOrder.getFood().getPrice();
		}
		return kq;
	}

	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String csrf = (String) session.getAttribute("csrf");
		String ucsrf = (String) request.getParameter("csrf");
		if (csrf.equals(ucsrf)) {
			List<FoodOrder> list = new ArrayList<FoodOrder>();
			String[] ids = request.getParameterValues("FOODID");
			String[] amounts = request.getParameterValues("AMOUNT");
			if (ids != null) {
				for (int i = 0; i < ids.length; i++) {
					FoodDao aDao = new FoodDao();
					int id = Integer.valueOf(ids[i]);
					int amount = Integer.valueOf(amounts[i]);
					Food aFood = aDao.FindByID(id);
					FoodOrder aFoodOrder = new FoodOrder(amount, aFood);
					list.add(aFoodOrder);
				}
			}
			session.setAttribute("listFood", list);
			session.setAttribute("total", Total(list));
		}
		else {
			session.setAttribute("error_csrf", "You don't have permission");
		}
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String csrf = (String) session.getAttribute("csrf");
		String ucsrf = (String) request.getParameter("csrf");
		if (csrf.equals(ucsrf)) {
			List<FoodOrder> list = new ArrayList<FoodOrder>();
			String[] ids = request.getParameterValues("food_id");
			String[] amounts = request.getParameterValues("quantity_1");
			for (int i = 0; i < ids.length; i++) {
				FoodDao aDao = new FoodDao();
				int id = Integer.valueOf(ids[i]);
				int amount = Integer.valueOf(amounts[i]);
				Food aFood = aDao.FindByID(id);
				FoodOrder aFoodOrder = new FoodOrder(amount, aFood);
				if (aFoodOrder.getAmount() > 0)
					list.add(aFoodOrder);
			}
			session.setAttribute("listFood", list);
			session.setAttribute("total", Total(list));
		} else {
			session.setAttribute("error_csrf", "You don't have permission");
		}
	}

}
