package com.board.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.Board;
import com.board.service.BoardService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@GetMapping("/insertForm")
	public String boaradInsertForm(Model model) {
		return "board/insertForm";
	}

	@PostMapping("/insert")
	public String boaradInsert(Board board, Model model) {
		log.info("insert board = " + board.toString());
		try {
			int count = boardService.register(board);
			if (count > 0) {
				model.addAttribute("message","%s님의 게시판 등록이 성공하였습니다.".formatted(board.getWriter()));
				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","%s님의 게시판 등록이 실패하였습니다.".formatted(board.getWriter()));
		return "board/failed";
	}

	@GetMapping("/boardList")
	public String boaradList(Model model) {
		log.info("boaradList");
		try {
			List<Board> boardList = boardService.list();
			model.addAttribute("boardList", boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardList";
	}

	@GetMapping("/detail")
	public String boaradList(Board b, Model model) {
		log.info("boaradDetail board = " + b.toString());
		try {
			Board board = boardService.read(b);
			if (board == null) {
				model.addAttribute("message","%d님의 상세정보 불러오기를 실패하였습니다.".formatted(b.getNo()));
				return "board/failed";
			}
			model.addAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/detail";
	}
	@GetMapping("/delete")
	public String boardDelete(Board board, Model model) {
		log.info("boaradDetail board = " + board.toString());
		try {
			int count = boardService.remove(board);
			if (count>0) {
				model.addAttribute("message","%d님의 정보가 삭제되었습니다.".formatted(board.getNo()));
				return "board/success";
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","%d님의 정보삭제가 실패되었습니다.".formatted(board.getNo()));
		return "board/failed";
	}
	@GetMapping("/updateForm")
	public String boardUpdateForm(Board b, Model model) {
		log.info("boardUpdateForm board = " + b.toString());
		try {
			Board board = boardService.read(b);
			if (board == null) {
				model.addAttribute("message","%d님의 정보가 없습니다.".formatted(board.getNo()));
				return "board/failed";
			}
			model.addAttribute("board",board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/updateForm";
	}
	
	@PostMapping("/update")
	public String boardUpdate(Board b, Model model) {
		log.info("boardUpdateForm board = " + b.toString());
		try {
			int count = boardService.modify(b);
			if (count > 0) {
				model.addAttribute("message","%s님의 정보가 수정되었습니다.".formatted(b.getWriter()));
				return "board/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message","%s님의 정보가 수정되지않았습니다.".formatted(b.getWriter()));
		return "board/failed";
	}
	
	@GetMapping("/search")
	public String boaradSearch(String searchType,String keyword, Model model) {
		log.info("boardsearch searchType=%s keyword=%s" .formatted(searchType,keyword));
		try {
			List<Board> boardList = boardService.search(searchType,keyword);
			model.addAttribute("boardList", boardList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/boardList";
	}
	
}