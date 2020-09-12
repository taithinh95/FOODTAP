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
import Nghia.Util.RESTFoodCategory;
import Nghia.Util.RESTRestaurantHelper;
import java.util.ArrayList;
import java.util.Map;
import models.Coupon;
import models.FoodCategory;
import models.Restaurant;
import org.codehaus.jackson.map.ObjectMapper;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author Admin
 */
@Controller
public class RestaurantController implements IController<Restaurant> {

    private final RESTRestaurantHelper restHelper;
    private final RESTFoodCategory restdFoodcategoryHelper;
    private RESTCouponHelper rESTCouponHelper;

    public RestaurantController() throws InstantiationException, IllegalAccessException {
        restHelper = new RESTRestaurantHelper(Restaurant.class);
        restdFoodcategoryHelper = new RESTFoodCategory(FoodCategory.class);
        rESTCouponHelper = new RESTCouponHelper(Coupon.class);

    }

    @RequestMapping(value = "/manageMyRestaurant/{id}", method = RequestMethod.GET)
    public ModelAndView statistical(@PathVariable("id") String id) throws IOException {
        Map<String, ?> restaurant = restHelper.manageMyRestaurant(id);
        return new ModelAndView("statistical").addObject("restaurant", restaurant).addObject("foodCaterogys", restdFoodcategoryHelper.getAll()).addObject("restaurants", restHelper.getAll());}

    @RequestMapping(value = "/getMyRestaurantOrders/{id}", method = RequestMethod.GET)
    @ResponseBody
    public String getMyRestaurantOrders(@PathVariable("id") String id, HttpServletResponse response) throws IOException {
        Map<String, ?> restaurant = restHelper.manageMyRestaurant(id);
        ObjectMapper objectMapper = new ObjectMapper();
        response.setContentType("application/json;charset=UTF-8");
        return objectMapper.writeValueAsString(restaurant);
    }

    @RequestMapping(value = "/store-profile/{id}", method = RequestMethod.GET)
    public ModelAndView storeprofile(@PathVariable("id") String id) throws IOException {
        Map<String, ?> restaurant = restHelper.manageMyRestaurant(id);
        return new ModelAndView("store-profile").addObject("restaurant", restaurant);
    }

    @RequestMapping(value = "/statistical", method = RequestMethod.GET)
    public ModelAndView statistical() throws IOException {

        return new ModelAndView("statistical");
    }

    @RequestMapping(value = "/mystore", method = RequestMethod.GET)
    public ModelAndView mystore() throws IOException {
        List<Map<String, ?>> listRestaurants = restHelper.getMyRestaurants();
        return new ModelAndView("mystore").addObject("listRestaurants", listRestaurants);

    }

    @RequestMapping(value = "/registerstore", method = RequestMethod.GET)
    public ModelAndView registerstore() throws IOException {
        return new ModelAndView("registerstore");
    }

    @RequestMapping(value = "/restaurant/{id}")
    @Override
    public ModelAndView getOne(@PathVariable("id") String id) throws IOException {
        Object restaurant = restHelper.getOne(id);
        Map<String, ?> map = (Map) restaurant;
        ArrayList<Map<String, String>> managers = (ArrayList<Map<String, String>>) map.get("managers");
        for (Map item : managers) {
            if (item.get("user").equals(CookieHelper.getCookie("_id"))) {
                return storeprofile(id);
            }
        }
        Object coupon = rESTCouponHelper.getAll();
        return new ModelAndView("store").addObject("restaurant", restaurant).addObject("coupons", coupon);
    }

    @RequestMapping(value = "/restaurant", method = RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        List<Restaurant> list = restHelper.getAll();
        return new ModelAndView("restaurantList").addObject("list", list);
    }

    @RequestMapping(value = "/restaurant/delete/{id}", method = RequestMethod.GET)
    @Override
    public ModelAndView delete(@PathVariable("id") String id) throws IOException {
        Object obj = restHelper.delete(id);
        return getAll();
    }

    @RequestMapping(value = "/restaurant/create", method = RequestMethod.GET)
    public ModelAndView getCreate() throws IOException {
        return new ModelAndView("postRestaurant");
    }

