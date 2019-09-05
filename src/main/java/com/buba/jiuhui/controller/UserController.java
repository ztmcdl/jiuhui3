package com.buba.jiuhui.controller;

import com.buba.jiuhui.bean.User;
import com.buba.jiuhui.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
@RequestMapping("users")
@Controller
public class UserController {
    @Autowired
    private UserService userService;


    @ResponseBody
    @RequestMapping("login")
    public Map<String,Object> login(String userCode, String password,Integer jzmm2, HttpSession session){
        User user = userService.login(userCode,password);
        Map<String,Object> map=new HashMap<String,Object>();
        if(user!=null ) {
            if (jzmm2==1){
                session.setAttribute("userCode",user.getUserCode());
                session.setAttribute("password",user.getPassword());
                System.out.println(user.getUserCode());
                System.out.println(user.getPassword());
            }
            if (jzmm2==0){
                session.setAttribute("userCode","");
                session.setAttribute("password","");

            }
            session.setAttribute("user", user);
            map.put("flag", true);
        }else{
            map.put("flag", false);
            map.put("msg","用户名不存在或密码错误!");
        }

        return map;

    }
    //退出
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/jsps/login.jsp";
    }
}
