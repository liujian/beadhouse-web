package com.beadhouse.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.Background;
import com.beadhouse.pojo.CodeColortype;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Theme;
import com.beadhouse.service.BackgroundService;
import com.beadhouse.service.ThemeService;



/**
 * 
 * @notes 背景图片设计配置 
 *
 * @author liujian
 * @date 2018年12月4日
 * @class ThemeController.java
 */
@Controller
@RequestMapping("/background")
public class BackgroundController {
	
	@Autowired
	private BackgroundService backgroundService;
	
	@RequestMapping("/configure")
	private String getmuenAddpage(Model model) { 
	
		Pagenation pagenation=new Pagenation();
		EUDataGridResult list=backgroundService.getBackgroundlist(new Pagenation());
 		List<Background> Backgroundlist=(List<Background>)list.getRows(); 
		pagenation.setRowCount( Integer.parseInt(String.valueOf(list.getTotal())));
		model.addAttribute("Backgroundlist", Backgroundlist);
		model.addAttribute("itemsCount", Backgroundlist.size());
		model.addAttribute("pagenation", pagenation);
				  
		return "/background/uploadImage";
	}
	
	@RequestMapping("/uploadpage")
	@ResponseBody
	public String pictureUploadPage(MultipartFile image ) {
		
	
		CommonsMultipartFile cf = (CommonsMultipartFile)image;  
		DiskFileItem fi = (DiskFileItem) cf.getFileItem(); 
		File file = fi.getStoreLocation();
		Background img = new Background();
		//取原始文件名
		String oldName = image.getOriginalFilename();
		img.setBackground(oldName);
		
		backgroundService.uploadPicture(file,img);
		 
		return "ajax";
	}
	@RequestMapping("/Imageview")
	private String getImageview(Model model,String id) { 
		try {
			id=java.net.URLDecoder.decode( id, "UTF-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("id",id);
		  
		return "/background/imageview";
	}
	
	//图片预览
	@RequestMapping("/readImg")
	public void readImg(String id,HttpServletRequest request,HttpServletResponse response ) {
	
		Background img = backgroundService.getBackground(Integer.parseInt(id));
		if(img == null) {
			return;
		}
		String path=getImgpath();
		FileInputStream fis= null;
		OutputStream out=null;
		if(new File(path+File.separator+File.separator+img.getBackground()+"").getAbsoluteFile().exists()){
			try {
				out = response.getOutputStream();   
				fis = new FileInputStream(new File(path+File.separator+File.separator+img.getBackground()+""));
				byte[] buffer = new byte[1024*8];
				//读取文件流  
				int len = 0;  
				while ((len = fis.read(buffer)) != -1){  
				    out.write(buffer,0,len);  
				}  
				out.flush();
		        } catch (Exception e) {
		             e.printStackTrace();
		        } finally {
			        if(fis != null){
			           try {
			        	   fis.close();
						} catch (IOException e) {
						    e.printStackTrace();
						}
			        }
		            if(out != null){
			            try {
							out.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
		            }
		        }
		   }
		
	}
	
	
	
	//删除
	@RequestMapping("/deleteImage")
	private String deleteImage(@RequestParam(value="id")Integer id) {
		backgroundService.deleteImage(id);
		return  "redirect:/background/configure";
	}
	
	public String getImgpath(){	
		return backgroundService.getBackgroundpath();
	}

}
