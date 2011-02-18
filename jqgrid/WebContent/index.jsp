
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cn" lang="cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My First Grid</title>

<link rel="stylesheet" type="text/css" media="screen"
	href="css/ui-lightness/jquery-ui-1.8.9.custom.css" />
<link rel="stylesheet" type="text/css" media="screen"
	href="css/ui.jqgrid.css" />

<style>
html,body {
	margin: 0;
	padding: 0;
	font-size: 75%;
}
</style>

<script src="script/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="script/il8n/grid.locale-cn.js" type="text/javascript"></script>

<script src="script/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){      
  jQuery("#jsonmap").jqGrid({       
      url:'jsonlist.do',  
      //url:WEB_PATH+'/excludes/post.jsp',   
      datatype: 'json',    
      colNames:['编号','注册名称','密码','真实姓名','地址','电子邮件'],    
      colModel:[    
               {name:'id',index:'id', width:90,sorttype:"int",editable:true, editoptions:{readonly:true}},    
               {name:'username',index:'username', width:110,editable:true, editoptions:{readonly:true}},    
               {name:'password',index:'password', width:80,editable:true, editoptions:{readonly:true}},    
               {name:'name',index:'name', width:80,editable:true, editoptions:{readonly:true}},      
               {name:'addr',index:'addr', width:80,editable:true, editoptions:{readonly:true}},     
               {name:'email',index:'email', width:80,editable:true, editoptions:{readonly:true}}      
              ],    
         
    // imgpath: WEB_PATH+'/resources/javascript/plugins/jqgrid/css/smoothness/images',    
     rowNum:10,  
     rowList:[10,20,30],  
     pager: "#gridpager",  
            
     multiselect: true,
     subGrid: true,
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
     height: 220,
     width:800
     })/*.navGrid('#gridpager',  
                 {view:true,edit:true,add:true,del:false,multipleSearch:true},
                 {},
                 {},
                 {},
                 {},
                 {}
                
                
     )*/
     jQuery("#jsonmap").jqGrid('navGrid','#gridpager',{del:true,add:true,edit:true},{},{},{},{multipleSearch:true});
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

 });   
</script>

</head>
<body>
<table id="jsonmap"></table>
<div id="gridpager"></div>

</body>
</html>
