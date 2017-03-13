package cn.itcast.ssm.service;

import java.util.Date;
import java.util.List;

import cn.itcast.ssm.po.Ticket;

public interface TicketService {
	public List<Ticket> retriveAllTicket(Date datepicker);
}
