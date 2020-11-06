package com.cdac.service;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.cdac.dao.AdminDao;
import com.cdac.dto.Admin;

@Service
public class AdminSerImple implements AdminService {

	
	
	@Autowired
	AdminDao admindao;
	
	@Override
	public void addAdmin(Admin admin) {
		admindao.insertNewAdmin(admin);
	}
	
	

}
