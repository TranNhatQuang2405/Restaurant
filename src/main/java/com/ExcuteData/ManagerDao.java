package com.ExcuteData;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.GetDB.MyDB;
import com.Model.Manager;


public class ManagerDao {
	public void insertUser(Manager manager) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.persist(manager);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void update(Manager manager) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.merge(manager);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void delete(String email) throws Exception {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			Manager manager = FindByEmail(email);
			if(manager!=null) {
				eManager.remove(manager);
			}else {
				throw new Exception("User email is not exist");
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
	public Manager FindByEmail(String email) {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<Manager> query = eManager.createQuery("Select u from Manager u Where email =:em", Manager.class);
		query.setParameter("em", email);
		List<Manager> managerkq = query.getResultList();
		eManager.close();
		if(managerkq != null)
			return managerkq.get(0);
		else
			return null;
	}
	public boolean check(Manager manager) {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<Manager> query = eManager.createQuery("Select u from Manager u Where email = :em and password = :pa", Manager.class);
		query.setParameter("em", manager.getEmail());
		query.setParameter("pa", manager.getPassword());
		List<Manager> managerkq = query.getResultList();
		eManager.close();
		if(managerkq == null || managerkq.size() == 0)
			return false;
		return true;
	}
	public List<Manager> findAll() {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<Manager> query = eManager.createNamedQuery("User.findAll",Manager.class);
		List<Manager> managers = query.getResultList();
		eManager.close();
		return managers;
	}
}
