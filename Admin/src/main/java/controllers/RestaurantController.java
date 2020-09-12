/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Nghia.Util.CookieHelper;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTCouponHelper;
import Nghia.Util.RESTHelper;
import Nghia.Util.RESTRestaurantHelper;
import java.util.ArrayList;
import java.util.Map;
import models.Coupon;
import models.Restaurant;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Admin
 */
@Controller
public class RestaurantController implements IController<Restaurant> {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;
    private RESTRestaurantHelper restHelperrestaurant;
    private RESTCouponHelper rESTCouponHelper;
    private final RESTHelper rest;

    public RestaurantController() throws InstantiationException, IllegalAccessException {
        rest = new RESTHelper(Restaurant.class);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/Restaurant/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
        restHelperrestaurant = new RESTRestaurantHelper(Restaurant.class);
        rESTCouponHelper = new RESTCouponHelper(Coupon.class);

    }

    @RequestMapping(value = "/restaurant", method = RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        return new ModelAndView("restaurant").addObject("restaurants", restHelperrestaurant.getAll());
    }

    @Override
    public ModelAndView delete(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ModelAndView post(Restaurant t, HttpServletResponse response) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @RequestMapping(value = "/detailRestaurant/{id}", method = RequestMethod.GET)
    public ModelAndView getDetailRestaurant(@PathVariable("id") String id) throws IOException {
        Object restaurant = rest.getOne(id);
        return new ModelAndView("statisticRestaurant").addObject("restaurant", restaurant);
    }
    @Override
    public ModelAndView put(HttpServletRequest request, Restaurant t) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @RequestMapping(value = "/restaurant/blockRestaurant/{id}", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public ModelAndView blockRestaurant(Restaurant restaurant, @PathVariable("id") String id, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException {
        restaurant.set_id(id);
        final WebTarget target = client.target("http://localhost:9032/Restaurant/changeActiveRestaurant/");
        String responseJSON = target.path(id).request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(restaurant, MediaType.APPLICATION_JSON), String.class);
        responseServlet.sendRedirect("/restaurant");
        return new ModelAndView("restaurant");
    }
    @RequestMapping(value = "/restaurant/changeVerifyRestaurant/{id}", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public ModelAndView blockVertifyRestaurant(Restaurant restaurant, @PathVariable("id") String id, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException {
        restaurant.set_id(id);
        final WebTarget target = client.target("http://localhost:9032/Restaurant/changeVerifyRestaurant/");
        String responseJSON = target.path(id).request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(restaurant, MediaType.APPLICATION_JSON), String.class);
        responseServlet.sendRedirect("/restaurant");
        return new ModelAndView("restaurant");
    }

    @Override
    public ModelAndView getOne(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
