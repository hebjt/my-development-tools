package com.tanghsk.sync.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Random;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import org.apache.log4j.Logger;

public class CommUtil {
	protected static Logger logger = Logger.getLogger("ExamPaperAction");
	private static ArrayList<String> allFiles = new ArrayList<String>();
	public static String sErrorMessage;
	private static int SIZE = 4096;



	/**
	 * 判断文件及目录是否存在，若不存在则创建文件及目录
	 * 
	 * @param filepath
	 * @return
	 * @throws Exception
	 */
	public static File checkExist(String filepath) throws Exception {
		File file = new File(filepath);

		if (file.exists()) {// 判断文件目录的存在
			System.out.println("文件夹存在！");
			if (file.isDirectory()) {// 判断文件的存在性
				System.out.println("文件存在！");
			} else {
				file.createNewFile();// 创建文件
				System.out.println("文件不存在，创建文件成功！");
			}
		} else {
			System.out.println("文件夹不存在！");
			File file2 = new File(file.getParent());
			file2.mkdirs();
			System.out.println("创建文件夹成功！");
			if (file.isDirectory()) {
				System.out.println("文件存在！");
			} else {
				file.createNewFile();// 创建文件
				System.out.println("文件不存在，创建文件成功！");
			}
		}
		return file;
	}

	// 根据key读取value
	public static String readValue(String filePath, String key) {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(filePath));
			props.load(in);
			String value = props.getProperty(key);
			System.out.println(key + value);
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 读取properties的全部信息
	public static Properties readProperties(String filePath) {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(filePath));
			props.load(in);
			Enumeration en = props.propertyNames();
			while (en.hasMoreElements()) {
				String key = (String) en.nextElement();
				String Property = props.getProperty(key);
				System.out.println(key + Property);
			}
			return props;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 写入properties信息
	public static void writeProperties(String filePath, String parameterName, String parameterValue) {
		Properties prop = new Properties();
		try {
			InputStream fis = new FileInputStream(filePath);
			// 从输入流中读取属性列表（键和元素对）
			prop.load(fis);
			// 调用 Hashtable 的方法 put。使用 getProperty 方法提供并行性。
			// 强制要求为属性的键和值使用字符串。返回值是 Hashtable 调用 put 的结果。
			OutputStream fos = new FileOutputStream(filePath);
			prop.setProperty(parameterName, parameterValue);
			// 以适合使用 load 方法加载到 Properties 表中的格式，
			// 将此 Properties 表中的属性列表（键和元素对）写入输出流
			prop.store(fos, "Update '" + parameterName + "' value");
		} catch (IOException e) {
			System.err.println("Visit " + filePath + " for updating " + parameterName + " value error");
		}
	}

	/**
	 * 压缩包解压
	 * 
	 * @param sZipPathFile压缩包路径
	 * @param sDestPath
	 *            目标路径
	 * @return
	 */
	public static ArrayList<String> Ectract(String sZipPathFile, String sDestPath) {
		ArrayList<String> allFileName = new ArrayList<String>();
		try {
			// 先指定压缩档的位置和档名，建立FileInputStream对象
			FileInputStream fins = new FileInputStream(sZipPathFile);
			// 将fins传入ZipInputStream中
			ZipInputStream zins = new ZipInputStream(fins);
			ZipEntry ze = null;
			byte ch[] = new byte[SIZE];
			while ((ze = zins.getNextEntry()) != null) {
				File zfile = new File(sDestPath + ze.getName());
				File fpath = new File(zfile.getParentFile().getPath());
				if (ze.isDirectory()) {
					if (!zfile.exists())
						zfile.mkdirs();
					zins.closeEntry();
				} else {
					if (!fpath.exists())
						fpath.mkdirs();
					FileOutputStream fouts = new FileOutputStream(zfile);
					int i;
					allFileName.add(zfile.getAbsolutePath());
					while ((i = zins.read(ch)) != -1)
						fouts.write(ch, 0, i);
					zins.closeEntry();
					fouts.close();
				}
			}
			fins.close();
			zins.close();
			sErrorMessage = "OK";
		} catch (Exception e) {
			System.err.println("Extract error:" + e.getMessage());
			sErrorMessage = e.getMessage();
		}
		allFiles.clear();
		return allFileName;
	}

