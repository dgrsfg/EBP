package cn.itcast.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.itcast.ssm.po.Ticket;
import cn.itcast.ssm.po.TicketExample;

public interface TicketMapper {
    int countByExample(TicketExample example);

    int deleteByExample(TicketExample example);

    int deleteByPrimaryKey(Integer tid);

    int insert(Ticket record);

    int insertSelective(Ticket record);
    
    List<Ticket> retriveAllTicket(HashMap<String,Object> map);

    List<Ticket> selectByExample(TicketExample example);

    Ticket selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") Ticket record, @Param("example") TicketExample example);

    int updateByExample(@Param("record") Ticket record, @Param("example") TicketExample example);

    int updateByPrimaryKeySelective(Ticket record);

    int updateByPrimaryKey(Ticket record);
}