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
import models.Message;
import models.Newfeed;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;

/**
 *
 * @author BEN ALPHA
 */
public class RESTNewfeedHelper extends RESTHelper {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;

    public RESTNewfeedHelper(Class aClazz) throws InstantiationException, IllegalAccessException {
        super(aClazz);
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/" + aClazz.toString().substring(13) + "/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
    }

    public void postFoodNewfeed(Newfeed newfeed) {
        String url = BASE_URI+"postFoodNewFeed";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(newfeed, MediaType.APPLICATION_JSON), String.class);
    }
    public String getMyNewfeeds() throws IOException {
        String url = BASE_URI + "getMyNewfeeds";
        webTarget = client.target(url);
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        return string;
    }
    
    
}
