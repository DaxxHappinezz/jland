package com.myproject.controller;

import com.myproject.domain.User;
import com.myproject.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/account")
public class RegistrationController {

    private final UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/add")
    public String form() {
        return "account/registration";
    }

    @PostMapping("/add")
    public String add(User user, RedirectAttributes rattr) {
        System.out.println("user = " + user);
        try {
            // 1. 유효성 검사
            int rowCnt = this.userService.registration(user);
            if (rowCnt != 1) throw new Exception("Registration Failed.");
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "REG_ERR");
            return "redirect:/account/add";
        }
        // 2. 홈 or 이전 페이지로 이동
        return "redirect:/";
    }
}
