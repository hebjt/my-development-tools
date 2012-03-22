package com.tanghsk.util;

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
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tanghsk.mock.admin.right.domain.ExamRight;
import com.tanghsk.mock.admin.right.service.ExamRightService;

public class CommUtil {
	private static ArrayList<String> allFiles = new ArrayList<String>();
	public static String sErrorMessage;
	private static int SIZE=4096;
	/*
	 * 当前系统的UNIX时间戳加8位随机数字进行MD5散列
	 */
	public static String getNewID() {
		Random random_id = new Random();
		String randomStr = String.valueOf(random_id.nextInt(100000000));
		Calendar now_time = new java.util.GregorianCalendar();
		String nowTimeStr = String.valueOf(now_time.getTimeInMillis());

		return DigestUtils.md5Hex(randomStr + nowTimeStr);
	}

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
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
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
	public static void readProperties(String filePath) {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
			props.load(in);
			Enumeration en = props.propertyNames();
			while (en.hasMoreElements()) {
				String key = (String) en.nextElement();
				String Property = props.getProperty(key);
				System.out.println(key + Property);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 写入properties信息
	public static void writeProperties(String filePath, String parameterName,
			String parameterValue) {
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
			System.err.println("Visit " + filePath + " for updating "
					+ parameterName + " value error");
		}
	}
	
	/**
	 * 压缩包解压
	 * @param sZipPathFile压缩包路径
	 * @param sDestPath 目标路径
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

	public static void main(String[] args) throws IOException{
		//readValue("src/uploadFile.properties", "firstworkspace");
		// writeProperties("info.properties","age","21");
		// readProperties("info.properties" );
		//System.out.println("OK");
		/*
        String resource = "mybatis-config.xml";  
        Reader reader = Resources.getResourceAsReader(resource);  
        SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);  
          
        SqlSession session = ssf.openSession();  
          
        try {  
        	List<ExamRight> riht = session.selectList("com.tanghsk.mock.admin.right.mapper.ExamRightMapper.loadListPageAll");  
            System.out.println(riht.size());  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            session.close();  
        }  
        */
        ApplicationContext context = new ClassPathXmlApplicationContext("spring-application.xml");  
        ExamRightService userService = (ExamRightService)context.getBean("rightService");  
        Page page = new Page();
        List<ExamRight> userInfo = userService.loadListPageAll(page);  
        System.out.println(userInfo.size()); 
    }

}
