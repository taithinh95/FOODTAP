/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import Nghia.Util.RESTOrderHelper;
import java.io.IOException;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Newfeed;
import models.Order;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author BEN ALPHA
 */
@Controller
public class OrderController {
    
    private RESTOrderHelper restOrderHelper;

    public OrderController() throws InstantiationException, IllegalAccessException {
        restOrderHelper = new RESTOrderHelper(Order.class);
    }
    
    @RequestMapping(value = "/order/", method = RequestMethod.POST )
    @ResponseBody
    public String postOrder(@RequestBody String json) throws IOException {
        String urlScan = restOrderHelper.postOrder(json);
        return urlScan;
    }

    @RequestMapping(value = "/order/responseMomo", method = RequestMethod.POST )
    @ResponseBody
    public String responseMomo(@RequestBody String json) throws IOException {
        return json;
    }
    
    @RequestMapping(value = "/order/paying", method = RequestMethod.GET )
    public ModelAndView payingMomo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("message").equals("Success")){
            restOrderHelper.paying(request.getParameter("orderId"));
        }
        response.sendRedirect("/detail-order/"+request.getParameter("orderId"));
        return null;
    }
}
