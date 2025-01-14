package com.model2.mvc.web.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@SpringBootApplication
@RestController
@RequestMapping("/user/*")
public class UserRestController {
    
    @Autowired
    private UserService userService;
    
    public UserRestController(){
        System.out.println(this.getClass());
    }
    
    @RequestMapping(value="json/addUser", method=RequestMethod.GET)
    public String addUserGet() throws Exception {
        System.out.println("/user/addUser : GET");
        // Return some response for GET requests
        return "addUser complete";
    }

    @RequestMapping(value="json/addUser", method=RequestMethod.POST)
    public User addUserPost(@ModelAttribute("user") User user) throws Exception {
        System.out.println("/user/addUser : POST");
        // Business Logic
        userService.addUser(user);
        return user;
    }
    
    @RequestMapping(value="json/getUser/{userId}", method=RequestMethod.GET)
    public User getUser(@PathVariable String userId) throws Exception {
        System.out.println("/user/json/getUser : GET");
        return userService.getUser(userId);
    }

    @RequestMapping(value="json/login", method=RequestMethod.POST)
    public User login(@RequestBody User user, HttpSession session) throws Exception {
        System.out.println("/user/json/login : POST");
        System.out.println("Received user: " + user);
        User dbUser = userService.getUser(user.getUserId());
        
        if(user.getPassword().equals(dbUser.getPassword())) {
            session.setAttribute("user", dbUser);
        }
        
        return dbUser;
    }
}
