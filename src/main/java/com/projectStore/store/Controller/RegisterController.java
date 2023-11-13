package com.projectStore.store.Controller;


import com.projectStore.store.dao.UserDao;
import com.projectStore.store.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
public class RegisterController {
@Autowired
    UserDao userDao;

@RequestMapping("/register")
    public  String registerForm(){
        System.out.println("registerForm is Called");
        return "registerForm";
    }


    @PostMapping("/save")
    public String save(@Valid User user , BindingResult result , Model m,String id) throws Exception {
        System.out.println("User ---> "    + user);
        System.out.println("Result ---> " + result);
        System.out.println("model ----> "  +m);
        userDao.insertUser(user);

    if(userDao.idCheck(user.getId())==1){
        return "redirect:/register";
    }
    return "redirect:/";
    }


}
