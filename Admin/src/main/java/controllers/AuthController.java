package controllers;

import Nghia.Util.RESTAuthorizeHelper;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Base64;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Authorization;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.security.jwt.JwtHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller()
public class AuthController implements IController<Authorization> {

    private RESTAuthorizeHelper rest;

    public AuthController() throws InstantiationException, IllegalAccessException {
        rest = new RESTAuthorizeHelper(Authorization.class);
    }

    public ModelAndView getAll() throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ModelAndView delete(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ModelAndView getOne(String id) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ModelAndView put(HttpServletRequest request, Authorization authorization) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ModelAndView post(Authorization t, HttpServletResponse response) throws IOException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setValue("");
                cookie.setMaxAge(0);
                cookie.setHttpOnly(true);
                cookie.setPath("/");
                response.addCookie(cookie);
            }
        }
        return new ModelAndView("login");
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void login(Authorization authorization, HttpServletResponse response) throws IOException {
        Map<String, ?> responseMap = rest.post(authorization);
        String accessToken = (String) responseMap.get("access_token");
        if (accessToken != null) {

            //set cookie for access token
            Cookie cookie = new Cookie("accessToken", "JWT " + accessToken);
            cookie.setHttpOnly(true);
            cookie.setMaxAge(9999999);
            cookie.setPath("/");

            String decodeJWTString = (JwtHelper.decode(accessToken)).getClaims();

            ObjectMapper mapper = new ObjectMapper();
            Map<String, String> convertTo = mapper.readValue(decodeJWTString, new TypeReference<Map<String, String>>() {
            });
            Cookie cookie1 = new Cookie("_id", convertTo.get("_id"));
            cookie1.setHttpOnly(true);
            cookie1.setMaxAge(999999);
            cookie1.setPath("/");
            response.addCookie(cookie);
            response.addCookie(cookie1);
            response.sendRedirect("/");
        } else {
            response.sendRedirect("/login");
        }
    }

   
}
