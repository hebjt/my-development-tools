package test.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.*;
public class MainConnection{
	
	public void getConnection(){
		final String URL="jdbc:mysql://localhost/bbs";
		final String userName="root";
		final String passWord="admin";
		Connection conn=null;
		PreparedStatement ps=null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=DriverManager.getConnection(URL,userName,passWord);
		}catch(Exception e){
			e.printStackTrace();
		}

		String sql="select * from user where id=?";

		try{
			ps=conn.prepareStatement(sql);
			ps.setInt(1,3);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString("username"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(ps!=null){
					ps.close();
					ps=null;
				}
				if(conn!=null){
					conn.close();
					conn=null;
				}
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	public void sortInput(){
		FileInputStream fs=null;
		StringBuffer sb = new StringBuffer();
		try {
			fs = new FileInputStream("f:/test/test.txt");
			int b = -1;
			while((b=fs.read())!=-1){
				char c= (char)b;
				sb.append(c);
				//System.out.println(c);
			}
			String[] ss=sb.toString().split(",");
			doSort(ss);
			lsArray(doSort(ss));
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("文件没发现");
			// TODO: handle exception
		}catch(IOException e){
			e.printStackTrace();
			System.out.println("文件读写错误");
		}
	}
	/**
	 * 冒泡排序
	 * @param args
	 */
	public String[] doSort(String[] ss){
		//int length=num.length;
		for (int i = 0; i < ss.length; i++) {
			for (int j = i; j < ss.length; j++) {
				if(Integer.valueOf(ss[i])>Integer.valueOf(ss[j])){
					String temp = ss[i];
					ss[i]=ss[j];
					ss[j]=temp;
					
				}
				lsArray(ss);
			}
			
			//System.out.println("第"+i+"个数据是"+ss[i]);
		}
		return ss;
	}
	/**
	 * 遍历数组
	 * @param args
	 */
	public void lsArray(String[] ss){
		for (int i = 0; i < ss.length; i++) {
			System.out.print(ss[i]+" ");
		}
		System.out.println();
	}
	public static void main(String[] args){
		MainConnection mc = new MainConnection();
		//mc.getConnection();
		mc.sortInput();
		//System.out.println("11111111111");
	}
}