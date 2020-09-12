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
    private final RESTHelper restHelper;
    private final RESTFoodCategory restFoodHelper;


    public FoodCategoryController() throws InstantiationException, IllegalAccessException {
        restHelper = new RESTHelper(FoodCategory.class);
        restFoodHelper= new RESTFoodCategory(FoodCategory.class);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/FoodCategory/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();

    }

    @RequestMapping(value = "/foodCategory", method = RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        String url = BASE_URI;
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class
                );
        List<Map<String, ?>> tmpObject = mapper.readValue(string, new TypeReference<List<Map<String, ?>>>() {
        });

        return new ModelAndView(
                "foodCategory").addObject("foodCategorys", tmpObject);
    }


    @RequestMapping(value = "/foodCategory/postFoodCategory", method = RequestMethod.POST)
    public ModelAndView post(MultipartContainer multipartContainer, FoodCategory foodCategory, HttpServletResponse responseServlet) throws IOException, ServletException {
        MultipartFile[] multipartFile = multipartContainer.getMultipartFile();
        String path = "./";
        FileDataBodyPart filePart;
        Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class
        ).build();
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        String fileName = multipartFile[0].getOriginalFilename();
        File file = new File(path, fileName);
        if (fileName
                != "") {
            multipartFile[0].transferTo(file);
            filePart = new FileDataBodyPart("image", file);
            formDataMultiPart.bodyPart(filePart);

        }
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("foodCategory", foodCategory, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/FoodCategory/");
        String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName!= "") {           
            file.delete();
        }
        responseServlet.sendRedirect("/foodCategory");
        return new ModelAndView("foodCategory");
    }
    @RequestMapping(value = "/foodCategory/{id}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getFoodCategory(@PathVariable("id") String id) throws IOException {
        String s = restFoodHelper.getFoodCategory(id);
        return s;
    }
    @RequestMapping(value = "/foodCategory/updateFoodCategory", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ModelAndView put(MultipartContainer multipartContainer, FoodCategory foodCategory, HttpServletResponse responseServlet, HttpServletRequest request) throws IOException {
        MultipartFile[] multipartFile = multipartContainer.getMultipartFile();
        String path = "./";
        FileDataBodyPart filePart;
        Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class
        ).build();
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        String fileName = multipartFile[0].getOriginalFilename();
        File file = new File(path, fileName);
        if (fileName
                != "") {
            multipartFile[0].transferTo(file);
            filePart = new FileDataBodyPart("image", file);
            formDataMultiPart.bodyPart(filePart);
        }
        foodCategory.set_id(request.getParameter("id"));
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("foodCategory", foodCategory, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/FoodCategory/");
        String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName!= "") {           
            file.delete();
        }
        responseServlet.sendRedirect("/foodCategory");
        return new ModelAndView("foodCategory");
    }
    
}
