package cn.itcast.ssm.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.Ticket;
import cn.itcast.ssm.service.TicketService;

@Controller
public class TicketController {
	
	@Autowired
	private TicketService ticketService;
	
	@RequestMapping(value = "/retriveAllTicket", method = { RequestMethod.POST,
			RequestMethod.GET })
	// @RequestParam里边指定request传入参数名称和形参进行绑定。
	// 通过required属性指定参数是否必须要传入
	// 通过defaultValue可以设置默认值，如果id参数没有传入，将默认值和形参绑定。
	public ModelAndView retriveAllTicket(Model model,
			@RequestParam(value = "datepicker", required = true,defaultValue="") Date datepicker){
		if(datepicker==null){
			System.out.println("22222222222222");
		}
		List<Ticket> ticketList=ticketService.retriveAllTicket(datepicker);
		System.out.println(ticketList.get(0).getStarttime()+"33333333333");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("ticketList",ticketList);
		modelAndView.setViewName("user/ShowTickets.jsp");
		return modelAndView;
	}
}
