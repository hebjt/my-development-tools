package com.tanghsk.mock.admin.exam.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tanghsk.util.CommUtil;

/**
 * 上传图片
 * <p>
 * 为CKEDITOR定制的图片上传功能，后续可以扩展上传其他格式的文件 上传的文件的基础路径为:
 * ${apache.home}/${project.name}
 * /${project.name}/freemarker/upload/img/${'yyyyMMdd'}/ 每个文件夹下最多500个文件
 * </p>
 * 
 * 
 */
@Controller
@RequestMapping("/upload.action")
public class CKeditorFileUploadAction {
	protected final Logger logger = Logger.getLogger(CKeditorFileUploadAction.class);
	/*
	//** ~~~ 上传文件的保存路径 
	private  String resource_path = "";
	///** ~~~ 上传文件的保存的下一级路径，标示存储类型 
	private  String filesAndImg = "";
	//** ~~~ 为了能让CKEDITOR加载到上传的图片，此处将位置限制在了upload_file下 
	private String upload_file = "";
	//** ~~~ 系统默认建立和使用的以时间字符串作为文件名称的时间格式 
	*/
	private static final String DEFAULT_SUB_FOLDER_FORMAT_AUTO = "yyyyMMddHHmmss";


	/*
	 * @RequestMapping(value="upload.action",method = RequestMethod.GET) public
	 * void processUpload(HttpServletRequest request,HttpServletResponse
	 * response) throws Exception { processUploadPost(request,response); return;
	 * }
	 */
	@RequestMapping(method = RequestMethod.POST)
	public void processUploadPost(
			@RequestParam("upload") MultipartFile muliFile,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		/*---------------------------------------------------留作备份------------------------------------------------------------
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/config/uploadFile.properties");
		String resource_path=CommUtil.readValue(filePath, "resource_path");
		String filesAndImg = CommUtil.readValue(filePath, "filesAndImg");
		String upload_file = CommUtil.readValue(filePath, "upload_file");
		
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		String paper_id = request.getParameter("paper_id");

		String separator= File.separator;
		String root = RequestContext.class.getResource("/").getFile();
		String f = new File(root).getParentFile().getParentFile().getParentFile().getCanonicalPath();
		String path =f+separator+upload_file+separator+resource_path+separator+filesAndImg+separator+paper_id;
		// String
		// path=CKeditorFileUploadAction.class.getResource("/").toURI().getPath().split("WEB-INF")[0]+upload_file+resource_path+filesAndImg+"/"+paper_id+"/";
		//String path = request.getSession().getServletContext().getRealPath(upload_file + resource_path+ filesAndImg + "/" + paper_id+ "/");
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		String fileUrl = "";
		if (!muliFile.isEmpty()) {
			byte[] bytes = muliFile.getBytes();
			String muliName = buildFileBySysTime();
			FileOutputStream fos = new FileOutputStream(path + "/"+ muliName+muliFile.getOriginalFilename()); // 写入文件

			fileUrl = upload_file +"/" +resource_path+"/"+ filesAndImg + "/" + paper_id + "/"+muliName+ muliFile.getOriginalFilename();
			fileUrl = "/"+fileUrl;// 去掉/freemarker的第一个/，否则ckeditor不识别
			fileUrl = StringUtils.replace(fileUrl, "//", "/");

			// 将上传的图片的url返回给ckeditor
			String callback = request.getParameter("CKEditorFuncNum");
			out.println("<script type='text/javascript'>");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'" + fileUrl + "',''" + ")");
			out.println("</script>");
			fos.write(bytes);
			fos.close();
		}
		-------------------------------------------------------------------------------------------------------------------------------------*/
		
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/config/uploadFile.properties");
		String remoteHost=CommUtil.readValue(filePath, "remoteHost");
		String mappingDevice = CommUtil.readValue(filePath, "mappingDevice");
		//String upload_file = CommUtil.readValue(filePath, "upload_file");
		
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		String paper_id = request.getParameter("paper_id");
		String path=mappingDevice+paper_id;
		String fileUrl="";
		File file = new File(path);
		if (!file.exists()) {
			file.mkdirs();
		}
		if (!muliFile.isEmpty()) {
			byte[] bytes = muliFile.getBytes();
			String muliName = buildFileBySysTime();
			FileOutputStream fos = new FileOutputStream(path + "/"+ muliName+muliFile.getOriginalFilename()); // 写入文件

			fileUrl = remoteHost + paper_id + "/"+muliName+ muliFile.getOriginalFilename();
			//fileUrl = "/"+fileUrl;// 去掉/freemarker的第一个/，否则ckeditor不识别
			//fileUrl = StringUtils.replace(fileUrl, "//", "/");

			// 将上传的图片的url返回给ckeditor
			String callback = request.getParameter("CKEditorFuncNum");
			out.println("<script type='text/javascript'>");
			out.println("window.parent.CKEDITOR.tools.callFunction(" + callback
					+ ",'" + fileUrl + "',''" + ")");
			out.println("</script>");
			fos.write(bytes);
			fos.close();
		}

	}



	/**
	 * 根据当前的时间建立文件夹，时间格式yyyyMMdd
	 * 
	 * @param path
	 * @return
	 */
	private String buildFileBySysTime() {
		DateFormat df = new SimpleDateFormat(DEFAULT_SUB_FOLDER_FORMAT_AUTO);
		String fileName = df.format(new Date());
		return fileName;
	}
}
