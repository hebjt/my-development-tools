//
function trim(str){
	return str.replace(/\s/g,"");
}

function trim2(str){
	return str.replace(/(\s)|(\\)|(\()|(\))|(\+)|(\*)/g,"");
}
//检查电话号码，规则：以数字开头和结尾，以“－”分隔的字符串。
function fIsPhone(telstr)
{
	if(!telstr) return false;
	if(trim(telstr)=="") return false;
	if(isNaN(trim(telstr).substring(0,1))) return false;
	if(isNaN(trim(telstr).substring(trim(telstr).length-1,trim(telstr).length))) return false;
	var list=telstr.split("-");
	for(i=0;i<list.length;i++)
	{
		if(isNaN(list[i])) return false;
		if(!((list[i]).indexOf(".")==-1)) return false;
	}
	if(trim(telstr).length<7) return false;
	return true;
}

function fIsMobile(argstr)
{
	if(!argstr) return false;
	if(argstr.length!=11) return false;
	if(trim(argstr).length!=11) return false;
	if(isNaN(argstr)) return false;
	if(parseFloat(argstr)<0) return false;
	if(parseInt(argstr)-parseFloat(argstr)!=0) return false;	
	return true
}

function testblank(str){ 	
	var myReg = /^[\s]+$/;
	return myReg.test(str);
}
function testpar(str){ 	
	var myReg = /[\(\)%_\'\"\\]/;
	return myReg.test(str);
}
function testnumchat(str){ 	
	var myReg = /^[a-zA-Z0-9 ]+$/;		
	return !myReg.test(str);
}

//身份证号判断
function testpersoncode(str){
	if(testnum(trim(str).substring(0,trim(str).length-1)))
		return false;
	if(trim(str).substring(trim(str).length-1,trim(str).length)!="x" && (trim(str).substring(trim(str).length-1,trim(str).length)!="X") && (testnum(trim(str).substring(trim(str).length-1),trim(str).length)))
	 return false;
	if(trim(str).length!="15" && trim(str).length!="18")
		return false;
	return true;
}

function testnum(str){ 	
	var myReg = /^(-|)[0-9]+$/;
	return myReg.test(str);
}
function testnumber(str){
	var flag=false;
	var myReg = /^[0-9]+$/;
	if(!myReg.test(str)){
		flag=true;
	}
//	if(str=="0"){
//		flag=true;
//	}
	return flag;
}

//是否是数字（0-9）
//可以是小数
function isNumber(value)
{
	var num=/[^0-9]/;
	var dot;
	var times=0;
	var a;
	var b;
	for(var loc=0;loc<value.length;loc++)
	{
		if(value.charAt(loc)=='.')
		{
			dot=loc;
			times++;
		}
	}
	if(times>1)
		return false;
	a=value.substring(0,dot);
	b=value.substring(dot+1,value.length);
	return !num.test(a)&&!num.test(b);
}

//字符串是否只有字母和数字（A-Z,a-z,0-9）
//数字不能包含小数点
function isLetOrNum(value)
{
	var letOrNum=/[^0-9A-z]/;
	return !letOrNum.test(value);
}

//是否有效字符，是返回ture；否则返回false
//有效字符为：数字或字母的集合
function bvalidstring(theStr){
	if(theStr.length==0) return false;
	for (var loc=0;loc<theStr.length;loc++)
	{
		if(((theStr.charAt(loc)<'0') || (theStr.charAt(loc)>'9'))
		   &&((theStr.charAt(loc)<'a')||(theStr.charAt(loc)>'z'))
		   &&((theStr.charAt(loc)<'A')||(theStr.charAt(loc)>'Z'))){
			return (false);
		}
	}
	return true;
}

//字符串里是否存在单引号
function single(value)
{
	var parttern=/[\']/;
	return parttern.test(value);
}

//字符串是否只有字母（A-Z,a-z）
function isLetter(value)
{
	var letter=/[^A-z]/;
	return !letter.test(value);
}

function testchar(str){	
	var myReg = /^[a-zA-Z]+$/;		
	return !myReg.test(str);
}
//验证email	
function checkEmail(str){
	var myReg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/
	return myReg.test(str);
}

//时间比较函数：
//Date1格式：2011-03-11 12:00
//Date2格式：2011-03-11 12:00
function funDatetimeCompare(Date1,Date2)
{
	var sign=0
	//把日期和时间分开
	var ds1=Date1.split(" ");
	var ds2=Date2.split(" ");
	//对日期处理
	var DateList1=ds1[0].split("-")
	var DateList2=ds2[0].split("-")
	//对时间处理
	var TimeList1=ds1[1].split(":")
	var TimeList2=ds2[1].split(":")

	DateTime1=new Date(DateList1[0],DateList1[1]-1,DateList1[2],TimeList1[0],TimeList1[1])
	DateTime2=new Date(DateList2[0],DateList2[1]-1,DateList2[2],TimeList2[0],TimeList2[1])
	var N=DateTime1-DateTime2
	return N

}


//
function funDateCompare(Date1,Time1,Date2,Time2)
{
	var sign=0
	var DateList1=Date1.split("-")
	var DateList2=Date2.split("-")
	if(Time1==""&&Time2=="")
	{
		sign=1
	}
	else
	{
		if(Time1!=""&&Time2!="")
		{
			sign=2
		}
	}
	if(sign==1)
	{
		DateTime1=new Date(DateList1[0],DateList1[1]-1,DateList1[2],0,0,0,0)
		DateTime2=new Date(DateList2[0],DateList2[1]-1,DateList2[2],0,0,0,0)
		var N=DateTime1-DateTime2
		return N
	}
	
	if(sign==2)
	{
		var TimeList1=Time1.split(":")
		var TimeList2=Time2.split(":")
		DateTime1=new Date(DateList1[0],DateList1[1]-1,DateList1[2],TimeList1[0],TimeList1[1])
		DateTime2=new Date(DateList2[0],DateList2[1]-1,DateList2[2],TimeList2[0],TimeList2[1])
		var N=DateTime1-DateTime2
		return N
	}
	if(sign==0)
	{
		alert("请检查日期比较函数时间参数要不全空要不全有")
	}
	
}

/*
==================================================================
功能：验证身份证号码是否有效
提示信息：未输入或输入身份证号不正确！
使用：isIDno(obj,string)
返回：bool
==================================================================
*/
function isIDno(obj,ShowMsg){
	var show = IfShow(ShowMsg);
	
	//aCity={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
	var aCity = "11,12,13,14,15,21,22,23,31,32,33,34,35,36,37,41,42,43,44,45,46,50,51,52,53,54,61,62,63,64,65,71,81,82,91"
	
	var iSum = 0;
	var info = "";
	var idCardLength = obj.value.length;

	if(!/^\d{17}(\d|x)$/i.test(obj.value)&&!/^\d{15}$/i.test(obj.value)){
		if (show) alert(ShowMsg);
		obj.focus();
		obj.select();
		return false;
	}

	//在后面的运算中x相当于数字10,所以转换成a
	obj.value = obj.value.replace(/x$/i,"a");
	
	var curCity = obj.value.substr(0,2);

	if(!(aCity.indexOf(curCity) >= 0) ){
		if (show) alert(ShowMsg);
		obj.focus();
		obj.select();
		return false;
	}

	if (idCardLength==18){
		sBirthday=obj.value.substr(6,4)+"-"+Number(obj.value.substr(10,2))+"-"+Number(obj.value.substr(12,2));
		var d = new Date(sBirthday.replace(/-/g,"/"))
		if(sBirthday!=(d.getFullYear()+"-"+ (d.getMonth()+1) + "-" + d.getDate())){
			if (show) 
			alert(ShowMsg);
			obj.focus();
			obj.select();
			return false;
		}
		for(var i = 17;i>=0;i--)
		iSum += (Math.pow(2,i) % 11) * parseInt(obj.value.charAt(17 - i),11);
		if(iSum%11!=1){
			if (show) 
			alert(ShowMsg);
			obj.focus();
			obj.select();
			return false;
		}

	}else if (idCardLength==15){
		sBirthday = "19" + obj.value.substr(6,2) + "-" + Number(obj.value.substr(8,2)) + "-" + Number(obj.value.substr(10,2));
		var d = new Date(sBirthday.replace(/-/g,"/"))
		var dd = d.getFullYear().toString() + "-" + (d.getMonth()+1) + "-" + d.getDate();
		if(sBirthday != dd){ 
			if (show) 
			alert(ShowMsg);
			obj.focus();
			obj.select();
			return false;
		}
	}
	obj.value = obj.value.replace(/a$/i,"x");
	return true; 
} 
function IfShow(ShowMsg){
	if (ShowMsg == "" ){
		return false;
	}else{
		return true;
	}
}
// 中间弹出新窗体
function wopen(pageURL,innerTitle, innerWidth, innerHeight)
{    
    var ScreenWidth  = screen.width;
    var ScreenHeight = screen.height;
    var StartX = (ScreenWidth - innerWidth) / 2;
    var StartY = (ScreenHeight - innerHeight) / 2;
    if(StartY>40)
    {
    	StartY=StartY-40;
    }
//    if((ScreenWidth/ScreenHeight)>(16 / 9))
//	{
//		StartX =  (ScreenWidth / 2-innerWidth) / 2;
//	}
	win =  window.open(pageURL, innerTitle, 'left='+ StartX + ', top='+ StartY + ', Width=' + innerWidth +', height=' + innerHeight 
    			+ ', resizable=yes, scrollbars=yes, status=yes, toolbar=no, menubar=no, location=no');
    winlist.push(win);
    return win;
}

//实现父窗体关闭子窗体同时关闭
var winlist = new Array();  
function closeAllWin(){
	for(var i= 0; i < winlist.length; i++)   
      if(!winlist[i].closed)   
           winlist[i].close();  
}

// 验证日期
function checkDate(date){
	var myReg = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;
	return myReg.test(date);
}

// 验证手机电话
function checkMob(str)
{
  var myReg=/^((13)|(15))(\d{9})$/;
  return myReg.test(str);
}

//验证时间（时，分，秒）
function checkTime(time){
	var p = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;  
	if(!p.test(time.substr(0,10))) return false;
	if (!/^\d\d:\d\d:\d\d$/.test(time.substr(11,21))) return false;
	d=time.substr(11,21).split(':');
	if (d[0]<0||d[0]>23) return false;
	if (d[1]<0||d[1]>59) return false;
	if (d[2]<0||d[2]>59) return false;
	return true;
}

//验证时间（时，分）
function checkTimes(time){
	var p = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;  
	if(!p.test(time.substr(0,10))) return false;
	if (!/^\d\d:\d\d$/.test(time.substr(11,19))) return false;
	d=time.substr(11,19).split(':');
	if (d[0]<0||d[0]>23) return false;
	if (d[1]<0||d[1]>59) return false;
	return true;
}

//验证年月日
function checkTimen(time){
	var p = /(([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8]))))|((([0-9]{2})(0[48]|[2468][048]|[13579][26])|((0[48]|[2468][048]|[3579][26])00))-02-29)/;  
	if(!p.test(time)) return false;
	return true;
}


// 验证用户名
function checkUser(str){
	var myReg = /^\w+$/;
	return myReg.test(str);
}
//全选复选框,obj:点击全选或全不选那个复选框对象，chk_name：要选中或不选中的复选框的名称
function chkAll(obj,chk_name){
	var chkname=chk_name?chk_name:"chk_record";
	var chks=document.getElementsByName(chkname);
	var flag=obj.checked;
	for(var i=0;i<chks.length;i++){
		chks[i].checked=flag;
	}
}
//检查是否有复选框选中，chk_name：要检查的复选框的名称
function checkChk(chk_name){
	var chkname=chk_name?chk_name:"chk_record";
	var chks=document.getElementsByName(chkname);
	for(var i=0;i<chks.length;i++){
		if(chks[i].checked){
			return true;
		}
	}
	return false;
	
}
function checkRate(input)    
{    
    
    var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为整形数字      
      
     if (!re.test(input.value))    
    {    
        return false;    
    }    
}   