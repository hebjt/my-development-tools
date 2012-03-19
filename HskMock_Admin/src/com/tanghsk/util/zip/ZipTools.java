package com.tanghsk.util.zip;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;

public class ZipTools {
	private static ArrayList<String> allFiles = new ArrayList<String>();
	public static String sErrorMessage;
	private static int SIZE = 4096;

	public static void zip(String zipFileName, String inputFile)
			throws Exception {
		zip(zipFileName, new File(inputFile));
	}

	public static void zip(String zipFileName, File inputFile) throws Exception {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
				zipFileName));
		zip(out, inputFile, "");
		System.out.println("zip done");
		out.close();
	}
/**
 * 
 * @param zipFileName
 * @param outputDirectory
 * @throws Exception
 *//*
	public static void unzip(String zipFileName, String outputDirectory)
			throws Exception {
		ZipInputStream in = new ZipInputStream(new FileInputStream(zipFileName));
		ZipEntry z;

		// System.out.println("z = in.getNextEntry(): "+((z=in.getNextEntry())!=null));

		while ((z = in.getNextEntry()) != null) {
			System.out.println("unziping " + z.getName());
			if (z.isDirectory()) {
				String name = z.getName();
				name = name.substring(0, name.length() - 1);
				File f = new File(outputDirectory + File.separator + name);
				f.mkdir();
				System.out.println("mkdir " + outputDirectory + File.separator
						+ name);
			} else {
				File f = new File(outputDirectory + File.separator
						+ z.getName());
				if (!f.getParentFile().exists()) {
					f.getParentFile().mkdirs();
				}
				f.createNewFile();
				System.out.println("f:" + f);
				FileOutputStream out = new FileOutputStream(f);
				int b;
				while ((b = in.read()) != -1)
					out.write(b);
				out.close();
			}
		}

		in.close();
	}*/

	public static ArrayList<String> Ectract(String sZipPathFile,String sDestPath) {
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

	public static void zip(ZipOutputStream out, File f, String base)
			throws Exception {
		System.out.println("Zipping  " + f.getName());
		if (f.isDirectory()) {
			File[] fl = f.listFiles();
			out.putNextEntry(new ZipEntry(base + "/"));
			base = base.length() == 0 ? "" : base + "/";
			for (int i = 0; i < fl.length; i++) {
				zip(out, fl[i], base + fl[i].getName());
			}
		} else {
			out.putNextEntry(new ZipEntry(base));
			FileInputStream in = new FileInputStream(f);
			int b;
			while ((b = in.read()) != -1)
				out.write(b);
			in.close();
		}

	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			ZipTools t = new ZipTools();
			ZipTools.Ectract("c:\\unzip\\综合 听力音频.zip", "c:\\unzip\\");
		} catch (Exception e) {
			e.printStackTrace(System.out);
		}
	}

}
