package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import member.model.MemberBean;

@Controller
public class BoardReplyController {

	private final String command="/reply.bd";
	private String getPage="board_replyForm";
	private String gotoPage="redirect:/list.bd";

	@Autowired
	private BoardDao boardDao;

	private PrintWriter pw =null;

	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			BoardBean bdBean,
			HttpServletRequest request,
			HttpSession session) {
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

			request.setAttribute("loginInfo", loginInfo);
			request.setAttribute("bdBean", bdBean);
			request.setAttribute("pageNumber", pageNumber);
			return getPage;

	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public String doAction(
			@RequestParam(value="pageNumber")String pageNumber,
			BoardBean bdBean,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session) {	
		//writer/subject/email/content/password/Reg_date/Ip
		//ref/re_step/re_level
		MemberBean loginInfo = (MemberBean)session.getAttribute("loginInfo");

		request.setAttribute("loginInfo", loginInfo);
		response.setContentType("text/html; charset=UTF-8");
		bdBean.setB_reg_date(new Timestamp(System.currentTimeMillis()));
		int cnt=boardDao.replyArticle(bdBean);
		
		if(cnt>0){
			return gotoPage+"?pageNumber="+pageNumber;	
		}
		else{	
			try {
				pw=response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pw.println("<script> alert('?????? ????????? ?????????????????????.');</script>");
			pw.flush();
			request.setAttribute("bdBean", bdBean);
			request.setAttribute("pageNumber", pageNumber);			
			return getPage;
		}

	}


}
