package com.ExcuteData;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;


import com.GetDB.MyDB;
import com.Model.Food;


public class FoodDao {
	public void insert(Food food) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			
			transaction.begin();
			eManager.persist(food);
			transaction.commit();
		}catch (Exception e) {
			e.printStackTrace();
			transaction.rollback();
			throw e;
		}finally {
			eManager.close();
		}
	}
	public void update(Food food) {
		EntityManager eManager = MyDB.getEntityManager();
		EntityTransaction transaction = eManager.getTransaction();
		try {
			transaction.begin();
			eManager.merge(food);
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
			Food food = eManager.find(Food.class, id);
			if(food!=null) {
				eManager.remove(food);
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
	public Food FindByID(int ID) {
		EntityManager eManager = MyDB.getEntityManager();
		Food food = eManager.find(Food.class, ID);
		eManager.close();
		return food;
	}
	public List<Food> findAll() {
		EntityManager eManager = MyDB.getEntityManager();
		TypedQuery<Food> query = eManager.createNamedQuery("Food.findAll",Food.class);
		List<Food> foods = query.getResultList();
		eManager.close();
		return foods;
	}
	public List<Food> findName(String name) {
		EntityManager eManager = MyDB.getEntityManager();
		String sql = "Select o From Food o Where o.name like :na";
		TypedQuery<Food> query = eManager.createQuery(sql,Food.class);
		query.setParameter("na", "%"+name+"%");
		List<Food> foods = query.getResultList();
		eManager.close();
		return foods;
	}
}