    @RequestMapping(value = "/mystore-display", method = RequestMethod.GET)
    public ModelAndView mystoredisplay() throws IOException {
        return new ModelAndView("mystore-display");

    }

    @RequestMapping(value = "/mystore-profile", method = RequestMethod.GET)
    public ModelAndView mystoreprofile() throws IOException {
        return new ModelAndView("mystore-profile");

    }

    @RequestMapping(value = "/store-profile", method = RequestMethod.GET)
    public ModelAndView storeprofile() throws IOException {
        return new ModelAndView("store-profile");

    }

    @RequestMapping(value = "/menu/{id}")
    public ModelAndView menu(@PathVariable("id") String id) throws IOException {
        Object restaurant = restHelper.getMenu(id);
        return new ModelAndView("profile").addObject("restaurant", restaurant);
    }

    @RequestMapping(value = "/restaurant/postRestaurant", method = RequestMethod.POST)
    @Override
    public ModelAndView post(Restaurant restaurant, HttpServletResponse response) throws IOException {
        restHelper.post(restaurant);
        return getAll();
    }

    @RequestMapping(value = "/restaurant/updateRestaurant", method = RequestMethod.POST)
    @Override
    public ModelAndView put(HttpServletRequest request, Restaurant restaurant) throws IOException {
        restaurant.set_id(request.getParameter("id").toString());
        restHelper.put(restaurant);
        return getAll();
    }

    @RequestMapping(value = "/restaurant/update", method = RequestMethod.POST)
    public ModelAndView updateRestaurant(MultipartContainer multipartContainer, HttpServletRequest request, Restaurant restaurant) throws IOException {
        MultipartFile[] multipartFile = multipartContainer.getMultipartFile();
        String path = "./";
        FileDataBodyPart filePart;
        FileDataBodyPart filePart2;
        Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class).build();
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        String fileName = multipartFile[0].getOriginalFilename();
        File file = new File(path, fileName);
        if (fileName != "") {
            multipartFile[0].transferTo(file);
            filePart = new FileDataBodyPart("avatar", file);
            formDataMultiPart.bodyPart(filePart);

        }
        String fileName2 = multipartFile[1].getOriginalFilename();
        File file2 = new File(path, fileName2);
        if (fileName2 != "") {
            multipartFile[1].transferTo(file2);
            filePart2 = new FileDataBodyPart("licenseImage", file2);
            formDataMultiPart.bodyPart(filePart2);
        }
        restaurant.set_id(request.getParameter("id"));
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("restaurant", restaurant, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/Restaurant/");
        final Response response = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA));
        if (fileName != "") {
            file.delete();
        }
        if (fileName2 != "") {
            file2.delete();
        }
        return mystore();
    }

    @RequestMapping(value = "/createRestaurant", method = RequestMethod.POST)
    public ModelAndView createRestaurant(MultipartContainer multipartContainer, Restaurant restaurant, HttpServletResponse responses) throws IOException {
        MultipartFile[] multipartFile = multipartContainer.getMultipartFile();
        String path = "./";
        FileDataBodyPart filePart;
        FileDataBodyPart filePart2;

        Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class).build();
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        String fileName = multipartFile[0].getOriginalFilename();
        File file = new File(path, fileName);
        if (fileName != "") {
            multipartFile[0].transferTo(file);
            filePart = new FileDataBodyPart("avatar", file);
            formDataMultiPart.bodyPart(filePart);

        }
        String fileName2 = multipartFile[1].getOriginalFilename();
        File file2 = new File(path, fileName2);
        if (fileName2 != "") {
            multipartFile[1].transferTo(file2);
            filePart2 = new FileDataBodyPart("licenseImage", file2);
            formDataMultiPart.bodyPart(filePart2);
        }
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("restaurant", restaurant, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/Restaurant/");
        final Response response = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA));
        if (fileName != "") {
            file.delete();
        }
        if (fileName2 != "") {
            file2.delete();
        }
        String url = response.readEntity(String.class);

        responses.sendRedirect(url.replace("\"", ""));
        return mystore();

    }

    @RequestMapping(value = "/restaurant/paying", method = RequestMethod.GET)
    public ModelAndView payingMomo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("message").equals("Success")) {
            restHelper.paying(request.getParameter("orderId"));
        }
        return mystore();
    }
}
