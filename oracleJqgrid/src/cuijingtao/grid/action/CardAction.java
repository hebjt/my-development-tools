/**
 * Administrator
 * 2011-2-22
 */
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

import cuijingtao.grid.domain.CardInfo;
import cuijingtao.grid.services.UserService;
import cuijingtao.util.JsonUtil;

/**
 * @author Administrator
 *
 */
public class CardAction extends DispatchAction {

	public ActionForward exec(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		UserService userver = new UserService();
		CardInfo card = new CardInfo();

		
		//String num = map.get("RowCount").toString();
		
		//int num = userver.getCount();

		

		String page = request.getParameter("page"); // 取得当前页数,注意这是jqgrid自身的参数
		String rows = request.getParameter("rows"); // 取得每页显示行数，,注意这是jqgrid自身的参数
		String sort = request.getParameter("sidx");//排序字段
		String order = request.getParameter("sord");//排序方式
		
		String pid = request.getParameter("pid");
		card.setParentid(Integer.parseInt(pid));
		int records = userver.getCardCount(card); // 记录总数
		//System.out.println("***************"+order);
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
		
		card.setCurrPage(start);
		card.setPageSize(limit);
		card.setParentid(Integer.parseInt(pid));
		//user.setOrder(order);
		//user.setSort(sort);

		Map map = userver.getCardInfo(card);

		List jsonCard = (List) map.get("ResultSet");

		// Object jsonArray = jsonUser.toArray();
		// String str = JSONObject.fromObject(jsonUser).toString();
		JSONObject jsonObject = new JSONObject();
		Object[] obj = jsonCard.toArray();
		String str = JsonUtil.toJson(obj);

		jsonObject.put("total", total_pages);
		jsonObject.put("currpage", t_page);
		jsonObject.put("records", records);
		jsonObject.put("rows", rows);
		jsonObject.put("subgrid", str);
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
	public ActionForward cellEdit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String rid = request.getParameter("rid");
		String id = request.getParameter("id");
		String cardstate = request.getParameter("cardstate");
		String cardno = request.getParameter("cardno");
		String cardname = request.getParameter("cardname");
		String cardfrom = request.getParameter("cardfrom");
		
		System.out.println("rid的值是****************"+rid);
		System.out.println("id的值是*****************"+id);
		System.out.println("修改cardstate的值是*****************"+cardstate);
		System.out.println("修改cardno的值是*****************"+cardno);
		System.out.println("修改cardname的值是*****************"+cardname);
		System.out.println("修改cardfrom的值是*****************"+cardfrom);
		
		return null;
	}

}
