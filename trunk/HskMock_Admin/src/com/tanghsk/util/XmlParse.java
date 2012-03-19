package com.tanghsk.util;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class XmlParse {
	 public Document createDocument() {
	        Document document = DocumentHelper.createDocument();
	        Element root = document.addElement( "papers" );

	        Element paper = root.addElement( "paper" )
	        					.addAttribute( "id", "paperid" );
	        Element listen = paper.addElement( "listen" )
	        						.addAttribute( "id", "structId" );
	        //部分
	        Element part = listen.addElement("part");
	        Element name = part.addElement("name")
	        					.addAttribute("id", "structId")
	        					.addText("第一部分");
	        Element partcount = part.addElement("partcount")
	        						.addText("20");
	        //小节
	        Element subpart = part.addElement("subpart")
	        						.addAttribute("id", "structId");	
	        Element subname = subpart.addElement("subname")
	        					  	.addText("1-20.请选择正确答案");
	        Element questions =  subpart.addElement("questions");
	        Element question = questions.addElement("question")
	        							.addAttribute("id", "quesid");
	        Element title = question.addElement("title")
	        		.addText("1");						
	        Element audiourl = question.addElement("audiourl")
	        							.addText("http://192.138.0.237/upload/paper_id/1.wma");
	        Element questype = question.addElement("questype")
	        							.addText("02");
	        Element options = question.addElement("options");
	        
	        Element option1 = options.addElement("option")
	        							.addAttribute("id", "optid")
	        							.addText("A.111111");
	        		
	        Element option2 = options.addElement("option")
	        						.addAttribute("id", "optid")
	        						.addText("B.333");

	        return document;
	 }
	 public Document createDocument(String paper_id){
		 Document document = DocumentHelper.createDocument();
	     Element root = document.addElement( "paper")
	    		 				.addAttribute("id", paper_id);
	     
		 return document;
	 }
}
