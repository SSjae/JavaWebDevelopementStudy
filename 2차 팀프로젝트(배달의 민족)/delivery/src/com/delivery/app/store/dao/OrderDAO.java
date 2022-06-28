package com.delivery.app.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.delivery.mybatis.SqlMapConfig;

public class OrderDAO {
	SqlSession sqlsession;
	
	public OrderDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public int storeOrderCnt(int storenum) {
		return sqlsession.selectOne("Order.storeOrderCnt", storenum);
	}

	public List<OrderDTO> orders(String userid){
		return this.sqlsession.selectList("Order.orders", userid);
	}

	public int removeOrder(int ordernum) {
		return sqlsession.delete("Order.removeOrder",ordernum);
	}
	public void addOrder(OrderDTO odto) {
		sqlsession.insert("Order.addOrder", odto);
		
	}
}
