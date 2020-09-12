/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;


import Nghia.Util.RESTMessageHelper;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Message;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController implements IController<Message> {

    private RESTMessageHelper rest;

    public MessageController() throws InstantiationException, IllegalAccessException {
        rest = new RESTMessageHelper(Message.class);
    }

    @RequestMapping(value = "/message/", method = RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        List listFriends = rest.getListFriends();
        return new ModelAndView("message").addObject("listFriends", listFriends);
    }

    public ModelAndView delete(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @ResponseBody
    public ModelAndView post(Message message, HttpServletResponse response) throws IOException {

        return null;
    }

    @ResponseBody
    public ModelAndView getOne(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ModelAndView put(HttpServletRequest request, Message message) throws IOException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @RequestMapping(value = "/message/{id}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getConversation(@PathVariable("id") String id) throws IOException {
        return rest.getConversation(id);
    }

    @RequestMapping(value = "/message/", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public @ResponseBody String sendMessage(Message message) {
        rest.postMessage(message);
        
        return null;
    }
}
