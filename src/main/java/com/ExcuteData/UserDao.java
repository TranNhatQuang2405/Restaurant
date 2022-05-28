package com.ExcuteData;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.GetDB.MyDB;
import com.Model.User;

public class UserDao {
	public void insertUser(User user) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.persist(user);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void update(User user) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.merge(user);
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
			User user = eManager.find(User.class, email);
			if(user!=null) {
				eManager.remove(user);
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
	public User FindByEmail(String email) {
		EntityManager eManager = MyDB.getEntityManager();
		User user = eManager.find(User.class, email);
		eManager.close();
		return user;
	}
	public List<User> findAll() {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<User> query = eManager.createNamedQuery("User.findAll",User.class);
		List<User> Users = query.getResultList();
		eManager.close();
		return Users;
	}
}
