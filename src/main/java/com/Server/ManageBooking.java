package com.Server;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ExcuteData.BookingDao;
import com.Model.Booking;
import com.Model.EmailSample;
import com.Model.Manager;

@WebServlet("/Manage/ManageBooking")
public class ManageBooking extends HttpServlet {
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
					session.setAttribute("error_view_booking", "<script>alert('There is not this booking or action can not commit')</script>");
					getData(request,response);
					request.getRequestDispatcher("/manager/manage_booking.jsp").forward(request, response);
					session.setAttribute("error_view_booking", null);
				}
			}else {
				getData(request,response);
				request.getRequestDispatcher("/manager/manage_booking.jsp").forward(request, response);
				session.setAttribute("error_view_booking", null);
			}
		}
	}

	
	private boolean finished(HttpServletRequest request, HttpServletResponse response) {
		try {
			int ID = Integer.valueOf(request.getParameter("ID"));
			BookingDao bookingDao = new BookingDao();
			Booking booking = bookingDao.FindByID(ID);
			if(booking == null || booking.getStatus() != 1)
			{
				return false;
			}
			booking.setStatus(2);
			bookingDao.update(booking);
			response.sendRedirect(request.getContextPath()+"/Manage/ManageBookingView?action=view&ID="+ID);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


	private boolean deny(HttpServletRequest request, HttpServletResponse response) {
		try {
			int ID = Integer.valueOf(request.getParameter("ID"));
			BookingDao bookingDao = new BookingDao();
			Booking booking = bookingDao.FindByID(ID);
			if(booking == null || booking.getStatus() != 0)
			{
				return false;
			}
			booking.setStatus(-1);
			bookingDao.update(booking);
			SendMail.Send(EmailSample.contentBookingDeny(booking), EmailSample.getTitleBookingDenyString(),booking.getEmail());
			response.sendRedirect(request.getContextPath()+"/Manage/ManageBookingView?action=view&ID="+ID);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


	private boolean accept(HttpServletRequest request, HttpServletResponse response) {
		try {
			int ID = Integer.valueOf(request.getParameter("ID"));
			BookingDao bookingDao = new BookingDao();
			Booking booking = bookingDao.FindByID(ID);
			if(booking == null || booking.getStatus() != 0)
			{
				return false;
			}
			booking.setStatus(1);
			bookingDao.update(booking);
			SendMail.Send(EmailSample.contentBookingAccept(booking), EmailSample.getTitleBooking(), booking.getEmail());
			response.sendRedirect(request.getContextPath()+"/Manage/ManageBookingView?action=view&ID="+ID);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	protected void getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			BookingDao bookingDao = new BookingDao();					
			List<Booking> BookingNowList = bookingDao.findOrderNow();
			List<Booking> BookingWaitList= bookingDao.findOrderWait();
			List<Booking> BookingHistoryList = bookingDao.findOrderHistory();
			request.setAttribute("book_now", BookingNowList);
			request.setAttribute("book_wait", BookingWaitList);
			request.setAttribute("book_history", BookingHistoryList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
