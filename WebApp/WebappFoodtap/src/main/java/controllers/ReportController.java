/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.RESTUserHelper;
import java.io.IOException;
import java.util.List;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import models.Report;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;


/**
 *
 * @author Administrator
 */
@Controller
public class ReportController {
    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;

    public ReportController() throws InstantiationException, IllegalAccessException {

        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/report";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
    }
    

    @RequestMapping(value = "/report", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String report(@RequestBody String json) {
        String url = BASE_URI;
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.json(json), String.class);
        return string;
    }
}
