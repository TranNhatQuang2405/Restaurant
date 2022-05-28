package com.ExcuteData;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.GetDB.MyDB;
import com.Model.Booking;

public class BookingDao {
	public void insert(Booking booking) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			
			transaction.begin();
			eManager.persist(booking);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void update(Booking booking) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.merge(booking);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void delete(int id) throws Exception {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			Booking booking = eManager.find(Booking.class, id);
			if(booking!=null) {
				eManager.remove(booking);
			}else {
				throw new Exception("Booking id is not exist");
			}
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public Booking FindByID(int ID) {
		EntityManager eManager = MyDB.getEntityManager();
		Booking booking = eManager.find(Booking.class, ID);
		eManager.close();
		return booking;
	}
	public List<Booking> findAll() {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<Booking> query = eManager.createNamedQuery("Booking.findAll",Booking.class);
		List<Booking> foods = query.getResultList();
		eManager.close();
		return foods;
	}
	public List<Booking> findOrderHistory(){
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Booking o Where (o.status =:st or o.status =:st2) Order by o.date DESC, o.time DESC";
		TypedQuery<Booking> query = eManager.createQuery(jpql,Booking.class);
		query.setParameter("st", 2);
		query.setParameter("st2", -1);
		List<Booking> bookings = query.getResultList();
		eManager.close();
		return bookings;
	}
	public List<Booking> findOrderWait()
	{
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Booking o Where o.status =:st Order by o.date DESC, o.time DESC";
		TypedQuery<Booking> query = eManager.createQuery(jpql,Booking.class);
		query.setParameter("st", 0);
		List<Booking> bookings = query.getResultList();
		eManager.close();
		return bookings;
	}
	public List<Booking> findOrderNow(){
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Booking o Where o.status =:st Order by o.date DESC, o.time DESC";
		TypedQuery<Booking> query = eManager.createQuery(jpql,Booking.class);
		query.setParameter("st", 1);
		List<Booking> bookings = query.getResultList();
		eManager.close();
		return bookings;
	}
}
