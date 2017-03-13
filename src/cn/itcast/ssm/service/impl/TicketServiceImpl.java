package cn.itcast.ssm.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.ssm.mapper.TicketMapper;
import cn.itcast.ssm.po.Ticket;
import cn.itcast.ssm.service.TicketService;
import cn.itcast.ssm.util.DateUtil;

public class TicketServiceImpl implements TicketService {
	
	@Autowired
	private TicketMapper ticketMapper;

	@Override
	public List<Ticket> retriveAllTicket(Date datepicker) {
		if(datepicker==null){
			datepicker=new Date();
		}
		Date endDate = DateUtil.getDateAfter(datepicker, 7);
		HashMap<String, Object> map = new HashMap<String, Object>();  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
        map.put("startTime",sdf.format(datepicker));  
        map.put("endTime",sdf.format(endDate) );   
		return ticketMapper.retriveAllTicket(map);
	}
}
