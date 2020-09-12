/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import Nghia.Util.RESTNewfeedHelper;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Newfeed;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController implements IController{
   
    private RESTNewfeedHelper restNewfeedHelper;

    public HomeController() throws InstantiationException, IllegalAccessException {
        restNewfeedHelper = new RESTNewfeedHelper(Newfeed.class);
    }
    
    
    @Override
    @RequestMapping(value = "/",method =RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        List list = restNewfeedHelper.getAll();
        return new ModelAndView("index").addObject("newfeeds", list);
    }

    @Override
    public ModelAndView delete(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ModelAndView post(Object t, HttpServletResponse response) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ModelAndView getOne(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ModelAndView put(HttpServletRequest request, Object t) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
