package com.myproject.controller;

import com.myproject.domain.User;
import com.myproject.repository.UserDao;
import com.myproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/account")
public class LoginController {

    @Autowired
    private final UserService userService;

    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String login() {
        return "account/loginForm";
    }

    @PostMapping("/login")
    public String submit(String id, String pw, boolean rememberId, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rattr) {

        try {
            if (!loginCheck(id, pw)) throw new Exception("Login Failed.");

            if (rememberId) {
                // 1. 쿠키 생성
                Cookie cookie = new Cookie("id", id);
                // 2. 응답에 저장
                response.addCookie(cookie);
            } else {
                // 1. 쿠키 생성
                Cookie cookie = new Cookie("id", id);
                // 2. 쿠키 시간 재설정
                cookie.setMaxAge(0);
                // 3. 응답에 저장
                response.addCookie(cookie);
            }
            HttpSession session = request.getSession();
            session.setAttribute("id", id);
        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "LOG_ERR");
            return "redirect:/account/login";
        }

        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }

    private boolean loginCheck(String id, String pw) throws Exception {
        User user = this.userService.getUser(id);
        System.out.println("user = " + user);
        if (user == null) {
            return false;
        }
        return user.getPw().equals(pw);
    }
}
