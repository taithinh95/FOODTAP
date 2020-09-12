/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTCouponHelper;
import Nghia.Util.RESTHelper;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.Coupon;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CouponController {

    private RESTCouponHelper restHelper;

    public CouponController() throws InstantiationException, IllegalAccessException {
        restHelper = new RESTCouponHelper(Coupon.class);
    }

    @RequestMapping(value = "/coupon", method = RequestMethod.GET)
    public ModelAndView index() throws IOException {
        return new ModelAndView("discount").addObject("coupons", restHelper.getAll());
    }

    @RequestMapping(value = "/coupon/check", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String check(@RequestBody String json) throws IOException {
        return restHelper.check(json);
    }
    
    @RequestMapping(value = "/coupon/postCoupon", method = RequestMethod.POST)
    public ModelAndView post(MultipartContainer multipartContainer, Coupon coupon, HttpServletResponse responseServlet) throws IOException, ServletException {
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
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("coupon", coupon, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/Coupon/");
        String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName != "") {
            file.delete();
        }
        responseServlet.sendRedirect("/coupon");
        return new ModelAndView("coupon");
    }
}
