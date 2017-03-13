package cn.itcast.ssm.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.OrderlistMapper;
import cn.itcast.ssm.mapper.OrdersMapper;
import cn.itcast.ssm.po.Orders;
import cn.itcast.ssm.service.OrderService;


public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrdersMapper ordersMapper;

	@Override
	public Orders insertOrder(Double olistAmount) {
		Orders order=new Orders();
		order.setCommittime(new Date());
		order.setAmount(olistAmount);
		int count=ordersMapper.insert(order);
		return ordersMapper.selectAll();
	}
}
