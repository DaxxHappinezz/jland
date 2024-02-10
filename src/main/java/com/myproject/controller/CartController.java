package com.myproject.controller;

import com.myproject.domain.Cart;
import com.myproject.domain.User;
import com.myproject.service.CartService;
import com.myproject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;

    @GetMapping
    public String moveToCart() {
        return "cart/cartList";
    }

    @GetMapping("/get")
    @ResponseBody
    public ResponseEntity<Object> getMyCart(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String user_id = (String)session.getAttribute("id");

        List<Cart> myCart = null;
        try {
            User user = userService.getUser(user_id);
            user = new User();
            user.setUno(10);
            if (user == null) {
                user = new User();
                user.setUno(9999);
                return ResponseEntity.status(HttpStatus.OK)
                        .body("MOD_Guest");
            }
            myCart = cartService.findAllByUser(user.getUno());
            System.out.println("myCart = " + myCart);
            return ResponseEntity.status(HttpStatus.OK)
                    .body(myCart);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(myCart);
        }
    }

    @GetMapping("/all")
    @ResponseBody
    public ResponseEntity<Object> getCartAll() {

        try {
            List<Cart> cartList = cartService.findAll();
            return ResponseEntity.status(HttpStatus.OK)
                    .body(cartList);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Requested cartList load failed.");
        }
    }

    @PostMapping// cart?pno={pno}&quantity={quantity}
    @ResponseBody
    public ResponseEntity<String> saveCart(Integer pno, Integer quantity, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String user_id = (String) session.getAttribute("id");

        User user = null;
        try {
            user = userService.getUser(user_id);

            if (user == null) {
//                String msg = "Not in login status. Go back to Login.";
//                throw new RuntimeException(msg);

                // 테스트 용
                user = new User();
                user.setUno(1);
            }

            Cart cart = new Cart(pno, "", user.getUno(), quantity);
            int rowCnt = cartService.save(cart);

            if (rowCnt != 1) {
                String msg = "Requested cart save Failed.";
                throw new RuntimeException(msg);
            }

            return ResponseEntity.status(HttpStatus.CREATED)
                    .body("Requested cart save OK.");
        } catch (Exception e) {
            String msg = e.getMessage();
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body("Requested cart save Failed. cause: "+msg);
        }
    }

    @PatchMapping("/{cno}")
    public ResponseEntity<String> changeQuantity(@PathVariable Integer cno, Integer countValue) {

        try {
            Cart cart = cartService.findByCartNo(cno);
            cart.setQuantity(countValue);
            int rowCnt = cartService.modify(cart);

            if (rowCnt != 1) {
                String msg = "Check Request Value";
                throw new RuntimeException(msg);
            }

            return ResponseEntity.status(HttpStatus.OK)
                    .body("Requested quantity change Successful.");
        } catch (Exception e) {
            e.printStackTrace();
            String msg = e.getMessage();

            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Requested quantity change Failed. cause: "+msg);
        }
    }

    @DeleteMapping("/{cno}")
    @ResponseBody
    public ResponseEntity<String> remove(@PathVariable Integer cno) {
        try {
            Cart cart = cartService.findByCartNo(cno);

            int rowCnt = cartService.remove(cno, cart.getUno());

            if (rowCnt != 1) {
                String msg = "Check Request Value";
                throw new RuntimeException(msg);
            }
            return ResponseEntity.status(HttpStatus.OK)
                    .body("Requested remove Successful.");
        } catch (Exception e) {
            e.printStackTrace();

            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Requested remove Failed.");
        }
    }
}
