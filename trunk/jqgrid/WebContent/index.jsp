
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cn" lang="cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My First Grid</title>
<link rel="stylesheet" type="text/css" media="screen" href="css/jqueryui/ui.multiselect.css" />
	
<link rel="stylesheet" type="text/css" media="screen" href="css/ui-bl-jquery/jquery-ui-1.8.9.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />

<style>
html,body {
	margin: 0;
	padding: 0;
	font-size: 75%;
}
</style>

<script src="script/jquery/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="script/jqueryui/jquery-ui-1.8.9.custom.min.js" type="text/javascript"></script>
<script src="script/jqueryui/jquery.ui.sortable.min.js" type="text/javascript"></script>
<script src="script/jqueryui/jquery.ui.core.min.js" type="text/javascript"></script>
<script src="script/jqueryui/jquery.ui.dialog.min.js" type="text/javascript"></script>
<script src="script/jqueryui/ui.multiselect.js" type="text/javascript"></script>

<script src="script/il8n/grid.locale-cn.js" type="text/javascript"></script>
<script src="script/jqgrid/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	var lastsel2; 
  jQuery("#jsonmap").jqGrid({       
      url:'jsonlist.do?method=exec',  
      //url:WEB_PATH+'/excludes/post.jsp',   
      datatype: 'json',    
      colNames:['编号','注册名称','密码','真实姓名','地址','电子邮件','操作'],    
      colModel:[    
               {name:'id',index:'id', width:90,sorttype:"int",editable:false, editoptions:{readonly:false},formatter:formatid},    
               {name:'username',index:'username', width:110,editable:true, editoptions:{readonly:false}},    
               {name:'password',index:'password', width:80,editable:true, editoptions:{readonly:false}},    
               {name:'name',index:'name', width:80,editable:true, editoptions:{readonly:false}},
                    
               {name:'addr',index:'addr', width:80,editable:true, editoptions:{readonly:false}},    
               {name:'email',index:'email', width:80,editable:true, editoptions:{readonly:false}},
               {name:'operate',index:'opr', width:80,formatter:hrefValue}      
              ],    
         
    // imgpath: WEB_PATH+'/resources/javascript/plugins/jqgrid/css/smoothness/images',    
     rowNum:10,  
     rowList:[10,20,30],  
     pager: "#gridpager",  
     onSelectRow: function(id){
    	 //alert(id);
     },
            
     multiselect: true,
     subGrid: true,//开启子表格支持
     subGridRowExpanded: function(subgrid_id, row_id) {
    	var lastsel2;
    	 var subgrid_table_id;
    	 var rowid;
    	 subgrid_table_id = subgrid_id + "_t";   // (3)根据subgrid_id定义对应的子表格的table的id  
    	                
    	 var subgrid_pager_id;  
    	 subgrid_pager_id = subgrid_id + "_pgr";  // (4)根据subgrid_id定义对应的子表格的pager的id  
    	                
    	              // (5)动态添加子报表的table和pager  
    	 $("#" + subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+subgrid_pager_id+"' class='scroll'></div>");  
    	                
    	              // (6)创建jqGrid对象  
    	// var id = $("#"+subgrid_table_id).jqGrid("getGridParam", "selrow");
    	              
    	 $("#" + subgrid_table_id).jqGrid({  
    	      url: "cardlist.do?method=exec&pid="+row_id,  // (7)子表格数据对应的url，注意传入的contact.id参数  
    	      datatype: "json",  
    	      colNames: ['信用卡编码','信用卡名称','发卡行','操作'],  
    	      colModel: [  
    	                 {name:"cardno",index:"cardno",width:130,editable:true,editoptions:{readonly:true},key:true},  
    	                 //若是页面没有id字段，可以key=true设置成id,jqgrid会把cardno默认为id,而页面保持不变，方便开发
    	                 {name:"cardname",index:"cardname",width:80,align:"right",editable:true,editoptions:{readonly:false}},  
    	                 {name:"cardfrom",index:"cardfrom",width:80,align:"right",editable:true,editoptions:{readonly:false}},
    	                 {name:"cardstate",index:"cardstate",width:80,editable:true,edittype:"select",editoptions:{value:"0:下架;1:上架"}}
    	                ],  
    	      jsonReader: {   // (8)针对子表格的jsonReader设置  
    	                   root:"subgrid",
    	                   page:"currpage",
    	                   total:"total",
    	                   records: "records",
    	                   repeatitems : false  
    	                  }, 
    	       
    	    	onCellSelect:function(rowid,iCol,cellcontent,e){
    	    		//alert(iCol);
    	    		rowid=rowid;
    	    		rowdata=cellcontent;
    	    		//alert(rowdata);
    	    	},
    	       afterEditCell: function (id,name,val,iRow,iCol){
    	    	   //alert(val);
    	       },
    	       afterSaveCell : function(rowid,name,val,iRow,iCol) {
    	    	   //alert(val);
    	    	   
    	    	   
    	    	   
    	    	   
    	       },
    	       /*选中一行修改
    	      onSelectRow: function(id){
    	      //alert(id);
      			if(id && id!==lastsel2){
        			jQuery("#"+subgrid_table_id).restoreRow(lastsel2);
        			jQuery("#"+subgrid_table_id).editRow(id,true);
          			lastsel2=id;
      			}
    		 },
				*/
    	       cellEdit:true,
    	       cellurl:'cardlist.do?method=cellEdit&rid='+row_id,
    	       prmNames: {search: "search"},  
    	       pager: subgrid_pager_id,  
    	       viewrecords: true,  
    	       height: "100%",  
    	       rowNum: 5  
    	 });  
    	 jQuery("#"+subgrid_table_id).jqGrid('navGrid','#'+subgrid_pager_id,{del:true,add:true,edit:true},{},{},{},{multipleSearch:true});
    	 
    	 
     },
     sortname: 'id',    
     viewrecords: true,    
     sortorder: "desc",    
     jsonReader: {    
    	 root:"invdata",  
    	 page: "currpage",  
    	 total: "total",  
    	 records: "records",  
     	 repeatitems : false    
      	},    
     caption: "用户信息列表",     
     prmNames:{search:"search"},
     height: 220,
     width:800,
     editurl:'jsonlist.do?method=oper',
     afterShowForm:function(formid){
     	alert("1111111");
     
     },
     beforeShowForm:function(formid){
     	alert("22222");
     }
     });
     jQuery("#jsonmap").jqGrid('navGrid','#gridpager',{del:true,add:true,edit:true},{},{},{},{multipleSearch:true});
     /*
     jQuery("#jsonmap").jqGrid('navButtonAdd','#gridpager',{ 
    	 caption: "Columns", 
    	 title: "Reorder Columns", 
    	 onClickButton : function (){ 
    		 jQuery("#jsonmap").jqGrid('columnChooser');}
     			//alert("111");}
      });
    */
     function processAddEdit(response){
	  var success =true;
	  var message ="";
	  var json = eval('('+ response.responseText + ')');
	  /*
	  if(json.errors){
	     success =false;
	     for(i=0;i < json.errors.length;i++){
	      message +=json.errors[i];
	     }
	  }
	  */
	  if(!json.success){
	     success =json.success;
	     message =json.errors;
	  }
	  var new_id ="1";
	  return [success,message,new_id];
	  }
    $("#ed").click(function(){
    	jQuery("#jsonmap").jqGrid('columnChooser');
    });

    function hrefValue(cellvalue, options, rowObject){
    //alert(rowObject.id);
    	cellvalue="操作";
    	//return cellvalue;
    	return "<a href='#' onclick='viewHeader();return false;' >" +cellvalue+"</a>";
    }
    function formatid(cellvalue, options, rowObject){
    	//alert(options);
    	cellvalue="#"+cellvalue;
    	return cellvalue;
    	//return "<a href='#' onclick='viewHeader();return false;' >" +cellvalue+"</a>";
    }
    
	function viewHeader(){
    	alert("11111111");
    
    }
    $("#hid").click(function(){
    	//alert("1111");
    	//jQuery.jgrid.setGridParam();
    	jQuery("#jsonmap").setGridParam({}).hideCol("operate").trigger("reloadGrid");
    	
    
    });

 });   
</script>

</head>
<body>
<table id="jsonmap"></table>
<div id="gridpager"></div>
<input type="button" id="ed" value="edit clum" /> 
<input type="button" id="hid" value="hidden clum" /> 
</body>
</html>
