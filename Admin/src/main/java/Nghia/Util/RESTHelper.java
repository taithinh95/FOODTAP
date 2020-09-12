package Nghia.Util;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.WebUtils;

public class RESTHelper<T> {

    private WebTarget webTarget;
    private Client client;
    private String BASE_URI;
    private ObjectMapper mapper;

    public RESTHelper(Class<T> aClazz) throws InstantiationException, IllegalAccessException {
        client = ClientBuilder.newClient();
        BASE_URI = "http://localhost:9032/" + aClazz.toString().substring(13) + "/";
        webTarget = client.target(BASE_URI);
        mapper = new ObjectMapper();
    }

    public List<T> getAll() throws IOException {
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken")).get(String.class);
        Object tmpObject = (Object) mapper.readValue(string, new TypeReference<List<Object>>() {
        });
        return (List<T>) tmpObject;
    }

    public Map<String, T> put(T t) throws IOException {
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .put(Entity.entity(t, MediaType.APPLICATION_JSON), String.class);
        Map<String, T> tmpObject = mapper.readValue(string, new TypeReference<Map<String, T>>() {
        });
        return tmpObject;
    }

    public Map<String, T> post(T t) throws IOException {
        String string = webTarget.request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(t, MediaType.APPLICATION_JSON), String.class);
        Map<String, T> tmpObject = mapper.readValue(string, new TypeReference<Map<String, T>>() {
        });
        return tmpObject;
    }

    public <T> T delete(String id) throws IOException {
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .delete(String.class);
        T obj = mapper.readValue(string, new TypeReference<T>() {
        });
        return (T) obj;
    }

    public <T> T getOne(String id) throws IOException {
        String string = webTarget.path(id).request(MediaType.APPLICATION_JSON)
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .get(String.class);
        T obj = mapper.readValue(string, new TypeReference<T>() {
        });
        return (T) obj;
    }
}
