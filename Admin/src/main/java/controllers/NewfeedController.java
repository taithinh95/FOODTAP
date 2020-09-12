/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTHelper;
import Nghia.Util.RESTNewfeedHelper;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.Newfeed;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Admin
 */
@Controller
public class NewfeedController implements IController<Newfeed> {

    private final RESTHelper restHelper;
    private final RESTNewfeedHelper rESTNewfeedHelper;
    private Client client;

    public NewfeedController() throws InstantiationException, IllegalAccessException {
        client = ClientBuilder.newClient();
        restHelper = new RESTHelper(Newfeed.class);
        rESTNewfeedHelper = new RESTNewfeedHelper(Newfeed.class);
    }

    @RequestMapping(value = "/newfeed", method = RequestMethod.GET)
    @Override
    public ModelAndView getAll() throws IOException {
        List<Newfeed> list = restHelper.getAll();
        return new ModelAndView("newfeed").addObject("newfeeds", list);
    }

    @RequestMapping(value = "/newfeed/delete/{id}", method = RequestMethod.GET)
    @Override
    public ModelAndView delete(@PathVariable("id") String id) throws IOException {
        Object obj = restHelper.delete(id);
        return getAll();
    }

    @RequestMapping(value = "/newfeed/create", method = RequestMethod.GET)
    public ModelAndView getCreate() throws IOException {
        return new ModelAndView("postNewfeed");
    }

    @RequestMapping(value = "/newfeed/postNewfeed", method = RequestMethod.POST)
    @Override
    public ModelAndView post(Newfeed newfeed, HttpServletResponse response) throws IOException {

        restHelper.post(newfeed);
        return getAll();
    }

    @RequestMapping(value = "/newfeed/postUserNewfeed", method = RequestMethod.POST)
    public ModelAndView postAsync(MultipartContainer multipartContainer, Newfeed newfeed, HttpServletResponse response) throws IOException {
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
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("newfeed", newfeed, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/Newfeed/");
        final String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName != "") {
            file.delete();
        }
        response.sendRedirect("/myprofile-user");
        return null;
    }

    @RequestMapping(value = "/newfeed/{id}", method = RequestMethod.GET)
    @Override
    public ModelAndView getOne(@PathVariable("id") String id) throws IOException {
        Object newfeed = restHelper.getOne(id);
        return new ModelAndView("updateNewfeed").addObject("newfeed", newfeed);
    }

    @RequestMapping(value = "/newfeed/postUpdate", method = RequestMethod.POST)
    @Override
    public ModelAndView put(HttpServletRequest request, Newfeed newfeed) throws IOException {
        newfeed.set_id(request.getParameter("id").toString());
        restHelper.put(newfeed);
        return getAll();
    }

    @RequestMapping(value = "/newfeed/postFoodNewFeed/{id}", method = RequestMethod.POST)
    public ModelAndView foodNewFeed(@PathVariable("id") String id, Newfeed newfeed, HttpServletResponse response) throws IOException {
        newfeed.setProduct(id);
        rESTNewfeedHelper.postFoodNewfeed(newfeed);
        response.sendRedirect("/");
        return null;
    }

    @RequestMapping(value = "/newfeed/getMyNewfeeds", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getMyNewfeeds() throws IOException {
        String json = rESTNewfeedHelper.getMyNewfeeds();
        return json;
    }

    @RequestMapping(value = "/newfeed/blockNewfeed/{id}", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public ModelAndView blockNewfeed(Newfeed newfeed, @PathVariable("id") String id, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException {
        newfeed.set_id(id);
        final WebTarget target = client.target("http://localhost:9032/Newfeed/changeActiveNewfeed/");
        String responseJSON = target.path(id).request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(newfeed, MediaType.APPLICATION_JSON), String.class);
        responseServlet.sendRedirect("/newfeed");
        return new ModelAndView("newfeed");
    }
}
