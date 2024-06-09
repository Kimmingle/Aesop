package com.aesop.ctrl;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aesop.biz.MemberBiz;
import com.aesop.domain.Member;

@Controller
@RequestMapping("/member/")
public class MemberController {

	
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	
	
	@Autowired
	public MemberBiz memberService;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private HttpSession session;
	
	@GetMapping("term.do")
	public String agree(Model model, RedirectAttributes rttr) {
		rttr.addAttribute("msg", "회원 약관에 동의하시기 바랍니다.");
		return "member/term";
	}
	
	@GetMapping("join.do")
	public String join(Model model, @ModelAttribute("member") Member member) {
		model.addAttribute("member", member);
		return "member/join";
	}
	
	@PostMapping("joinPro.do")
	public String joinPro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		Member member = new Member();
		member.setEmail(request.getParameter("email"));
		member.setPw(pwdEncoder.encode(request.getParameter("pw")));
		member.setName(request.getParameter("name"));
		member.setTel(request.getParameter("tel"));
		member.setAddr1(request.getParameter("addr1"));
		member.setAddr2(request.getParameter("addr2"));
		member.setPostcode(request.getParameter("postcode"));
		memberService.insMember(member);
		model.addAttribute("msg", "회원가입을 축하합니다.");
		return "redirect:/";
	}
	
	@GetMapping("login.do")
	public String login(Model model) {
		return "member/login";
	}
	
	@PostMapping("loginPro.do")
	public String loginPro(@RequestParam("email") String email, @RequestParam("pw") String pw, Model model, RedirectAttributes rttr) {
		session.invalidate();
		Member cus = memberService.getMember(email);
		if(cus==null) {
			rttr.addFlashAttribute("msg", "존재하지 않는 사용자입니다.");
			return "redirect:login.do";
		}
		boolean loginSuccess = pwdEncoder.matches(pw, cus.getPw());
		if(loginSuccess) {
			session.setAttribute("cus", cus);
			session.setAttribute("semail", email);
			session.setAttribute("spw", pw);
			model.addAttribute("msg", "로그인 성공");
			return "redirect:/";
		} else {
			return "redirect:login.do";
		}
	}
	
	@GetMapping("logout.do")
	public String logout(Model model, RedirectAttributes rttr) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃 하였습니다.");
		return "redirect:/";
	}
	
	@GetMapping("mypage.do")
	public String myInfo(Model model) {
		return "member/myInfo";
	}
	
	@GetMapping("myUpdate.do")
	public String myUpdate(Model model) {
		return "member/myUpdate";
	}
	
	@PostMapping("myUpdatePro.do")
	public String myUpdatePro(HttpServletRequest request, Model model, RedirectAttributes rttr) {
		Member member = new Member();
		member.setEmail(request.getParameter("email"));
		member.setPw(pwdEncoder.encode(request.getParameter("pw")));	//비밀번호 암호화
		member.setName(request.getParameter("name"));
		member.setTel(request.getParameter("tel"));
		member.setAddr1(request.getParameter("addr1"));
		member.setAddr2(request.getParameter("addr2"));
		member.setPostcode(request.getParameter("postcode"));
		memberService.changeInfo(member);
		model.addAttribute("msg", "회원가입을 축하합니다.");
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("memberDelete.do")
	public String memberDelete(@RequestParam("email") String email, Model model) {
		memberService.delMember(email);
		session.invalidate();
		return "redirect:/";
	}
}