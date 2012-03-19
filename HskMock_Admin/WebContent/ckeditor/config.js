/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.filebrowserBrowseUrl='../browse.action?paper_id='+paper_id;
	config.filebrowserUploadUrl = '../upload.action?paper_id='+paper_id;
	config.filebrowserFlashBrowseUrl = 'browse.action?type=Flash';
	config.filebrowserFlashUploadUrl = '../upload.action?type=Flash';
	config.filebrowserImageBrowseUrl = '../browse.action?type=Images&paper_id='+paper_id;
	config.filebrowserImageUploadUrl = '../upload.action?type=Images&paper_id='+paper_id;
	/*
	config.toolbar = [['Bold','Italic','Underline','Strike','FontSize','NumberedList','BulletedList','Outdent','Indent','JustifyLeft',

	                   'JustifyCenter','JustifyRight','Link','Unlink','TextColor','BGColor','Image','Flash','SpecialChar','Smiley','Table',

	                   'RemoveFormat','Source']];
	*/
	config.toolbar='Full';
	config.width = 600;                   //初始化时的宽度
	//config.skin='kama';                    //使用的皮肤
	config.tabSpaces = 4;               
	config.resize_maxWidth = 600;             //如果设置了编辑器可以拖拽 这是可以移动的最大宽度
	config.toolbarCanCollapse = true;              //工具栏可以隐藏
	//config.toolbarLocation = 'bottom';              //可选：设置工具栏在整个编辑器的底部bottom
	config.resize_minWidth = 600;                   //如果设置了编辑器可以拖拽 这是可以移动的最小宽度
	config.resize_enabled = false;                  //如果设置了编辑器可以拖拽
	config.enterMode=CKEDITOR.ENTER_BR;             //换行
    config.shiftEnterMode=CKEDITOR.ENTER_P;         //段落
    config.jqueryOverrideVal = true;                //textarea赋值取值问题 ，对jquery做了扩展
	
	                  
};
CKEDITOR.on('instanceReady', function( ev )
{
    ev.editor.dataProcessor.writer.selfClosingEnd = '>';
    ev.editor.dataProcessor.writer.setRules( 'p',  
            {  
                indent : false,  
                breakBeforeOpen : true,  
                breakAfterOpen : false,  
                breakBeforeClose : false,  
                breakAfterClose : true  
            }); 
});
	    
