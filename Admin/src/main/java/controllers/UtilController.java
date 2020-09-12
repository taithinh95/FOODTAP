

package controllers;

import Nghia.Util.CookieHelper;
import java.io.File;
import java.io.IOException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import models.Restaurant;
import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.media.multipart.file.FileDataBodyPart;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UtilController {
    
    @RequestMapping(value = "/util/upload", method = RequestMethod.POST,consumes = "multipart/form-data",produces = "application/json")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile file, Restaurant restaurant) throws IOException{
        String fileName = file.getOriginalFilename();
        String path = "./";
        File tempFile = new File(path, fileName);
        System.out.println(tempFile.getAbsolutePath());
        file.transferTo(tempFile);
        final Client client = ClientBuilder.newBuilder().register(MultiPartFeature.class).build();
        final FileDataBodyPart filePart = new FileDataBodyPart("avatar", tempFile);
        FormDataMultiPart formDataMultiPart = new FormDataMultiPart();
        final FormDataMultiPart multipart = (FormDataMultiPart) formDataMultiPart.field("restaurant", restaurant, MediaType.APPLICATION_JSON_TYPE).bodyPart(filePart);
        final WebTarget target = client.target("http://localhost:9032/Restaurant/");
        final Response response = target.request()
                .header("authorization", CookieHelper.getCookie("accessToken"))
                .post(Entity.entity(multipart, multipart.getMediaType()));
        tempFile.delete();
        return "";
    }
}
