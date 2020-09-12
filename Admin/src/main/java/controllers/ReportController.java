/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.RESTHelper;
import Nghia.Util.RESTReportHelper;
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
import models.Report;
import models.Shipper;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Admin
 */
@Controller
public class ReportController implements IController{
    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;
    private final RESTHelper restHelper;
    private final RESTReportHelper restReportHelper;

    public ReportController() throws InstantiationException, IllegalAccessException {
        restHelper = new RESTHelper(Report.class);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/Report/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
        restReportHelper = new RESTReportHelper(Report.class);
    }
    
    @RequestMapping(value = "/reports", method = RequestMethod.GET)
    @Override
    public ModelAndView getAll() throws IOException {
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Object tmpObject = (Object) mapper.readValue(string, new TypeReference<List<Object>>() {
        });
        return new ModelAndView("report").addObject("reports", tmpObject);
    }

    @Override
    public ModelAndView delete(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ModelAndView post(Object t, HttpServletResponse response) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
       
    @RequestMapping(value = "/report/{id}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getOneReport(@PathVariable("id") String id) throws IOException {
        Object report = restReportHelper.getOne(id);
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(report);
    }
    

    @Override
    public ModelAndView put(HttpServletRequest request, Object t) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ModelAndView getOne(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    @RequestMapping(value = "/report/replyReport/", method = RequestMethod.POST)
    public ModelAndView updateReport(Report report, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException, ServletException {
        report.set_id(request.getParameter("id"));
        final WebTarget target = client.target("http://localhost:9032/Report/");
        String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(report, MediaType.APPLICATION_JSON_TYPE), String.class);
        responseServlet.sendRedirect("/reports");
        return null;
    }
    
    
}
