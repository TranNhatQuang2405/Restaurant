package com.Model;

import java.text.SimpleDateFormat;

import com.ExcuteData.InfoOrderDao;

public class EmailSample {
	private static String TitleConfirm = "Confirm Order";
	private static String titleBookingAccept ="Confirm Booking";
	private static String titleBookingDenyString ="Deny Booking";
	private static String TitleDeny = "Deny Order";
	private static String TitleThank = "Thanks For Order";
	public static String contentConfirmString(Order order) {
		InfoOrderDao infoOrderDao = new InfoOrderDao();
		InfoOrder infoOrder = infoOrderDao.FindByID(order);
		if(infoOrder != null) {
			return "We have recived your order!!!\n"
					+ "We will finished it and delivery for you in one 1 hour\n"
					+ "To address: "+infoOrder.getAddress()+","+infoOrder.getCity()+" city"
					+ "\nPlease always check your phone !!!\n"
					+ "We will call for you at "+infoOrder.getPhone()+ " when our shipper have come to your address";

		}
		return "";
		
	}
	public static String contentDenyString() {
		return "We have recived your order!!!\n"
					+ "We sorry about that some of food that you order is out of order now.\n"
					+ "We hope to serve you next time";
	}
	public static String contentThankString() {
		return "Thanks for your order in our restaurant website\n"
					+ "We hope you will have a nice meal\n"
					+ "Thank you very much";
	}
	public static String contentBookingAccept(Booking booking) {
		SimpleDateFormat Format = new SimpleDateFormat("dd/MM/yyyy");
		return "Thank for booking in our restaurant!!!\n"
				+ "We have accept your booking\n"
				+ "Please come with our restaurant on "+Format.format(booking.getDate())+" at "+booking.getTime()
				+ "\nWe will recognize you by the number phone you booking";
	}
	public static String contentBookingDeny(Booking booking) {
		SimpleDateFormat Format = new SimpleDateFormat("dd/MM/yyyy");
		return "Thank for booking in our restaurant!!!\n"
				+ "We are so sory about that our restaurant is out of order on "+Format.format(booking.getDate())
				+ "\nHope you sympathize for this conveniece";
	}
	public static String getTitleConfirm() {
		return TitleConfirm;
	}
	public static void setTitleConfirm(String titleConfirm) {
		TitleConfirm = titleConfirm;
	}
	public static String getTitleDeny() {
		return TitleDeny;
	}
	public static void setTitleDeny(String titleDeny) {
		TitleDeny = titleDeny;
	}
	public static String getTitleThank() {
		return TitleThank;
	}
	public static void setTitleThank(String titleThank) {
		TitleThank = titleThank;
	}
	public static String getTitleBooking() {
		return titleBookingAccept;
	}
	public static void setTitleBooking(String titleBooking) {
		EmailSample.titleBookingAccept = titleBooking;
	}
	public static String getTitleBookingDenyString() {
		return titleBookingDenyString;
	}
	public static void setTitleBookingDenyString(String titleBookingDenyString) {
		EmailSample.titleBookingDenyString = titleBookingDenyString;
	}
	
	
}
