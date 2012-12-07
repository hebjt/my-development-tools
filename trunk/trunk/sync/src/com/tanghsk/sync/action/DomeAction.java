package com.tanghsk.sync.action;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tanghsk.sync.util.XmlParseUtil;
@Controller
@RequestMapping("/pay/**")
public class DomeAction {
	protected static Logger logger = Logger.getLogger(DomeAction.class);
	//ƥ������   http://localhost:8080/TangPay/pay/validation/test/1101/2012-11-20������
	@RequestMapping(value="validation/{modeId}/{userId}/{date}")
	public String index(@PathVariable(value="modeId") String mid,
						@PathVariable(value="userId") String uid,
						@PathVariable(value="date") String date,
						Model model){
		logger.info("���ݵ��û�����"+uid);
		logger.info("���ݵ����ڲ���"+date);
		XmlParseUtil xmlparse = new XmlParseUtil();
		logger.info(xmlparse.createDocument().asXML());
		return "success";
	}
}
