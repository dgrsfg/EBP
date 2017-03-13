package cn.itcast.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.OrderlistMapper;
import cn.itcast.ssm.po.Orderlist;
import cn.itcast.ssm.service.OrderlistService;

public class OrderlistServiceImpl implements OrderlistService {
	
	private Orderlist orderlist;

	@Autowired
	private OrderlistMapper orderlistMapper;

	@Override
	public List<Orderlist> showTickets() {
		List<Orderlist> orderlists=orderlistMapper.selectAll();
		return orderlists;
	}
	
	@Override
	public void addOrderlist(Integer lid, Integer quantity) {
		orderlist=new Orderlist();
		orderlist.setLid(lid);
		orderlist.setQuantity(quantity);
		int count=orderlistMapper.countByLid(lid);
		if(count>0){
			orderlistMapper.updateByPrimaryKey(orderlist);
		}else{
			orderlistMapper.insert(orderlist);
		}
	}
}