	/**
	 * 根据路径删除指定的目录或文件，无论存在与否
	 * 
	 * @param sPath
	 *            要删除的目录或文件
	 * @return 删除成功返回 true，否则返回 false。
	 */
	public static boolean DeleteFolder(String sPath) {
		boolean flag = false;
		File file = new File(sPath);
		// 判断目录或文件是否存在
		if (!file.exists()) { // 不存在返回 false
			return flag;
		} else {
			// 判断是否为文件
			if (file.isFile()) { // 为文件时调用删除文件方法
				logger.info("删除文件开始");
				return deleteFile(sPath);
			} else { // 为目录时调用删除目录方法
				return deleteDirectory(sPath);
			}
		}
	}

	/**
	 * 删除单个文件
	 * 
	 * @param sPath
	 *            被删除文件的文件名
	 * @return 单个文件删除成功返回true，否则返回false
	 */
	public static boolean deleteFile(String sPath) {
		boolean flag = false;
		File file = new File(sPath);
		// 路径为文件且不为空则进行删除
		logger.info("要删除的文件：" + sPath);
		if (file.isFile() && file.exists()) {
			file.delete();
			flag = true;
			// logger.info("#########################################");
		}
		logger.info("删除状态：" + flag);
		return flag;
	}

	/**
	 * 删除目录（文件夹）以及目录下的文件
	 * 
	 * @param sPath
	 *            被删除目录的文件路径
	 * @return 目录删除成功返回true，否则返回false
	 */
	public static boolean deleteDirectory(String sPath) {
		// 如果sPath不以文件分隔符结尾，自动添加文件分隔符
		logger.info("删除的目录：" + sPath);
		if (!sPath.endsWith(File.separator)) {
			sPath = sPath + File.separator;
		}
		File dirFile = new File(sPath);
		// 如果dir对应的文件不存在，或者不是一个目录，则退出
		if (!dirFile.exists() || !dirFile.isDirectory()) {
			return false;
		}
		boolean flag = true;
		// 删除文件夹下的所有文件(包括子目录)
		File[] files = dirFile.listFiles();
		for (int i = 0; i < files.length; i++) {
			// 删除子文件
			if (files[i].isFile()) {
				logger.info("文件夹里的文件删除:" + files[i].getAbsolutePath());
				flag = deleteFile(files[i].getAbsolutePath());
				if (!flag)
					break;
			} // 删除子目录
			else {
				flag = deleteDirectory(files[i].getAbsolutePath());
				if (!flag)
					break;
			}
		}
		if (!flag)
			return false;
		// 删除当前目录
		if (dirFile.delete()) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 替换中文字符
	 * @param str
	 * @return
	 */
	public static String replaceZHChar(String str){
	    //str = str.replaceAll("[^x00-xff]*" , "xx" );
	    //System.out.print(str);
	    //return str;
		/*
		char ch=0;
		String s="";
	    for(int i=0;i<str.length();i++){
	    	  ch = str.charAt(i);
	    	  int v = (int)ch;
	    	  if(v>=19968 && v <= 171941){
	    	    s=str.replace(String.valueOf(ch), "xxx");
	    	    //xxx是你要替换成的内容
	    	    
	    	  } 
	    	}
	    System.out.println(s);
	    */
	   String sss=str.substring(str.lastIndexOf("."), str.length());
	   return sss;
	}

	public static void main(String[] args) {
		//readValue("src/uploadFile.properties", "firstworkspace");
		// writeProperties("info.properties","age","21");
		// readProperties("info.properties" );
		//System.out.println("OK");
		String str="/apepr/parse/nv测试.MP4";//是你的字符串
		CommUtil.replaceZHChar(str);
		
	}
}
