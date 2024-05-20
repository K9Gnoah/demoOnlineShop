package com.hoangmike.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailController {

    @RequestMapping("/email")
    public ModelAndView emailPage(){
        ModelAndView mav = new ModelAndView("email");
        return mav;
    }
}
