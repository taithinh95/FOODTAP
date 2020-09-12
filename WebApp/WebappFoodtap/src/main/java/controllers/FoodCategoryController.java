/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTFoodCategory;
import Nghia.Util.RESTHelper;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.FoodCategory;
import models.Product;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
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

/**
 *
 * @author Administrator
 */
@Controller
public class FoodCategoryController {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;
    private final RESTFoodCategory restFoodHelper;


    public FoodCategoryController() throws InstantiationException, IllegalAccessException {
        restFoodHelper= new RESTFoodCategory(FoodCategory.class);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/FoodCategory/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();

    }

    @RequestMapping(value = "/foodCategory", method = RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        return new ModelAndView("restaurant").addObject("foodCategorys", restFoodHelper.getAll());
    }   
    
    
}
