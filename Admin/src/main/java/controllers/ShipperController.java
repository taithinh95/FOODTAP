/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTHelper;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.Authorization;
import models.Coupon;
import models.Shipper;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.springframework.security.jwt.JwtHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Admin
 */
@Controller
public class ShipperController implements IController {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;
    private final RESTHelper restHelper;

    public ShipperController() throws InstantiationException, IllegalAccessException {
        restHelper = new RESTHelper(Shipper.class);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/Shipper/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
    }

    @RequestMapping(value = "/shipper", method = RequestMethod.GET)
    public ModelAndView getAll() throws IOException {
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Object tmpObject = (Object) mapper.readValue(string, new TypeReference<List<Object>>() {
        });
        return new ModelAndView("shipper").addObject("shippers", tmpObject);

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
    public ModelAndView put(HttpServletRequest request, Object t) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    @RequestMapping(value = "/detailShipper/{id}", method = RequestMethod.GET)
    @Override
    public ModelAndView getOne(@PathVariable("id") String id) throws IOException {
        Map shipper = (Map) restHelper.getOne(id);
        ObjectMapper objectMapper = new ObjectMapper();
        String jsonOrders = objectMapper.writeValueAsString(shipper.get("orders"));
        return new ModelAndView("statisticShipper").addObject("shipper", shipper).addObject("jsonOrders", jsonOrders);
    }


    @RequestMapping(value = "/shipper/blockShipper/{id}", method = RequestMethod.POST ,produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public ModelAndView blockShipper(Shipper shipper, @PathVariable("id") String id, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException {
        shipper.set_id(id);
        final WebTarget target = client.target("http://localhost:9032/Shipper/changeActiveShipper/");
        String responseJSON = target.path(id).request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(shipper, MediaType.APPLICATION_JSON), String.class);
        responseServlet.sendRedirect("/shipper");
        return new ModelAndView("shipper");
    }

    @RequestMapping(value = "/shipper/registerShipper", method = RequestMethod.POST)
    public ModelAndView register(MultipartContainer multipartContainer, Shipper shipper, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException {
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
            filePart = new FileDataBodyPart("avatar", file);
            formDataMultiPart.bodyPart(filePart);

        }
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("shipper", shipper, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/Shipper/");
        String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName != "") {
            file.delete();
        }
        responseServlet.sendRedirect("/shipper");
        return new ModelAndView("shipper");
    }
}
