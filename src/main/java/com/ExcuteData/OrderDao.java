package com.ExcuteData;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import org.hibernate.Session;

import com.GetDB.MyDB;
import com.Model.Order;
import com.Model.User;

public class OrderDao {
	public void insert(Order order) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			
			transaction.begin();
			eManager.persist(order);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void update(Order order) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.merge(order);
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
			Order order = eManager.find(Order.class, id);
			if(order!=null) {
				eManager.remove(order);
			}else {
				throw new Exception("Food id is not exist");
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
	public Order FindByID(int ID) {
		EntityManager eManager = MyDB.getEntityManager();
		Order order = eManager.find(Order.class, ID);
		if(order != null) {
			Session sessin = (Session)eManager.unwrap(Session.class);
			order.getFoodOrders();
			sessin.close();
		}
		eManager.close();
		return order;
	}
	public List<Order> findAll() {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<Order> query = eManager.createNamedQuery("Order.findAll",Order.class);
		List<Order> orders = query.getResultList();
		eManager.close();
		return orders;
	}
	public List<Order> findOrderWait()
	{
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Order o Where o.status =:st Order by o.date DESC";
		TypedQuery<Order> query = eManager.createQuery(jpql,Order.class);
		query.setParameter("st", 0);
		List<Order> orders = query.getResultList();
		eManager.close();
		return orders;
	}
	public List<Order> findOrderNow(){
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Order o Where o.status =:st Order by o.date DESC";
		TypedQuery<Order> query = eManager.createQuery(jpql,Order.class);
		query.setParameter("st", 1);
		List<Order> orders = query.getResultList();
		eManager.close();
		return orders;
	}
	public List<Order> findOrderHistory(){
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Order o Where (o.status =:st or o.status =:st2) Order by o.date DESC";
		TypedQuery<Order> query = eManager.createQuery(jpql,Order.class);
		query.setParameter("st", 2);
		query.setParameter("st2", -1);
		List<Order> orders = query.getResultList();
		eManager.close();
		return orders;
	}
	public List<Order> findOrderWaitOfUser(User user)
	{
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Order o Where o.status =:st and o.user =:us Order by o.date DESC";
		TypedQuery<Order> query = eManager.createQuery(jpql,Order.class);
		query.setParameter("st", 0);
		query.setParameter("us", user);
		List<Order> orders = query.getResultList();
		eManager.close();
		return orders;
	}
	public List<Order> findOrderNowOfUser(User user){
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Order o Where o.status =:st and o.user =:us Order by o.date DESC";
		TypedQuery<Order> query = eManager.createQuery(jpql,Order.class);
		query.setParameter("st", 1);
		query.setParameter("us", user);
		List<Order> orders = query.getResultList();
		eManager.close();
		return orders;
	}
	public List<Order> findOrderHistoryOfUser(User user){
		EntityManager eManager = MyDB.getEntityManager();
		String jpql = "Select o from Order o Where (o.status =:st or o.status =:st2) and o.user =:us Order by o.date DESC";
		TypedQuery<Order> query = eManager.createQuery(jpql,Order.class);
		query.setParameter("st", 2);
		query.setParameter("st2", -1);
		query.setParameter("us", user);
		List<Order> orders = query.getResultList();
		eManager.close();
		return orders;
	}
}
