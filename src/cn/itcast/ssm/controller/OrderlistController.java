package cn.itcast.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cn.itcast.ssm.po.Orderlist;
import cn.itcast.ssm.service.OrderlistService;

@Controller
public class OrderlistController {
	
	@Autowired
	private OrderlistService orderlistService;
	
	//加入购物车
	@RequestMapping("/addOrderlistById")
	public ModelAndView addOrderlistById(Model model,
			@RequestParam(value = "tid") Integer tid,@RequestParam(value = "quantity") Integer quantity){
		orderlistService.addOrderlist(tid,quantity);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("user/ShowTickets.jsp");
		return modelAndView;
	}
	
	//查询购物车
	@RequestMapping(value="/showTickets",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView showTickets(Model model){
		List<Orderlist> orderList=orderlistService.showTickets();
		System.out.println(orderList.size()+"$$$$$$$$$$$$$$$$$$$$$$$$4");
		int olistQuantity=0;
		double olistAmount=0,amount=0;
		for(Orderlist ol:orderList){
			olistQuantity+=ol.getQuantity();
			amount=ol.getQuantity()*ol.getPrice();
			olistAmount+=amount;
		}
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("orderList",orderList);
		modelAndView.addObject("olistQuantity",olistQuantity);
		modelAndView.addObject("olistAmount",olistAmount);
		modelAndView.setViewName("user/ShowShoppingCart.jsp");
		return modelAndView;
	}
}
