package com.muko.utils;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.util.Base64Utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.Properties;
import java.util.UUID;

/**
 * @ description: 图片处理工具类
 */
public class ImgUtil {
    public static final String SIPP = "staffImgPhysicsPath";
    public static final String WIPP = "waresImgPhysicsPath";
    public static final String SIVP = "staffImgVirtualPath";
    public static final String WIVP = "waresImgVirtualPath";

    /*
    调整大小
     */
    public static boolean reSize(String path){
        BufferedInputStream in = null;
        try {
            in = new BufferedInputStream(new FileInputStream(path));

            Image bi = ImageIO.read(in);
            BufferedImage tag = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
            //绘制改变尺寸后的图
            tag.getGraphics().drawImage(bi, 0, 0, 100, 100, null);
            //输出流
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(path));
            //JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
            //encoder.encode(tag);
            ImageIO.write(tag, "PNG", out);
            in.close();
            out.close();
            return true;
        } catch (IOException e){
            return false;
        }
    }

    /**
     * 上传图片处理，base64解码为图片，保存到路径
     * @param base64Data base64格式的图片数据
     * @param path 存储文件夹物物理路径
     * @return 返回图片文件名
     */
    public static String imgDecode(String base64Data, String path){
        String dataPrefix;
        String data;
        if (base64Data == null || "".equals(base64Data)){
            return "failed,传入图片数据为空";
        } else {
            String[] d = base64Data.split("base64,");
            if (d != null && d.length == 2){
                dataPrefix = d[0];
                data = d[1];
            } else {
                return "failed, 图片数据异常";
            }
        }
        String suffix;
        if("data:image/jpeg;".equalsIgnoreCase(dataPrefix)){//data:image/jpeg;base64,base64编码的jpeg图片数据
            suffix = ".jpg";
        } else if("data:image/x-icon;".equalsIgnoreCase(dataPrefix)){//data:image/x-icon;base64,base64编码的icon图片数据
            suffix = ".ico";
        } else if("data:image/gif;".equalsIgnoreCase(dataPrefix)){//data:image/gif;base64,base64编码的gif图片数据
            suffix = ".gif";
        } else if("data:image/png;".equalsIgnoreCase(dataPrefix)){//data:image/png;base64,base64编码的png图片数据
            suffix = ".png";
        } else {
            return "failed, 图片格式错误";
        }
        String imgName = UUID.randomUUID().toString().replaceAll("-", "");
        String compFileName =imgName + suffix;
        byte[] bytes = Base64Utils.decodeFromString(data);
        try {
//            File file = null;
//            String URL = "E:\\Images\\staffImages";
            FileUtils.writeByteArrayToFile(new File(path + compFileName), bytes);
        } catch (Exception e){
            return "failed, 图片存储错误";
        }
        return compFileName;
    }

    /**
     * 读取配置文件获取图片路径（文件夹）
     * @param pathName 名称
     * @return 返回路径
     */
    public static String getImgFolderPath(String pathName){
        Properties properties;
        try {
            properties = PropertiesLoaderUtils.loadAllProperties("imgPath.properties");
            return properties.getProperty(pathName);
        } catch (IOException e){
            e.printStackTrace();
        }
        return null;
    }

    public static boolean deleteImg(String path){
        boolean result = false;
        File file = new File(path);
        if (file.exists()) {
            result = file.delete();
            System.out.println("文件已经被成功删除");
        }
        return result;
    }



//    public static void main(String[] args) {
//        reSize("E:/Images/staffImages/e3f14db28965415bbd96582bdcc9fa5c.jpg");
//    }

}
