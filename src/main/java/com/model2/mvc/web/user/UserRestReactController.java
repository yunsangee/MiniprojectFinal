package com.model2.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@CrossOrigin(origins = "http://192.168.0.51:3000")
@RestController
@RequestMapping("/user/*")
public class UserRestReactController {
    
    @Autowired
    private UserService userService;
    
    public UserRestReactController(){
        System.out.println(this.getClass());
    }

    @RequestMapping(value="react/addUser")
    public User addUserPost(@RequestBody User user) throws Exception {
        System.out.println("/user/addUser : POST");
        // Business Logic
        userService.addUser(user);
        return user;
    }
    
    @RequestMapping(value="react/getUser/{userId}", method=RequestMethod.GET)
    public User getUser(@PathVariable String userId) throws Exception {
        System.out.println("/user/react/getUser : GET");
        return userService.getUser(userId);
    }

    @RequestMapping(value="react/login", method=RequestMethod.POST)
    public User login(@RequestBody User user, HttpSession session) throws Exception {
        System.out.println("/user/react/login : POST");
        System.out.println("Received user: " + user);
        User dbUser = userService.getUser(user.getUserId());
        
        if(user.getPassword().equals(dbUser.getPassword())) {
            session.setAttribute("user", dbUser);
        }
        
        return dbUser;
    }
    
    @RequestMapping( value="react/checkDuplication/{userId}")
    public boolean checkDuplication( @PathVariable String userId) throws Exception{
        
        System.out.println("/user/checkDuplication : POST");
        //Business Logic
        boolean result=userService.checkDuplication(userId);
        // Model °ú View ¿¬°á
  
        return result;
    }
}
