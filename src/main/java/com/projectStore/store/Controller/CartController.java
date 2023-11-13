package com.projectStore.store.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller

// 장바구니
public class CartController {
@RequestMapping ("/cart")
public String Cart(HttpServletRequest request){
    System.out.println("Cart Controller is called");
    System.out.println(request.getSession());



    return "cart";
}




}
