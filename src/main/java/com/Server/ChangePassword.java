package com.Server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ExcuteData.UserDao;
import com.Model.User;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/Home/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/login/changePassword.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String change = request.getParameter("change");
		if (change != null) {
			if (change.endsWith("true")) {
				Change(request, response);
			} else if (change.equals("authen")) {
				Authen(request, response);
			}
		}
	}

	protected void Change(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String csrf = (String) session.getAttribute("csrf");
		String ucsrf = (String) request.getParameter("csrf");
		if (csrf.equals(ucsrf)) {
			String email = request.getParameter("email");
			String newPass = request.getParameter("password");
			String retype = request.getParameter("retype");
			UserDao userDao = new UserDao();
			User user = userDao.FindByEmail(email);
			if (user != null) {
				if (newPass.equals(retype)) {
					try {
						user.setPassword(newPass);
						Random rd = new Random();
						int random = 100000 + rd.nextInt(900000);
						request.setAttribute("email", email);
						session.setAttribute("ChangPassUser", user);
						session.setAttribute("code", random);
						SendMail.Send("To change your password please fill this code: " + random, "Verification",
								email);
						request.getRequestDispatcher("/login/authenChangePass.jsp").forward(request, response);
					} catch (Exception e) {
						PrintWriter rPrintWriter = response.getWriter();
						rPrintWriter.print(e.getMessage());
					}
				} else {
					request.setAttribute("email", email);
					request.setAttribute("password", newPass);
					request.setAttribute("retype", retype);
					request.setAttribute("message", "Two password are not the same!!!");
					request.getRequestDispatcher("/login/changePassword.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("email", email);
				request.setAttribute("password", newPass);
				request.setAttribute("retype", retype);
				request.setAttribute("message", "This email does not exist !!!");
				request.getRequestDispatcher("/login/changePassword.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("message", "You don't have permission");
			request.getRequestDispatcher("/login/changePassword.jsp").forward(request, response);
		}
	}

	protected void Authen(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String csrf = (String) session.getAttribute("csrf");
			String ucsrf = (String) request.getParameter("csrf");
			if (csrf.equals(ucsrf)) {
				User user = (User) session.getAttribute("ChangPassUser");
				int code = (int) session.getAttribute("code");
				int codeSubmit = Integer.valueOf(request.getParameter("codeS"));
				if (code == codeSubmit) {
					UserDao userDao = new UserDao();
					userDao.update(user);
					request.setAttribute("message", "Change password successfully!!!");
				} else {
					request.setAttribute("message", "Change password failed because the code is wrong!!!");
				}
			} else {
				request.setAttribute("message", "You don't have permission");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("/login/authenChangePass.jsp").forward(request, response);
		}

	}
}
