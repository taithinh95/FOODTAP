/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nghia.Util;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.WebUtils;

/**
 *
 * @author BEN ALPHA
 */
public class CookieHelper {

    
    public static String getCookie(String name) {
        ServletRequestAttributes servReq = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest req = servReq.getRequest();
        if (WebUtils.getCookie(req, name)==null){
            return "";
        }
        return WebUtils.getCookie(req, name).getValue();
    }
}
