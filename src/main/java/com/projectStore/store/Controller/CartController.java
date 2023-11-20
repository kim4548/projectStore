package com.projectStore.store.Controller;


import com.projectStore.store.dao.CartDao;
import com.projectStore.store.dto.CartDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;


@Controller
// 장바구니
public class CartController {
   @Autowired
   CartDao cartDao;

@RequestMapping ("/cart")
public String Cart(@Valid CartDto cartDto , Model m) throws Exception {
    System.out.println("Cart Controller is called");
        m.addAttribute("selcet",cartDao.selectCart("kdst6156"));
    System.out.println("m===>       " + m);





    return "cart";
}
}
