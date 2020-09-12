/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.RESTCouponHelper;
import Nghia.Util.RESTHelper;
import Nghia.Util.RESTNewfeedHelper;
import Nghia.Util.RESTReportHelper;
import Nghia.Util.RESTRestaurantHelper;
import Nghia.Util.RESTUserHelper;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.Coupon;
import models.Newfeed;
import models.Report;
import models.Restaurant;
import models.User;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController implements IController{
    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;
    private RESTRestaurantHelper restHelperrestaurant;
    private RESTCouponHelper rESTCouponHelper;
    private final RESTHelper rest;
    private final RESTUserHelper restUserHelper;
        private final RESTReportHelper restReportHelper;
    
     public HomeController() throws InstantiationException, IllegalAccessException {
        rest = new RESTHelper(Restaurant.class);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/Order/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
        restHelperrestaurant = new RESTRestaurantHelper(Restaurant.class);
        rESTCouponHelper = new RESTCouponHelper(Coupon.class);
        restUserHelper = new RESTUserHelper(User.class);
          restReportHelper = new RESTReportHelper(Report.class);

    }
    
    @RequestMapping(value = "/",method =RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        String url = BASE_URI;
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        List<Map<String, ?>> tmpObject = mapper.readValue(string, new TypeReference<List<Map<String, ?>>>() {
        });
        return new ModelAndView("index").addObject("restaurants", restHelperrestaurant.getAll()).addObject("orders",tmpObject).addObject("users", restUserHelper.getAll()).addObject("reports", restReportHelper.getAll());
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
