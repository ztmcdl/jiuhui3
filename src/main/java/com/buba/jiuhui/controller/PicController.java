package com.buba.jiuhui.controller;

import com.buba.jiuhui.bean.Pictures;
import com.buba.jiuhui.service.PicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
@RequestMapping("pics")
@Controller
public class PicController {
    private String realth ="D:" + File.separator+"jiuhui";
    @Autowired
    private PicService picService;





    @RequestMapping("uploadFiles")
    @ResponseBody
    public boolean uploadFiles(@RequestParam("files") MultipartFile[] files, Model session) throws IllegalStateException, IOException {
        //创建File
        File tempFile = new File(realth);
        if (!tempFile.isDirectory()) {
            tempFile.mkdirs();
        }
        //集合返回值
        boolean result = false;
        //创建批量插入对象
        List<Pictures> list = new ArrayList<Pictures>();
        Pictures pics = null;
        //获取当前系统时间
        long currTime = System.currentTimeMillis();
        //循环获取批量插入图片内容
        for (int i = 0; i < files.length; i++) {
            if (!files[i].isEmpty()) {
                pics = new Pictures();
                //获取后缀名
                String 	uniquename = files[i].getOriginalFilename();//得到文件名
                String suffix = uniquename.substring(uniquename.lastIndexOf(".")+1);//获取扩展名
                //得到文件路径
                String newName = uniquename.substring(0,uniquename.lastIndexOf("."))+"_"+currTime+"."+suffix;
                String filePath = realth+File.separator+newName;//路径
                pics.setUrl(newName);
                //获取文件大小
//				long size = files[i].getSize();
                //上传
                files[i].transferTo(new File(filePath));//转存文件到对象list集合中
                list.add(pics);
            }
        }
        int picsId = picService.uploadFiles(list);
        if (picsId>0) {
            result = true;
        }
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < list.size(); i++) {
            int id=list.get(i).getId();
            //将id根据逗号进行分隔
            buf.append(","+id);
            buf.deleteCharAt(0).toString();
        }
        session.addAttribute("buf", buf);
        System.out.println(buf);
        return result;
    }
}
