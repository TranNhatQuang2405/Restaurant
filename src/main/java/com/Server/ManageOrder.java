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
import com.Model.EmailSample;
import com.Model.Manager;
import com.Model.Order;

/**
 * Servlet implementation class ManageOrder
 */
@WebServlet("/Manage/ManageOrder")
public class ManageOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Manager manager = (Manager) session.getAttribute("manager");
		if(manager == null) {
			response.sendRedirect(request.getContextPath()+"/Manage/Login");
		}else {
			String action = request.getParameter("action");
			if(action != null) {
				if(action.equals("accept") && accept(request, response)) {
					return;
				}else if(action.equals("deny") && deny(request, response)) {
					return;
				}else if(action.equals("finished") && finished(request, response)) {
					return;
				}else {
					session.setAttribute("error_view_order", "<script>alert('There is not this order or action can not commit')</script>");
					getData(request,response);
					request.getRequestDispatcher("/manager/manage_order.jsp").forward(request, response);
					session.setAttribute("error_view_order", null);
				}
			}else {
				getData(request,response);
				request.getRequestDispatcher("/manager/manage_order.jsp").forward(request, response);
				session.setAttribute("error_view_order", null);
			}	
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			OrderDao orderDao = new OrderDao();
			List<Order> orderNowList = orderDao.findOrderNow();
			List<Order> orderWaitList= orderDao.findOrderWait();
			List<Order> orderHistoryList = orderDao.findOrderHistory();
			request.setAttribute("order_now", orderNowList);
			request.setAttribute("order_wait", orderWaitList);
			request.setAttribute("order_history", orderHistoryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected boolean accept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			int ID = Integer.valueOf(request.getParameter("ID"));
			OrderDao orderDao = new OrderDao();
			Order order = orderDao.FindByID(ID);
			if(order == null || order.getStatus() != 0)
				return false;
			order.setStatus(1);
			orderDao.update(order);
			SendMail.Send(EmailSample.contentConfirmString(order), EmailSample.getTitleConfirm(), order.getUser().getEmail());
			response.sendRedirect(request.getContextPath()+"/Manage/View?action=view&ID="+ID);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	protected boolean deny(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			int ID = Integer.valueOf(request.getParameter("ID"));
			OrderDao orderDao = new OrderDao();
			Order order = orderDao.FindByID(ID);
			if(order == null || order.getStatus() != 0)
				return false;
			order.setStatus(-1);
			orderDao.update(order);
			SendMail.Send(EmailSample.contentDenyString(), EmailSample.getTitleDeny(), order.getUser().getEmail());
			response.sendRedirect(request.getContextPath()+"/Manage/View?action=view&ID="+ID);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	protected boolean finished(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			int ID = Integer.valueOf(request.getParameter("ID"));
			OrderDao orderDao = new OrderDao();
			Order order = orderDao.FindByID(ID);
			if(order == null || order.getStatus() != 1)
				return false;
			order.setStatus(2);
			orderDao.update(order);
			SendMail.Send(EmailSample.contentThankString(), EmailSample.getTitleThank(), order.getUser().getEmail());
			response.sendRedirect(request.getContextPath()+"/Manage/View?action=view&ID="+ID);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
