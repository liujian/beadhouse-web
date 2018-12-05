package com.beadhouse.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import com.beadhouse.common.pojo.EUDataGridResult;
import com.beadhouse.pojo.CodeColortype;
import com.beadhouse.pojo.Pagenation;
import com.beadhouse.pojo.Theme;
import com.beadhouse.service.ThemeService;



/**
 * 
 * @notes 主题颜色配置 
 *
 * @author liujian
 * @date 2018年12月3日
 * @class ThemeController.java
 */
@Controller
@RequestMapping("/Theme")
public class ThemeController {
	
	@Autowired
	private ThemeService themeService;
	
	@RequestMapping("/logocolor")
	private String getmuenAddpage(Model model) { 
		//主题颜色获取
		List<CodeColortype> list=themeService.getThemeColorList();
		model.addAttribute("list", list);
		Pagenation pagenation=new Pagenation();
		EUDataGridResult list2=themeService.getThemeColor(new Pagenation());
 		List<Theme> Themelist=(List<Theme>)list2.getRows(); 
		pagenation.setRowCount( Integer.parseInt(String.valueOf(list2.getTotal())));
		model.addAttribute("Themelist", Themelist);
		model.addAttribute("itemsCount", Themelist.size());
		model.addAttribute("pagenation", pagenation);
				  
		return "/themecolor/uploadImage";
	}
	
	@RequestMapping("/uploadpage")
	@ResponseBody
	public String pictureUploadPage(MultipartFile image,String code) {
		
	
		CommonsMultipartFile cf = (CommonsMultipartFile)image;  
		DiskFileItem fi = (DiskFileItem) cf.getFileItem(); 
		File file = fi.getStoreLocation();
		Theme img = new Theme();
		//取原始文件名
		String oldName = image.getOriginalFilename();
		img.setLogo(oldName);
		img.setColor(code);
		themeService.uploadPicture(file,img);
		 
		return "ajax";
	}
	@RequestMapping("/Imageview")
	private String getImageview(Model model,String logo) { 
		try {
			logo=java.net.URLDecoder.decode( logo, "UTF-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		model.addAttribute("logo",logo);
		  
		return "/themecolor/imageview";
	}
	
	//图片预览
	@RequestMapping("/readImg")
	public void readImg(String logo,HttpServletResponse response ) {
	
		Theme img = themeService.getTheme(logo);
		if(img == null) {
			return;
		}
		String path=getImgpath();
		FileInputStream fis= null;
		OutputStream out=null;
		if(new File(path+File.separator+File.separator+img.getLogo()+"").getAbsoluteFile().exists()){
			try {
				out = response.getOutputStream();   
				fis = new FileInputStream(new File(path+File.separator+File.separator+img.getLogo()+""));
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
	
	public String getImgpath(){	
		return themeService.getImgpath();
	}

}
