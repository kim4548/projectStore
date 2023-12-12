package com.projectStore.store.Controller;


import com.projectStore.store.dao.CartDao;
import com.projectStore.store.dao.UserDao;
import com.projectStore.store.domain.User;
import com.projectStore.store.dto.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;


@Controller
// 장바구니
public class CartController {
   @Autowired
   CartDao cartDao;
@Autowired
    UserDao userDao;
@Autowired
    User user;
@RequestMapping ("/cart")
public String Cart(@Valid CartDto cartDto , Model m, HttpSession session) throws Exception {
    System.out.println("Cart Controller is called");



    String getId = (String) session.getAttribute("id");
    m.addAttribute("selcet", cartDao.selectCart(getId));
    System.out.println("m===> " + m);




    return "cart";
}
}
