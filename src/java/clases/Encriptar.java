/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import org.apache.commons.codec.digest.DigestUtils;
/**
 *
 * @author MANU
 */
public class Encriptar {
    
    public String cifer;

    public Encriptar(String pal) {
                
        String textoSinEncriptar=pal;
        
        textoSinEncriptar = DigestUtils.md5Hex(textoSinEncriptar); 
        textoSinEncriptar = DigestUtils.sha1Hex(textoSinEncriptar);
        this.cifer = DigestUtils.sha1Hex(textoSinEncriptar);
        
    }

    public String getCifer() {
        return cifer;
    }
    
}
