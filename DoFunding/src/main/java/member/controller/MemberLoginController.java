package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "/login.mem";
	private final String getPage = "member_loginForm";
	private String gotoPage = "redirect:/list.prd";
	
	@Autowired
	MemberDao mdao;
	
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value="cnt", required=false) String cnt) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		mav.setViewName(getPage);
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String doAction(MemberBean membean,HttpSession session,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		MemberBean loginInfo = mdao.getLoginInfo(membean);
		
		PrintWriter pw=null;
		if(loginInfo == null) {

			try {
				pw = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			pw.println("<script> alert('로그인 실패 아이디와 비밀번호를 확인해주세요');</script>");
			pw.flush();
			return getPage;
		}//if
		
		else {

			if(loginInfo.getPassword().equals(membean.getPassword())) {
				
				session.setAttribute("loginInfo", loginInfo);
					
				String destination = (String)session.getAttribute("destination");
				if(destination ==null) {
					return gotoPage;
				}
				else {
					return destination;					
				}
			}
			else {
				try {
					pw=response.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}
				pw.println("<script> alert('로그인 실패 패스워드를 확인하세요');</script>");
				pw.flush();
				return getPage;
			}
		}
	}
	
	//kakaologin
	
	@RequestMapping(value ="/kakao-login.mem",method = RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam(value="email", required=false) String email,
			@RequestParam(value="name1", required=false) String name,
			@RequestParam(value="img", required=false) String img,
			@RequestParam(value="gender", required=false) String gender,
			//@RequestParam(value="phone", required=false) String phone,
			@RequestParam(value="birthday", required=false) String birthday
			) {
		ModelAndView mav = new ModelAndView();
		System.out.println("email:"+email);
		System.out.println("name:"+name);
		System.out.println("img:"+img);
		System.out.println("gender:"+gender);
		//System.out.println("phone:"+phone);
		System.out.println("birthday:"+birthday);
		
		MemberBean mb1= new MemberBean();
		//이메일이 아이디
		mb1.setId("kakao"+email);
		//닉네임이 이름
		mb1.setName(name);
		//성별 받아온거 가공
		if(gender.equals("mail")) {
			mb1.setGender("남");			
		}
		else {
			mb1.setGender("여");						
		}
		mb1.setBirthday(birthday);
		
		mav.setViewName(getPage);
		return mav;
	}	
	
}
