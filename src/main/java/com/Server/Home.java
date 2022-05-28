package com.Server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ExcuteData.FoodDao;
import com.Model.Food;




@WebServlet(urlPatterns = {"/Home"})
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			findAll(request, response);
			request.getRequestDispatcher("/home.jsp").forward(request, response);
		} catch (Exception e) {
			PrintWriter printWriter = response.getWriter();
			printWriter.print("<h1>"+e.getMessage()+"</h1>");
		}
	}
	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			FoodDao foodDao = new FoodDao();
			List<Food> list = foodDao.findAll();
			request.setAttribute("foods", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
	}

}
