package com.ExcuteData;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.GetDB.MyDB;
import com.Model.InfoOrder;
import com.Model.Order;


public class InfoOrderDao {
	public void insert(InfoOrder infoOrder) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			
			transaction.begin();
			eManager.persist(infoOrder);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void update(InfoOrder infoOrder) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.merge(infoOrder);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void delete(Order order) throws Exception {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			InfoOrder infoOrder = eManager.find(InfoOrder.class, order);
			if(infoOrder!=null) {
				eManager.remove(infoOrder);
			}else {
				throw new Exception("InfoOrder id is not exist");
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
	public InfoOrder FindByID(Order order) {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<InfoOrder> query = eManager.createQuery("Select o from InfoOrder o Where o.order = :ID", InfoOrder.class);
		query.setParameter("ID", order);
		List<InfoOrder> infoOrder = query.getResultList();
		eManager.close();
		if(infoOrder == null || infoOrder.size()==0)
			return null;
		return infoOrder.get(0);
	}
	public List<InfoOrder> findAll() {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<InfoOrder> query = eManager.createNamedQuery("InfoOrder.findAll",InfoOrder.class);
		List<InfoOrder> InfoOrders = query.getResultList();
		eManager.close();
		return InfoOrders;
	}
}
