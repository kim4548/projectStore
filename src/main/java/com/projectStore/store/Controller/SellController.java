package com.projectStore.store.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellController {

@RequestMapping("/ceramics")
public String ceramics(){
    // 해당 상품 ----> 도자기





    return "ceramics";
}


@GetMapping("/vase")
    public String vase(){
    //해당 상품 --->화병



    return "vase";
}



}
