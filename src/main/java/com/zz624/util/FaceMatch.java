package com.zz624.util;

import com.zz624.matchbean.FMatch;
import com.zz624.matchbean.Image;

import java.util.HashMap;
import java.util.Map;


/**
* 人脸对比
*/
public class FaceMatch {

    /**
    * 重要提示代码中所需工具类
    * FileUtil,Base64Util,HttpUtil,GsonUtils请从
    * https://ai.baidu.com/file/658A35ABAB2D404FBF903F64D47C1F72
    * https://ai.baidu.com/file/C8D81F3301E24D2892968F09AE1AD6E2
    * https://ai.baidu.com/file/544D677F5D4E4F17B4122FBD60DB82B3
    * https://ai.baidu.com/file/470B3ACCA3FE43788B5A963BF0B625F3
    * 下载
    */
    public static FMatch match(String base64,String facetoken) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        try {
        	Image[] map = new Image[2];
        	
//        	String filePath = "C:\\Users\\Administrator\\Desktop\\1.jpg";
//            byte[] imgData = FileUtil.readFileByBytes(filePath);
//            String imgStr = Base64Util.encode(imgData);
//        	map[0] = new Image(imgStr, "BASE64");
        	
        	map[0] = new Image(base64, "BASE64");
        	map[0].setLiveness_control("NORMAL");
        	map[0].setQuality_control("NORMAL");
//        	String filePath2 = "C:\\Users\\Administrator\\Desktop\\2.jpg";
//            byte[] imgData2 = FileUtil.readFileByBytes(filePath2);
//            String imgStr2 = Base64Util.encode(imgData2);
        	
        	map[1] = new Image(facetoken, "FACE_TOKEN");
        	
            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthService.getAuth();

            String result = HttpUtil.post(url, accessToken, "application/json", param);

            //System.out.println(result);
            
            //将json解析成对象
            FMatch fMatch = new FMatch();
        	fMatch = GsonUtils.fromJson(result, FMatch.class);
            return fMatch;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static FMatch match(String base64) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/match";
        try {
        	Image[] map = new Image[2];
        	
//        	String filePath = "C:\\Users\\Administrator\\Desktop\\1.jpg";
//            byte[] imgData = FileUtil.readFileByBytes(filePath);
//            String imgStr = Base64Util.encode(imgData);
//        	map[0] = new Image(imgStr, "BASE64");
        	
        	map[0] = new Image(base64, "BASE64");
        	map[0].setLiveness_control("NORMAL");
        	map[0].setQuality_control("NORMAL");
//        	String filePath2 = "C:\\Users\\Administrator\\Desktop\\2.jpg";
//            byte[] imgData2 = FileUtil.readFileByBytes(filePath2);
//            String imgStr2 = Base64Util.encode(imgData2);
        	
        	map[1] = new Image(base64, "BASE64");
        	map[1].setLiveness_control("NORMAL");
        	map[1].setQuality_control("NORMAL");
        	
            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthService.getAuth();

            String result = HttpUtil.post(url, accessToken, "application/json", param);

            //System.out.println(result);
            
            //将json解析成对象
            FMatch fMatch = new FMatch();
        	fMatch = GsonUtils.fromJson(result, FMatch.class);
            return fMatch;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String add(String id,String facetoken) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", facetoken);
            map.put("group_id", "ailin");
            map.put("user_id", id);
            map.put("image_type", "FACE_TOKEN");
            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = AuthService.getAuth();

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static FMatch detect(String facetoken) {
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/detect";

        try {
            Map<String, Object> map = new HashMap();
            map.put("image", facetoken);
            map.put("image_type", "FACE_TOKEN");
            map.put("face_field", "age,beauty,expression,faceshape,gender,glasses,race,");
            map.put("max_face_num", 1);
            String param = GsonUtils.toJson(map);
            String accessToken = AuthService.getAuth();
            String result = HttpUtil.post(url, accessToken, "application/json", param);

            //System.out.println(result);

            //将json解析成对象
            FMatch fMatch = new FMatch();
            fMatch = GsonUtils.fromJson(result, FMatch.class);
            return fMatch;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


//    public static void main(String[] args) {
//    	FMatch fMatch = new FMatch();
//    	fMatch = GsonUtils.fromJson(FaceMatch.match(), FMatch.class);
//        System.out.println("照片1facetoken："+fMatch.getResult().getFace_list().get(0).getFace_token());
//        System.out.println("照片2facetoken："+fMatch.getResult().getFace_list().get(1).getFace_token());
//        System.out.println("匹配率："+fMatch.getResult().getScore());
//    }
}