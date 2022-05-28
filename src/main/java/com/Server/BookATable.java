package com.Server;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

import com.ExcuteData.BookingDao;
import com.Model.Booking;

@WebServlet("/BookATable")
public class BookATable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			DateTimeConverter dtc = new DateConverter(new Date());
			dtc.setPattern("dd/MM/yyyy");
			ConvertUtils.register(dtc, Date.class);
			Booking booking = new Booking();
			BeanUtils.populate(booking, request.getParameterMap());
			BookingDao bookingDao = new BookingDao();
			bookingDao.insert(booking);
			session.setAttribute("message_booking", "success");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error_booking", "Some thing when wrong!!!");
		}
		response.sendRedirect(request.getContextPath() + "/Home");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
			String csrf = (String) session.getAttribute("csrf");
			String ucsrf = (String) request.getParameter("csrf");
			if (csrf.equals(ucsrf)) {
				DateTimeConverter dtc = new DateConverter(new Date());
				dtc.setPattern("yyyy-MM-dd");
				ConvertUtils.register(dtc, Date.class);
				Booking booking = new Booking();
				BeanUtils.populate(booking, request.getParameterMap());
				BookingDao bookingDao = new BookingDao();
				bookingDao.insert(booking);
				session.setAttribute("message_booking", "success");
				session.setAttribute("error_booking", null);
			} else {
				session.setAttribute("error_booking", "You don't have permission");
				session.setAttribute("message_booking", null);
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("error_booking", "Some thing when wrong!!!");
			session.setAttribute("message_booking", null);
		}
		response.sendRedirect(request.getContextPath() + "/Home#book-a-table");
	}

}
