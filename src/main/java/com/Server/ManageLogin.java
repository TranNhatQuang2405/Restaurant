package com.Server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ExcuteData.ManagerDao;
import com.Model.Manager;

/**
 * Servlet implementation class ManageLogin
 */
@WebServlet("/Manage/Login")
public class ManageLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/manager/managelogin.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String urlString = "/manager/managelogin.jsp";
		if (action != null) {
			if (action.equals("login")) {
				boolean kq = login(request, response);
				if (kq == true) {
					response.sendRedirect(request.getContextPath() + "/Manage/ManageOrder");
					return;
				}
			}
		}
		request.getRequestDispatcher(urlString).forward(request, response);

	}

	protected boolean login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String csrf = (String) session.getAttribute("csrf");
			String ucsrf = (String) request.getParameter("csrf");
			if (csrf.equals(ucsrf)) {
				String email = request.getParameter("email");
				String pass = request.getParameter("password");
				Manager aManager = new Manager(email, pass);
				ManagerDao managerDao = new ManagerDao();
				boolean kq = managerDao.check(aManager);
				if (kq == true) {
					session = request.getSession();
					session.setAttribute("manager", aManager);
					session.setAttribute("user", null);
					return true;
				} else {
					request.setAttribute("error", "Email Or Password Is Incorrected !!!");
					return false;
				}
			}else {
				request.setAttribute("error", "You don't have permission");
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
