package cuijingtao.grid.action;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

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

		int records = userver.getCount(); // 记录总数

		String page = request.getParameter("page")==null?"1":request.getParameter("page"); // 取得当前页数,注意这是jqgrid自身的参数
		String rows = request.getParameter("rows")==null?"10":request.getParameter("rows"); // 取得每页显示行数，,注意这是jqgrid自身的参数

		int total_pages = 0;
		int limit = Integer.parseInt(rows);
		int t_page = Integer.parseInt(page);

		
		// 计算分页参数
		if (records > 0) {
			total_pages = (int) Math.ceil(records / limit) + 1;
		}
		if (t_page > total_pages) {
			t_page = total_pages;
		}
		int start = limit * t_page - limit;
		user.setCurrPage(start);
		user.setPageSize(limit);

		Map map = userver.getAllUser(user);

		List jsonUser = (List) map.get("ResultSet");

		// Object jsonArray = jsonUser.toArray();
		// String str = JSONObject.fromObject(jsonUser).toString();
		JSONObject jsonObject = new JSONObject();
		Object[] obj = jsonUser.toArray();
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
			uService.addUser(user);
			
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
			user.setId(Integer.parseInt(id));
			user.setUsername(username);
			user.setPassword(password);
			user.setName(name);
			user.setPhone(phone);
			user.setAddr(addr);
			user.setEmail(email);
			uService.editUser(user);
		}
		if(oper.equals("del")){
			System.out.println("del*************");
		}
		
		
		return mapping.findForward("welcome");
	}
}
