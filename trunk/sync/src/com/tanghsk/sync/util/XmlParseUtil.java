package com.tanghsk.sync.util;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class XmlParseUtil {
	public Document createDocument() {
		Document document = DocumentHelper.createDocument();
		Element root = document.addElement("papers");

		Element paper = root.addElement("paper").addAttribute("id", "paperid");
		Element listen = paper.addElement("listen").addAttribute("id", "structId");
		// ����
		Element part = listen.addElement("part");
		Element name = part.addElement("name").addAttribute("id", "structId").addText("��һ����");
		Element partcount = part.addElement("partcount").addText("20");
		// С��
		Element subpart = part.addElement("subpart").addAttribute("id", "structId");
		Element subname = subpart.addElement("subname").addText("1-20.��ѡ����ȷ�𰸡�");
		Element questions = subpart.addElement("questions");
		Element question = questions.addElement("question").addAttribute("id", "quesid");
		Element title = question.addElement("title").addText("1");
		Element audiourl = question.addElement("audiourl").addText("http://192.138.0.237/upload/paper_id/1.wma");
		Element questype = question.addElement("questype").addText("02");
		Element options = question.addElement("options");

		Element option1 = options.addElement("option").addAttribute("id", "optid").addText("A.111111");

		Element option2 = options.addElement("option").addAttribute("id", "optid").addText("B.333");

		return document;
	}
}
