package com.Server;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ExcuteData.BookingDao;
import com.Model.Booking;
import com.Model.Manager;


@WebServlet("/Manage/ManageBookingView")
public class ManageBookingView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Manager manager = (Manager) session.getAttribute("manager");
		if(manager == null) {
			response.sendRedirect(request.getContextPath()+"/Manage/Login");
		}else {
			String action = request.getParameter("action");
			if(action != null) {
				if(action.equals("view")) {
					boolean kq = view(request, response);
					if(!kq)
						return;
				}
			}
			request.getRequestDispatcher("/manager/manage_booking_view.jsp").forward(request, response);
		}
	}

	
	private boolean view(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String ID = request.getParameter("ID");
		HttpSession session = request.getSession();
		if(ID == null || ID.equals("")) {
			session.setAttribute("error_view_booking", "<script>alert('There is no ID')</script>");
			response.sendRedirect(request.getContextPath()+"/Manage/ManageBooking");
			return false;
		}
		else {
			int id = Integer.valueOf(ID);
			BookingDao bookingDao = new BookingDao();
			Booking booking = bookingDao.FindByID(id);
			
			if(booking == null) {
				session.setAttribute("error_view_booking", "<script>alert('There is no this booking')</script>");
				response.sendRedirect(request.getContextPath()+"/Manage/ManageBooking");
				return false;
			}
			request.setAttribute("booking", booking);
			return true;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
