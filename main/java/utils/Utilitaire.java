package utils;

import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

public class Utilitaire {
    public static File getFile(String path, Part part) throws Exception {
        File temp = new File(path + "image.jpg");
        OutputStream outputStream = new FileOutputStream(temp);
        InputStream inputStream = part.getInputStream();
        int read;
        final byte[] bytes = new byte[1024];
        while ((read = inputStream.read(bytes)) != -1)
            outputStream.write(bytes, 0, read);
        return temp;
    }

    public static int getNbBoucles(ArrayList objects, int par) {
        int taille = objects.size();
        if(taille % par == 0)
            return taille/par;
        else {
            int count = 0,
                    i = 0;
            while (i < taille) {
                count++;
                i += par;
            }
            return count;
        }
    }
}
