package com.aesop.ctrl;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aesop.biz.QnaBiz;
import com.aesop.domain.Qna;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private QnaBiz qnaService;

	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	

    /* 관리자 메인 페이지 이동 */
    @RequestMapping(value="main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception{
        
        
    }
    
    
    @GetMapping("insertQna.do")
	public String insQna(Qna qna, Model model) {
		return "admin/board/insert";
	}
	
	@PostMapping("insertQnaPro.do")
	public String insQnaPro(Qna qna, Model model) {
		qnaService.insQna(qna);
		return "redirect:/board/list.do";
	}

	@GetMapping("updateQna.do")
	public String upQna(@RequestParam("no") int no, Model model) {
		model.addAttribute("qna", qnaService.getQna(no));
		return "admin/board/edit";
	}
	
	@PostMapping("updateQnaPro.do")
	public String upQnaPro(Qna qna, Model model) {
		log.info(qna.toString());
		qnaService.upQna(qna);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("delBoard.do")
	public String delQna(@RequestParam("no") int no, Model model) {
		qnaService.delQna(no);
		return "redirect:/board/list.do";
	}
    
}