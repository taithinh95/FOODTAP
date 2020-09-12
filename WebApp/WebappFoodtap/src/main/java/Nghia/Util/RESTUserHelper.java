/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nghia.Util;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import models.Cart;
import models.Comment;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

/**
 *
 * @author BEN ALPHA
 */
public class RESTUserHelper extends RESTHelper {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;

    public RESTUserHelper(Class aClazz) throws InstantiationException, IllegalAccessException {
        super(aClazz);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/" + aClazz.toString().substring(13) + "/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
    }

    public Map<String, ?> getMyUser() throws IOException {
        String url = BASE_URI + "/getMyUser";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Map<String, ?> tmpObject = mapper.readValue(string, new TypeReference<Map<String, ?>>() {
        });
        return tmpObject;
    }

    public List<Map<String, ?>> getFriendRequests() throws IOException {
        String url = BASE_URI + "/getFriendRequests";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        List<Map<String, ?>> tmpObject = mapper.readValue(string, new TypeReference<List<Map<String, ?>>>() {
        });
        return tmpObject;
    }

    public List<Map<String, ?>> getNotification() throws IOException {
        String url = BASE_URI + "/getNotifications";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        List<Map<String, ?>> tmpObject = mapper.readValue(string, new TypeReference<List<Map<String, ?>>>() {
        });
        return tmpObject;
    }

    public String search(String keyword) throws IOException {
        String url = BASE_URI + "/search";
        webTarget = client.target(url);
        String string = webTarget.path(keyword).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        return string;
    }

    public String searchByFullName(String keyword) throws IOException {
        String url = BASE_URI + "/searchByFullName";
        webTarget = client.target(url);
        String string = webTarget.path(keyword).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        return string;
    }

    public Map<String, ?> searchAll(String keyword) throws IOException {
        String url = BASE_URI + "/searchAll";
        webTarget = client.target(url);
        String string = webTarget.path(keyword).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Map<String, ?> tmpObject = mapper.readValue(string, new TypeReference<Map<String, ?>>() {
        });
        return tmpObject;
    }

    public Map<String, ?> getCart() throws IOException {
        String url = BASE_URI + "getCart";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Map<String, ?> tmpObject = mapper.readValue(string, new TypeReference<Map<String, ?>>() {
        });
        return tmpObject;
    }

    public String addToCart(Cart cart) {
        String url = BASE_URI + "addToCart";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(cart, MediaType.APPLICATION_JSON), String.class);
        return string;
    }

    public String recart(String id) {
        String url = BASE_URI + "recart";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(null, String.class);
        return string;
    }

    public String reorder(String id) {
        String url = BASE_URI + "reorder";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(null, String.class);
        return string;
    }

    public String sendRequestFriend(String id) {
        String url = BASE_URI + "requestFriend";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(null, String.class);
        return string;
    }

    public String acceptRequestFriend(String id) {
        String url = BASE_URI + "acceptRequest";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(null, String.class);
        return string;
    }

    public String comment(Comment comment) {
        String url = BASE_URI + "comment";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(comment, MediaType.APPLICATION_JSON), String.class);
        return string;
    }

    public String follow(String json) {
        String url = BASE_URI + "follow";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.json(json), String.class);
        return string;
    }

    public String like(String id) {
        String url = BASE_URI + "like";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(null, String.class);
        return string;
    }

    public String sendRouteToShipper(String json) {
        String url = BASE_URI + "sendRouteToShipper";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.json(json), String.class);
        return string;
    }

    public String sendLocationUser(String json) {
        String url = BASE_URI + "sendLocationUser";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.json(json), String.class);
        return string;
    }

    public String cancelRequestFriend(String id) {
        String url = BASE_URI + "cancelRequest";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(null, String.class);
        return string;
    }

    public String switchCart(Cart cart) {
        String url = BASE_URI + "switchCart";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(cart, MediaType.APPLICATION_JSON), String.class);
        return string;
    }

    public String removeFromCart(String id) {
        String url = BASE_URI + "removeFromCart";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .delete(String.class);
        return string;
    }
}
