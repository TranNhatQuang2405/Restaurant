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
import com.Model.User;

/**
 * Servlet implementation class MenuOrder
 */
@WebServlet("/MenuOrder")
public class MenuOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/Home/Login");
		} else {
			findAll(request, response);
			request.getRequestDispatcher("/menu.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/Home/Login");
		} else {
			String action = request.getParameter("action");
			if (action != null && action.equals("find")) {
				find(request, response);
				request.getRequestDispatcher("/menu.jsp").forward(request, response);
			} else {
				findAll(request, response);
				request.getRequestDispatcher("/menu.jsp").forward(request, response);
			}
		}
	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			FoodDao foodDao = new FoodDao();
			List<Food> list = foodDao.findAll();
			request.setAttribute("foods", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

	protected void find(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String name = request.getParameter("FindFood");
			String csrf = (String) session.getAttribute("csrf");
			String ucsrf = (String) request.getParameter("csrf");
			if (csrf.equals(ucsrf)) {
				FoodDao foodDao = new FoodDao();
				// List<Food> list = foodDao.findName(name);
				List<Food> foods = foodDao.findAll();
				List<Food> list = new ArrayList<Food>();
				for (Food food : foods) {
					if (food.getName().toLowerCase().contains(name))
						list.add(food);
				}
				request.setAttribute("foods", list);
				request.setAttribute("FindFood", name);
			} else {
				request.setAttribute("error", "Error: You don't have permission ");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: " + e.getMessage());
		}
	}

}
