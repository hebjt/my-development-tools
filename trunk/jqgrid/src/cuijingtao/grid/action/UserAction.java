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
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		UserService userver = new UserService();
		User user = new User();
		Map map = userver.getAllUser(user);
		List jsonUser = (List)map.get("ResultSet");
		String num = map.get("RowCount").toString();
		//Object jsonArray = jsonUser.toArray();
		//String str = JSONObject.fromObject(jsonUser).toString();
		Object[] obj = jsonUser.toArray();
		String str = JsonUtil.toJson(obj);
		int total = Integer.parseInt(num)/10;
		int records = Integer.parseInt(num);
		str="{\"total\":"+total+",\"currpage\":"+1+",\"records\":"+records+",\"invdata\":"+str+"}";
		//String str1="{\"dataRows\":"+str+",\"page\":1,\"rows\":10,\"total\":3}"; 
		System.out.println(str);
		//System.out.print(str1);
		out.write(str); 
		
		return null;
	}
}
