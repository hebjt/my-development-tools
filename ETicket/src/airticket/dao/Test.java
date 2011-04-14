package airticket.dao;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.axis.message.MessageElement;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import util.ETicketException;
import webservicesclient.GetFlightDataSetResponseGetFlightDataSetResult;
import webservicesclient._ServiceSoapProxy;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		_ServiceSoapProxy serviceSoapProxy = new _ServiceSoapProxy();
		ArrayList<HashMap> ticketsList = new ArrayList<HashMap>();

		// _ServiceSoapProxy proxy = new _ServiceSoapProxy();
		GetFlightDataSetResponseGetFlightDataSetResult result = null;
		try {
			result = serviceSoapProxy.getFlightDataSet("test1", "12345AB",
					"HGH", "DLC", "2008-11-30", "00:00", "", true, true);
			// .getFlightDataSet(name, pwd, fromcity, tocity, airdate,
			// airtime, airco, isdirect, ishideshared);
		} catch (RemoteException e) {
			// TODO 自动生成 catch 块
			// e.printStackTrace();
			throw new ETicketException("查询机票机票异常！--TBI接口getFlightDataSet方法异常！",
					e);
		}

		// getFlightDataSet接口返回null时候,直接返回
		if (result == null) {
			return;
		}
		MessageElement root = result.get_any()[1];

		System.out.println(root.toString());
		NodeList diffgram = root.getChildNodes();
		NodeList data = null;
		NodeList flight = null;
		Node flightNode = null;

		// 进行xml分析处理时候返回null,则直接返回
		if (diffgram == null) {
			return;
		}
		for (int i = 0; i < diffgram.getLength(); ++i) {
			data = diffgram.item(i).getChildNodes();
			for (int j = 0; j < data.getLength(); ++j) {
				flight = data.item(j).getChildNodes();

				// 每条记录存放在一个新的Map中
				HashMap<String, String> hashMap = new HashMap<String, String>();

				// 无航班信息时返回长度为1，此时则不对返回信息进行处理
				if (flight.getLength() <= 1) {
					return;
				}

				for (int k = 1; k <= flight.getLength(); ++k) {
					flightNode = flight.item(k);
					if (flightNode != null) {

						// 选择一个过期时间测试时候
						// flightNode.getChildNodes().item(0).getNodeValue()会抛出异常

						System.out.println(flightNode.getNodeName()
								+ ":"
								+ flightNode.getChildNodes().item(0)
										.getNodeValue());
//						System.out.println(flightNode.getChildNodes()+"======================");
//						System.out.println(flightNode.getChildNodes().getLength()+"======================");
						System.out.println("================"+k+"=============");
						hashMap.put(flightNode.getNodeName(), flightNode
								.getChildNodes().item(0).getNodeValue());
					}

				}

				// 把每个Map放到存放到List中去
				ticketsList.add(hashMap);
				// 分割线
				System.out
						.println("################################################");
			}
		}

		System.out.println("共查询 " + data.getLength() + " 个航班!");

		return;

	}

}
