package utils;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;

import java.io.InputStream;

public class Upload {

    private InputStream inputStream;
    private String filename;

    public void run() throws Exception {
        FTPClient client = new FTPClient();
        try {
            client.connect("files.000webhost.com", 21);
            if(client.login("image-lifestyle", "lifestyle")) {
                System.out.println("Connected to files.000webhost.com as image-lifestyle");
                client.enterLocalPassiveMode();
                if(client.setFileType(FTP.BINARY_FILE_TYPE)) {
                    String remoteFile = "/public_html/images/" + filename + ".jpg";
                    boolean storing = client.storeFile(remoteFile, inputStream);
                    if(storing)
                        System.out.println("UPLOAD DONE");
                }
            }
        }
        catch (Exception e) {
            throw new Exception(e.getMessage());
        }
        finally {
            if(client.isConnected()) {
                client.logout();
                client.disconnect();
            }
        }
    }

    public Upload(InputStream inputStream, String filename) {
        this.setInputStream(inputStream);
        this.setFilename(filename);
    }

    public Upload() {
    }

    private void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    private void setFilename(String filename) {
        this.filename = filename;
    }
}
