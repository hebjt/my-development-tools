package cuijingtao.grid.action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import cuijingtao.grid.domain.Page;
import cuijingtao.grid.domain.User;
import cuijingtao.grid.services.UserService;
import cuijingtao.util.JsonUtil;

public class UserAction extends DispatchAction {
	/**
	 * 
	 */
	public ActionForward exec(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		PrintWriter out = response.getWriter();
		UserService userver = new UserService();
		User user = new User();

		
		//String num = map.get("RowCount").toString();
		
		//int num = userver.getCount();

		//int records = userver.getCount(); // 记录总数

		String page = request.getParameter("page")==null?"1":request.getParameter("page"); // 取得当前页数,注意这是jqgrid自身的参数
		String rows = request.getParameter("rows")==null?"10":request.getParameter("rows"); // 取得每页显示行数，,注意这是jqgrid自身的参数
		String sort = request.getParameter("sidx");//排序字段
		String order = request.getParameter("sord");//排序方式
		//System.out.println("***************"+order);
		Map parameterMap1 = new HashMap();//封装分页参数
		String fieldList="username,password,name,phone,email,addr,level1,state1";
		String tableName="user_msg";
		String queryCondition="";
		String orderList="";
		int eachCount=Integer.parseInt(rows);
		int pageNumber=Integer.parseInt(page);
		int fieldOrder=-1;
		String fieldSc="desc";
		
		parameterMap1.put("fieldList", fieldList);
		parameterMap1.put("tableName", tableName);
		parameterMap1.put("queryCondition", queryCondition);
		parameterMap1.put("orderList", orderList);
		parameterMap1.put("eachCount", eachCount);
		parameterMap1.put("pageNumber", pageNumber);
		parameterMap1.put("fieldOrder", fieldOrder);
		parameterMap1.put("fieldSc", fieldSc);
		
		@SuppressWarnings("rawtypes")
		Map parameterMap2 = new HashMap();//封装记录数
		String tableName2="user_msg";
		String queryCondition2="";
		@SuppressWarnings("unused")
		int eachCount2=1;
		parameterMap2.put("tableName", tableName2);
		parameterMap2.put("queryCondition", queryCondition2);
		parameterMap2.put("eachCount", eachCount);
		
		//Map map = userver.getUserMap(parameterMap1, parameterMap2);
		List<User> dataList =  userver.getUserList(parameterMap1);
		List<Page> pageList = userver.getUserCount(parameterMap2);
		int total_pages = 0;
		int records = 0;
		if(pageList.size()>0){
			total_pages=((Page)pageList.get(0)).getPageCount();
			records = ((Page)pageList.get(0)).getRecords();
		}
		
		int limit = Integer.parseInt(rows);
		int t_page = Integer.parseInt(page);
		

		// Object jsonArray = jsonUser.toArray();
		// String str = JSONObject.fromObject(jsonUser).toString();
		JSONObject jsonObject = new JSONObject();
		Object[] obj = dataList.toArray();
		String str = JsonUtil.toJson(obj);

		jsonObject.put("total", total_pages);
		jsonObject.put("currpage", t_page);
		jsonObject.put("records", records);
		jsonObject.put("rows", rows);
		jsonObject.put("invdata", str);
		/*
		 * 
		 * 手动拼接json字符串
		 str="{\"total\":"+total+",\"currpage\":"+page+",\"records\":"+records+",\"invdata\":"+str+"}";
		 * */
		 
		// System.out.println(str);
		//System.out.println(jsonObject.toString());
		// System.out.print(str1);
		out.write(jsonObject.toString());

		return null;
	}
	public ActionForward oper(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//System.out.println("***************************");
		String oper=request.getParameter("oper");
		if(oper.equals("add")){
			System.out.println("add*************");
			User user = new User();
			UserService uService = new UserService();
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String addr=request.getParameter("addr");
			user.setUsername(username);
			user.setPassword(password);
			user.setName(name);
			user.setPhone(phone);
			user.setAddr(addr);
			user.setEmail(email);
			//uService.addUser(user);
			
		}
		if(oper.equals("edit")){
			
			System.out.println("edit*************");
			User user = new User();
			UserService uService = new UserService();
			String id = request.getParameter("id");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String email=request.getParameter("email");
			String addr=request.getParameter("addr");
			//user.setId(Integer.parseInt(id));
			user.setUsername(username);
			user.setPassword(password);
			user.setName(name);
			user.setPhone(phone);
			user.setAddr(addr);
			user.setEmail(email);
			//uService.editUser(user);
		}
		if(oper.equals("del")){
			System.out.println("del*************");
		}
		
		
		return mapping.findForward("welcome");
	}
}
