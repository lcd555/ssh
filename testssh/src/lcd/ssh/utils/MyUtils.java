package lcd.ssh.utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.crypto.hash.Sha256Hash;
public class MyUtils {
    /**
     *    获取Sha256Hash加密密码
     */
    public static String lrwCode(String password,String salt){
            if(salt==""){
                  salt="abcdefghijklmnopqrstuvwx";
            }
            return new Sha256Hash(password, salt, 1024).toBase64();
      }
    /** 
     *  
     * @Title: outJson 
     * @Description: 输出结果到前台 
     * @param: response 
     * @param: result 设定文件 
     * @return void 返回类型 
     * @throws 
     */  
    public static void outPrint(HttpServletResponse response, String data) {  
        String encoding = "UTF-8";  
        String contentType = "application/json;charset=UTF-8";  

        response.setContentType(contentType);  
        response.setCharacterEncoding(encoding);  
        try {  
            PrintWriter out = response.getWriter();  
            out.print(data);  
            out.flush();  
            out.close();  
        } catch (Exception e) {  
            System.out.println(e.getMessage());  
        }  
    }     
    /** 
     * 判断字符串是否为空 
     *  
     * @param str 字符串 
     * @return true：为空； false：非空 
     */  
    public static boolean isNull(String str) {  
        if (str != null && !str.trim().equals("")) {  
            return false;  
        } else {  
            return true;  
        }  
    }     
}
