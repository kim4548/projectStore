package com.projectStore.store.Controller;



import com.projectStore.store.dto.BoardDto;
import com.projectStore.store.dto.PageHandler;
import com.projectStore.store.dto.SearchCondition;
import com.projectStore.store.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;


@Controller
@RequestMapping("/board")
public class BoardController {
@Autowired
    BoardService boardService;

@PostMapping("/modify")
public String modify(BoardDto boardDto , SearchCondition sc, RedirectAttributes rattr , Model m , HttpSession session){
    System.out.println("Modify--로그인된 아이디는---->" + session.getAttribute("id"));
    String writer =(String)session.getAttribute("id");
    boardDto.setWriter(writer);
    // boardDto.getWriter == loginId --> db에 있는 writer




    try{
        if(boardService.modify(boardDto)!=1)
            throw  new Exception("modify failed.");

        rattr.addFlashAttribute("msg","MOD_OK");


        return "redirect:/board/list"+sc.getQueryString();
    }catch(Exception e){
        e.printStackTrace();
        m.addAttribute(boardDto); // boardDto.writer //
        m.addAttribute("msg","MOD_ERR");
        return "board";
    }
}

@GetMapping("/write")
public String write(Model m){
    m.addAttribute("mode","new");
    return "board";
}

@PostMapping("/write")
public String write(BoardDto boardDto , RedirectAttributes rattr, Model m ,HttpSession session){
    String writer =(String)session.getAttribute("id");
    boardDto.setWriter(writer);
try {
    if(boardService.write(boardDto)!= 1)
        throw  new Exception("Write failed.");
    rattr.addFlashAttribute("msg","WRT_OK");
    return "redirect:/board/list";
}catch (Exception e){
    e.printStackTrace();
    m.addAttribute(boardDto);
    m.addAttribute("msg","WRT_ERR");
    return "board";
}
}

@GetMapping("/read")
public String read(Integer bno, SearchCondition sc,RedirectAttributes rattr ,Model m,HttpServletRequest request ,HttpSession session){
    try {

        BoardDto boardDto = boardService.read(bno);

        m.addAttribute("page",sc.getPage());
        m.addAttribute("pageSize",sc.getPageSize());
        m.addAttribute(boardDto);

    }catch (Exception e){
        e.printStackTrace();
        rattr.addFlashAttribute("msg","READ_ERR");
        return "redirect:/board/list";
    }

    return "board";
}


@PostMapping("/remove")
public String remove(Integer bno, SearchCondition sc,RedirectAttributes rattr, HttpSession session , Model m){
    String writer= (String)session.getAttribute("id");


    try {

        m.addAttribute("page",sc.getPage());
        m.addAttribute("pageSize",sc.getPageSize());



        if(boardService.remove(bno,writer)!=1)
            throw new SQLException("Delete failed");

        rattr.addFlashAttribute("msg","DEL_OK");

    }catch (Exception e){
        e.printStackTrace();
    rattr.addFlashAttribute("msg","DEL_ERR");
    }
    return "redirect:/board/list";
}

    @GetMapping("/list")
    public String boardList(Model m, SearchCondition sc,HttpServletRequest request){
            if(!loginCheck(request))
                return "redirect:/login/login?toURL="+request.getRequestURL();


        try {
            int totalCnt= boardService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt",totalCnt);
        PageHandler ph= new PageHandler(totalCnt,sc);

            List<BoardDto> list =boardService.getSearchResultPage(sc);
            m.addAttribute("ph",ph);
            m.addAttribute("list",list);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());


        } catch (Exception e) {
           e.printStackTrace();
           m.addAttribute("msg","LIST_ERR");
           m.addAttribute("totalCnt",0);
        }
        return "boardList";
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session!=null && session.getAttribute("id") != null;
    }
}
