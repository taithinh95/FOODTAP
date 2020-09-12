/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTHelper;
import Nghia.Util.RESTProductHelper;
import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.Product;
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

@Controller
public class ProductController implements IController<Product> {

    private final RESTHelper restHelper;
    private final RESTProductHelper rESTProductHelper;

    public ProductController() throws InstantiationException, IllegalAccessException {
        restHelper = new RESTHelper(Product.class);
        rESTProductHelper = new RESTProductHelper(Product.class);
    }

    @Override
    public ModelAndView post(Product t, HttpServletResponse response) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @RequestMapping(value = "/create-DMmenu", method = RequestMethod.GET)
    public ModelAndView createDMmenu() throws IOException {
        return new ModelAndView("create-DMmenu");
    }

    @RequestMapping(value = "/create-menu", method = RequestMethod.GET)
    public ModelAndView createmenu() throws IOException {
        return new ModelAndView("create-menu");
    }

    @RequestMapping(value = "/product", method = RequestMethod.GET)
    @Override
    public ModelAndView getAll() throws IOException {
        List<Product> list = restHelper.getAll();
        return new ModelAndView("index").addObject("list", list);
    }

    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    @Override
    public ModelAndView getOne(@PathVariable("id") String id) throws IOException {
        Object product = restHelper.getOne(id);
        return new ModelAndView("update").addObject("product", product);
    }

    @RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
    @Override
    public ModelAndView delete(@PathVariable("id") String id) throws IOException {
        Object obj = restHelper.delete(id);
        return getAll();
    }

    @RequestMapping(value = "/product/create", method = RequestMethod.GET)
    public ModelAndView getCreate() throws IOException {
        return new ModelAndView("postProduct");
    }

    @RequestMapping(value = "/product/postUpdate", method = RequestMethod.POST)
    @Override
    public ModelAndView put(HttpServletRequest request, Product product) throws IOException {
        product.set_id(request.getParameter("id").toString());
        restHelper.put(product);
        return getAll();
    }

    @RequestMapping(value = "/getProduct/{id}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getProduct(@PathVariable("id") String id) throws IOException {
        return rESTProductHelper.getProduct(id);
    }

    @RequestMapping(value = "/product/update", method = RequestMethod.POST)
    public ModelAndView update(MultipartContainer multipartContainer, Product product, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException, ServletException {
        MultipartFile[] multipartFile = multipartContainer.getMultipartFile();
        String path = "./";
        FileDataBodyPart filePart;
        Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class).build();
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        String fileName = multipartFile[0].getOriginalFilename();
        File file = new File(path, fileName);
        if (fileName != "") {
            multipartFile[0].transferTo(file);
            filePart = new FileDataBodyPart("image", file);
            formDataMultiPart.bodyPart(filePart);

        }
        product.set_id(request.getParameter("id"));
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("product", product, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/Product/");
        String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName != "") {
            file.delete();
        }

        responseServlet.sendRedirect("/manageMyRestaurant/" + product.getRestaurant() + "#menu");
        return new ModelAndView("statistical");
    }

    @RequestMapping(value = "/product/postProduct", method = RequestMethod.POST)
    public ModelAndView post(MultipartContainer multipartContainer, Product product, HttpServletResponse responseServlet) throws IOException, ServletException {
        MultipartFile[] multipartFile = multipartContainer.getMultipartFile();
        String path = "./";
        FileDataBodyPart filePart;
        Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class).build();
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        String fileName = multipartFile[0].getOriginalFilename();
        File file = new File(path, fileName);
        if (fileName != "") {
            multipartFile[0].transferTo(file);
            filePart = new FileDataBodyPart("image", file);
            formDataMultiPart.bodyPart(filePart);

        }
        
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("product", product, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/Product/");
        String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName != "") {
            file.delete();
        }
        responseServlet.sendRedirect("/manageMyRestaurant/" + product.getRestaurant() + "#menu");
        return new ModelAndView("statistical");
    }

    @RequestMapping(value = "/explorestore", method = RequestMethod.GET)
    public ModelAndView explorestore() throws IOException {
        return new ModelAndView("explorestore").addObject("explorestores", restHelper.getAll());
    }

}
