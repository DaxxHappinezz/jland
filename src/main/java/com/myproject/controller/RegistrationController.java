package com.myproject.controller;

import com.myproject.domain.User;
import com.myproject.service.UserService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

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

    @PostMapping("/checkId")
    @ResponseBody
    public ResponseEntity<String> checkId(@RequestParam("id") String id) {
//    public ResponseEntity<String> checkId(@RequestBody String id) {
        try {
            System.out.println("id = " + id);
            User user = this.userService.getUser(id);
            System.out.println("user = " + user);
            if (user != null) throw new Exception("User id exists.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest()
                    .body("CHK_ERR");
        }
        return ResponseEntity.ok()
                .body("CHK_OK");
    }
}
