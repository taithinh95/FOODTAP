/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Nghia.Util;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author BEN ALPHA
 */
public class MultipartContainer {
    private MultipartFile[] multipartFile;
    public MultipartContainer(MultipartFile[] multipartFile) {
        this.multipartFile = multipartFile;
    }

    public MultipartContainer() {
    }

    public MultipartFile[] getMultipartFile() {
        return multipartFile;
    }

    public void setMultipartFile(MultipartFile[] multipartFile) {
        this.multipartFile = multipartFile;
    }

    
    
}
