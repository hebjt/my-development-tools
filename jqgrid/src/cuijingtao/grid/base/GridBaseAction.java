/**
 * Administrator
 * 2011-2-22
 */
package cuijingtao.grid.base;

import java.util.Map;

import org.apache.struts.actions.DispatchAction;

/**
 * @author Administrator
 *
 */
public abstract class GridBaseAction extends DispatchAction {
	private String page;//取得当前页数,注意这是jqgrid自身的参数
	private String rows;//取得每页显示行数
	private String sort;//排序字段名称
	private String order;//排序方式
	private String search;//搜索
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public abstract int getResultSize();
	public abstract Map getResultMap();

}
