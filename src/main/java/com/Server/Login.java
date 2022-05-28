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

@WebServlet("/Home/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("logout");
		if (action != null) {
			if (action.equals("true")) {
				HttpSession session = request.getSession();
				session.setAttribute("user", null);
				response.sendRedirect("../Home");
				return;
			}
		}
		request.getRequestDispatcher("/login/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String SignUp = request.getParameter("SignUp");
		if (SignUp.equals("true")) {
			SignUp(request, response);
		} else if (SignUp.equals("access")) {
			authen(request, response);
		} else {
			SignIn(request, response);
		}

	}

	public void authen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String csrf = (String) session.getAttribute("csrf");
			String ucsrf = (String) request.getParameter("csrf");
			if (csrf.equals(ucsrf)) {
				User user = (User) session.getAttribute("SignUpUser");
				int code = (int) session.getAttribute("code");
				int codeSubmit = Integer.valueOf(request.getParameter("codeS"));
				if (code == codeSubmit) {
					UserDao userDao = new UserDao();
					userDao.insertUser(user);
					request.setAttribute("message", "Sign up successfully!!!");
				} else {
					request.setAttribute("message", "Sign up failed!!!");
				}
			} else {
				request.setAttribute("message", "You don't have permission");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			request.getRequestDispatcher("/login/signup.jsp").forward(request, response);
		}
	}

	public void SignIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao userDao = new UserDao();
		try {
			HttpSession session = request.getSession();
			String csrf = (String) session.getAttribute("csrf");
			String ucsrf = (String) request.getParameter("csrf");
			if (csrf.equals(ucsrf)) {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				User userServer = userDao.FindByEmail(email);
				if (userServer == null) {
					request.setAttribute("error", "This Email Is Not Exist");
					request.setAttribute("email", email);
					request.setAttribute("password", password);
					request.getRequestDispatcher("/login/login.jsp").forward(request, response);
				} else if (password.equals(userServer.getPassword())) {
					session.setAttribute("user", userServer);
					session.setAttribute("manager", null);
					response.sendRedirect(request.getContextPath() + "/Home");
				} else {
					request.setAttribute("error", "Password is wrong");
					request.setAttribute("email", email);
					request.setAttribute("password", password);
					request.getRequestDispatcher("/login/login.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("error", "You don't have permission");
				request.getRequestDispatcher("/login/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void SignUp(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String csrf = (String) session.getAttribute("csrf");
		String ucsrf = (String) request.getParameter("csrf");
		if (csrf.equals(ucsrf)) {
			String email = request.getParameter("emailS");
			String password = request.getParameter("passwordS");
			String name = request.getParameter("nameS");
			UserDao userDao = new UserDao();
			User user = userDao.FindByEmail(email);

			if (user != null) {
				request.setAttribute("error", "This Email Has Already Exist");
				request.setAttribute("emailS", email);
				request.setAttribute("passwordS", password);
				request.setAttribute("nameS", name);
				request.getRequestDispatcher("/login/login.jsp").forward(request, response);
			} else {
				try {
					user = new User(email, name, password);
					Random rd = new Random();
					int random = 100000 + rd.nextInt(900000);
					request.setAttribute("email", email);
					session.setAttribute("SignUpUser", user);
					session.setAttribute("code", random);
					SendMail.Send("Thank for sign up your verification code is: " + random, "Verification", email);
					request.getRequestDispatcher("/login/signup.jsp").forward(request, response);
				} catch (Exception e) {
					PrintWriter rPrintWriter = response.getWriter();
					rPrintWriter.print(e.getMessage());
				}
			}
		} else {
			request.setAttribute("error", "You don't have permission");
			request.getRequestDispatcher("/login/login.jsp").forward(request, response);
		}
	}
}
