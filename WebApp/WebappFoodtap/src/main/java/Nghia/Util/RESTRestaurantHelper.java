/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Nghia.Util;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import static javafx.scene.input.KeyCode.T;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

/**
 *
 * @author BEN ALPHA
 */
public class RESTRestaurantHelper extends RESTHelper {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;

    public RESTRestaurantHelper(Class aClazz) throws InstantiationException, IllegalAccessException {
        super(aClazz);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/" + aClazz.toString().substring(13) + "/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
    }

    public List<Map<String, ?>> getMyRestaurants() throws IOException {
        String url = BASE_URI + "getMyRestaurants";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        List<Map<String, ?>> tmpObject = mapper.readValue(string, new TypeReference<List<Map<String, ?>>>() {
        });
        return tmpObject;
    }

    public Map<String, ?> manageMyRestaurant(String id) throws IOException {
        String url = BASE_URI + "manageMyRestaurant/";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Map<String, ?> tmpObject = mapper.readValue(string, new TypeReference<Map<String, ?>>() {
        });
        return tmpObject;
    }
    
    public Map<String, ?> getMenu(String id) throws IOException {
        String url = BASE_URI + "getMenu";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        Map<String, ?> tmpObject = mapper.readValue(string, new TypeReference<Map<String, ?>>() {
        });
        return tmpObject;
    }
    public String paying(String id) throws IOException {
        String url = BASE_URI + "paying";
        webTarget = client.target(url);
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        return string;
    }
}
