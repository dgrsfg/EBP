package cn.itcast.ssm.service;

import java.util.List;

import cn.itcast.ssm.po.Orderlist;

public interface OrderlistService {
	public List<Orderlist> showTickets();
	public void addOrderlist(Integer lid,Integer quantity);
}
