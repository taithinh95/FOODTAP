package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTHelper;
import Nghia.Util.RESTUserHelper;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.Cart;
import models.Comment;
import models.Newfeed;
import models.Order;
import models.User;
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

@Controller
public class UserController {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;
    private RESTUserHelper restUser;
    private final RESTHelper restHelper;

    public UserController() throws InstantiationException, IllegalAccessException {
        restHelper = new RESTHelper(User.class);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/User/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
    }
    
    @RequestMapping(value = "/detailUser/{id}", method = RequestMethod.GET)
    public ModelAndView getOne(@PathVariable("id") String id) throws IOException {
        Object user = restHelper.getOne(id);
        return new ModelAndView("statisticUser").addObject("user", user);
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public ModelAndView getUser() throws IOException {
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Object tmpObject = (Object) mapper.readValue(string, new TypeReference<List<Object>>() {
        });
        return new ModelAndView("user").addObject("users", tmpObject);
    }

    @RequestMapping(value = "/comment", method = RequestMethod.GET)
    public ModelAndView getAll(Comment comment) throws IOException {
        return new ModelAndView("comment");
    }
    
    @RequestMapping(value = "/user/changeActiveUser/{id}", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public ModelAndView blockUser(User user, @PathVariable("id") String id, HttpServletRequest request, HttpServletResponse responseServlet) throws IOException {
        user.set_id(id);
        final WebTarget target = client.target("http://localhost:9032/User/changeActiveUser/");
        String responseJSON = target.path(id).request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(user, MediaType.APPLICATION_JSON), String.class);
        responseServlet.sendRedirect("/user");
        return new ModelAndView("user");
    }
}
