package com.cdac.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.cdac.dto.Admin;

@Repository
public class AdminDaoimple implements AdminDao {

	@Autowired
	private HibernateTemplate h;
	
	@Override
	public void insertNewAdmin(Admin admin) {
		h.execute(new HibernateCallback<Void>() {
			@Override
			public Void doInHibernate(Session s) throws HibernateException {
				Transaction tr = s.beginTransaction();
				s.save(admin);
				tr.commit();
				s.flush();
				s.close();
				return null;
			}
		});	

	}

}
