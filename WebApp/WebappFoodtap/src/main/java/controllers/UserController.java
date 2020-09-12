package controllers;

import Nghia.Util.CookieHelper;
import Nghia.Util.MultipartContainer;
import Nghia.Util.RESTCouponHelper;
import Nghia.Util.RESTOrderHelper;
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
import models.Coupon;
import models.Order;
import models.User;
import org.codehaus.jackson.map.ObjectMapper;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    private final RESTUserHelper restUser;
    private final RESTOrderHelper restOrder;
    private RESTCouponHelper rESTCouponHelper;

    public UserController() throws InstantiationException, IllegalAccessException {
        restUser = new RESTUserHelper(User.class);
        restOrder = new RESTOrderHelper(Order.class);
        rESTCouponHelper = new RESTCouponHelper(Coupon.class);

    }

    @RequestMapping(value = "/search-page/{keyword}", method = RequestMethod.GET)
    public ModelAndView searchpage(@PathVariable("keyword") String keyword) throws IOException {
        return new ModelAndView("search-page").addObject("searchResult", restUser.searchAll(keyword));
    }

    @RequestMapping(value = "/search/{keyword}", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getSearchResult(@PathVariable("keyword") String keyword) throws IOException {
        return restUser.search(keyword);
    }

    @RequestMapping(value = "/searchByFullName/{keyword}", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getSearchByNameResult(@PathVariable("keyword") String keyword) throws IOException {
        return restUser.searchByFullName(keyword);
    }

    @RequestMapping(value = "/user-info")
    public ModelAndView userinfo() throws IOException {
        Map<String, ?> user = restUser.getMyUser();
        return new ModelAndView("user-info").addObject("user", user);
    }

    @RequestMapping(value = "/user-profile/{id}", method = RequestMethod.GET)
    public ModelAndView profile(@PathVariable("id") String id) throws IOException {
        if (id.equals(CookieHelper.getCookie("_id"))) {
            return myprofileuser();
        }
        Object user = restUser.getOne(id);
        return new ModelAndView("profile-user").addObject("user", user);
    }

    @RequestMapping(value = "/getOneImg/{id}", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getOneImg(@PathVariable("id") String id) throws IOException {
        Object user = restUser.getOne(id);
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(user);
    }

    @RequestMapping(value = "/myprofile-user")
    public ModelAndView myprofileuser() throws IOException {
        Map<String, ?> user = restUser.getMyUser();
        Object coupon = rESTCouponHelper.getAll();
        return new ModelAndView("myprofile-user").addObject("user", user).addObject("coupons", coupon);
    }

    @RequestMapping(value = "/getMyFriends", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getMyFriends() throws IOException {
        Map<String, ?> user = restUser.getMyUser();
        ObjectMapper objectMapper = new ObjectMapper();
        return objectMapper.writeValueAsString(user);
    }

    @RequestMapping(value = "/User/statistical")
    public ModelAndView statistical() {
        return new ModelAndView("statistical");
    }

    @RequestMapping(value = "/addToCart", method = RequestMethod.POST)
    @ResponseBody
    public String addToCart(Cart cart, HttpServletRequest request, HttpServletResponse response) {
        String current;
        if (CookieHelper.getCookie("cart").equals("") || CookieHelper.getCookie("cart").equals("0")) {
            current = restUser.addToCart(cart);
            Cookie cookie = new Cookie("cart", "1");
            cookie.setHttpOnly(true);
            cookie.setMaxAge(9999999);
            cookie.setPath("/");
            response.addCookie(cookie);
        } else {
            current = restUser.addToCart(cart);
            if (Double.parseDouble(current) < 0) {
                return "-1";
            } else {
                Cookie cookie = new Cookie("cart", String.valueOf(current));
                cookie.setHttpOnly(true);
                cookie.setMaxAge(9999999);
                cookie.setPath("/");
                response.addCookie(cookie);
            }

        }
        return current;
    }

    @RequestMapping(value = "/recart/{index}", method = RequestMethod.GET)
    public ModelAndView recart(@PathVariable("index") String index, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String number = restUser.recart(index);
        Cookie cookie = new Cookie("cart", number);
        cookie.setHttpOnly(true);
        cookie.setMaxAge(9999999);
        cookie.setPath("/");
        response.addCookie(cookie);
        response.sendRedirect("/cart");
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/reorder/{id}", method = RequestMethod.GET)
    public ModelAndView reorder(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String number = restUser.reorder(id);
        Cookie cookie = new Cookie("cart", number);
        cookie.setHttpOnly(true);
        cookie.setMaxAge(9999999);
        cookie.setPath("/");
        response.addCookie(cookie);
        response.sendRedirect("/cart");
        return new ModelAndView("index");
    }
    
    @RequestMapping(value = "/getFriendRequests", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, ?>> getFriendRequests() throws IOException {
        return restUser.getFriendRequests();
    }

    @RequestMapping(value = "/getNotifications", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, ?>> getNotifications() throws IOException {
        return restUser.getNotification();
    }

    @RequestMapping(value = "/requestFriend/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String sendFriendRequest(@PathVariable("id") String id) throws IOException {
        return restUser.sendRequestFriend(id);
    }

    @RequestMapping(value = "/acceptFriend/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String acceptFriendRequest(@PathVariable("id") String id) throws IOException {
        return restUser.acceptRequestFriend(id);
    }

    @RequestMapping(value = "/sendRouteToShipper/", method = RequestMethod.POST)
    @ResponseBody
    public String sendRouteToShipper(@RequestBody String json) throws IOException {
        restUser.sendRouteToShipper(json);
        return "";
    }

    @RequestMapping(value = "/sendLocationUser/", method = RequestMethod.POST)
    @ResponseBody
    public String sendLoction(@RequestBody String json) throws IOException {
        return restUser.sendLocationUser(json);
    }
    
    
    @RequestMapping(value = "/cancelFriend/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String cancelFriendRequest(@PathVariable("id") String id) throws IOException {
        return restUser.cancelRequestFriend(id);
    }

    @RequestMapping(value = "/user/comment", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String comment(Comment comment) throws IOException {
        return restUser.comment(comment);
    }

    @RequestMapping(value = "/user/follow", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String follow(@RequestBody String json) throws IOException {
        return restUser.follow(json);
    }

    @RequestMapping(value = "/switchCart", method = RequestMethod.POST)
    @ResponseBody
    public String switchCart(Cart cart, HttpServletRequest request, HttpServletResponse response) {

        Cookie cookie = new Cookie("cart", "1");
        cookie.setHttpOnly(true);
        cookie.setMaxAge(9999999);
        cookie.setPath("/");
        response.addCookie(cookie);
        return restUser.switchCart(cart);
    }

    @RequestMapping(value = "/removeFromCart/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String removeFromCart(@PathVariable("id") String id, HttpServletResponse response) throws IOException {
        restUser.removeFromCart(id);
        int current = (Integer.parseInt(CookieHelper.getCookie("cart")));
        current -= 1;
        Cookie cookie = new Cookie("cart", String.valueOf(current));
        cookie.setHttpOnly(true);
        cookie.setMaxAge(9999999);
        cookie.setPath("/");
        response.addCookie(cookie);
        return String.valueOf(current);
    }

    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public ModelAndView cart(HttpServletResponse response) throws IOException {
        Map<String, ?> user = restUser.getCart();
        if (((List) user.get("cart")).size() == 0) {
            response.sendRedirect("/");
            return new ModelAndView("index");
        }
        return new ModelAndView("cart").addObject("user", user);
    }

    @RequestMapping(value = "/detail-order/{id}", method = RequestMethod.GET)
    public ModelAndView detailorder(@PathVariable("id") String id) throws IOException {
        Map<String, ?> order = (Map<String, ?>) restOrder.getOne(id);
        if (!order.get("status").equals("completed") && !order.get("status").equals("canceled")) {
            return statusorder(id);
        }
        return new ModelAndView("detail-order").addObject("order", order);
    }

    @RequestMapping(value = "/sametaste", method = RequestMethod.GET)
    public ModelAndView sametaste() throws IOException {
        return new ModelAndView("sametaste").addObject("users", restUser.getAll());
    }

    @RequestMapping(value = "/status-order/{id}", method = RequestMethod.GET)
    public ModelAndView statusorder(@PathVariable("id") String id) throws IOException {
        Object order = restOrder.getOne(id);
        return new ModelAndView("status-order").addObject("order", order);
    }

    @RequestMapping(value = "/like/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String like(@PathVariable("id") String id) throws IOException {
        String result = restUser.like(id);
        return result.replace("\"", "");
    }
    @RequestMapping(value = "/disabled", method =RequestMethod.GET)
    public ModelAndView disabled(){
        return new ModelAndView("disable");
    }
    @RequestMapping(value = "/updateUser")
    public ModelAndView update(MultipartContainer multipartContainer, User user, HttpServletResponse response) throws IOException, ServletException {
        MultipartFile[] multipartFile = multipartContainer.getMultipartFile();
        String path = "./";
        FileDataBodyPart filePart;

        Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class).build();
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        String fileName = multipartFile[0].getOriginalFilename();
        File file = new File(path, fileName);
        if (fileName != "") {
            multipartFile[0].transferTo(file);
            filePart = new FileDataBodyPart("avatar", file);
            formDataMultiPart.bodyPart(filePart);
        }
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("user", user, MediaType.APPLICATION_JSON_TYPE);
        final WebTarget target = client.target("http://localhost:9032/User/");
        final String responseJSON = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(multipart, MediaType.MULTIPART_FORM_DATA), String.class);
        if (fileName != "") {
            file.delete();
        }
        response.sendRedirect("/login");
        return new ModelAndView("login");
    }
}
