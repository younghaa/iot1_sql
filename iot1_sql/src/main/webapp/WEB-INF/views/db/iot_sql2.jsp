<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ page session="false" %> 
<c:set var="dbTreeJsp" value="/WEB-INF/views/db/db_treeview.jsp" />
<c:set var="tableInfoJsp" value="/WEB-INF/views/db/table_info.jsp" />
<c:set var="tabJsp" value="/WEB-INF/views/db/tab.jsp" />
<c:url var="tableInfoUrl" value="/db/table/info" />

<title>IOT SQL</title>
</head>
<script>
var treeview;


function onBound(){
	if(!treeview){
		treeview = $('#treeview').data('kendoTreeView');	
	}
	
}
function test(a){
	alert(a);
}
$(document).ready(function(){
	
	var cnt = 0;
	$( "#query" ).keydown(function(e) {
		var keyCode = e.keyCode || e.which;
		if(keyCode==120){
			cnt++;
			console.log(cnt);
			var sql;
			var sqls;
			if(e.ctrlKey && keyCode==120 && e.shiftKey){
				sql = this.value;
				var cursor = this.selectionStart;
				var startSql = sql.substr(0,cursor);
				var startSap = startSql.lastIndexOf(";")
				startSql = startSql.substr(startSap+1);
				var endSql = sql.substr(cursor);
				var endSap = endSql.indexOf(";");
				if(endSap==-1) {
					endSap=sql.length;
				}
				endSql = endSql.substr(0,endSap);
				sql = startSql + endSql;
			}else if(e.ctrlKey && keyCode==120){
				sql = this.value.substr(this.selectionStart, this.selectionEnd - this.selectionStart);
			}else if(keyCode==120){
				sql = this.value;
			}
			if(sql){
				sql = sql.trim();
				sqls = sql.split(";");
				if(sqls.length==1){
					var au = new AjaxUtil("db/run/sql");
					var param = {};
					param["sql"] = sql;
					au.param = JSON.stringify(param);
					au.setCallbackSuccess(callbackSql);
					au.send();
					return;
				}else if(sqls){
					
					return;
				}
			}
			
		}
	});
})
function callbackSql(result){
	var key = result.key;
	var obj = result[key];
	var gridData = obj.list;
	
	try{
		$('#resultGrid').kendoGrid('destroy').empty();
	}catch(e){
		
	}
	var gridParam = {
	  		dataSource: {
	    	      data: gridData,
	    	      pageSize: 20
	    	    },
	    	    editable: false,
	    	    sortable: true,
	    	    pageable:true	    
	  	}
  	var grid = $("#resultGrid").kendoGrid(gridParam);
}
function treeSelect(){
	window.selectedNode = treeview.select();
	var data = treeview.dataItem(window.selectedNode);
	if(data.database && !data.hasChildren){
		var au = new AjaxUtil("db/table/list");
		var param = {};
		param["database"] = data.database;
		au.param = JSON.stringify(param);
		au.setCallbackSuccess(callbackForTreeItem2);
		au.send();
	}else if(data.tableName){
		var ki = new KendoItem(treeview, $("#tableInfoGrid"), "${tableInfoUrl}","tableName");
		ki.send();
	}
}

function callbackForTreeItem2(result){
	if(result.error){
		alert(result.error);
		return;
	}
	for(var i=0, max=result.tableList.length;i<max;i++){
		var table = result.tableList[i];
		treeview.append({
			tableName: table.tableName
        }, treeview.select());
	}
}

function callbackForTreeItem(result){
	if(result.error){
		alert(result.error);
		return;
	}
	for(var i=0, max=result.databaseList.length;i<max;i++){
		var database = result.databaseList[i];
		treeview.append({
			database: database.database
        }, treeview.select());
	}
	$("#btnConnect").text("접속해제");
}
function toolbarEvent(e){
	if($("#btnConnect").text()=="접속해제"){
		treeview.dataSource.read();
		$("#btnConnect").text("접속");
		return;
	}
	var data = treeview.dataItem(window.selectedNode);
	if(data && data.diNum){
		//$('#treeview>.k-group>.k-item>.k-group').remove();
		//treeview.dataSource.read();
		var au = new AjaxUtil("db/connecte");
		var param = {};
		param["diNum"] = data.diNum;
		au.param = JSON.stringify(param);
		au.setCallbackSuccess(callbackForTreeItem);
		au.send();
	}else{
		alert("접속하실 데이터베이스를 선택해주세요");
	}
}

function changeMiddlePane(e){
	console.log(e);
}
</script>
<body>
<c:import url="${menuUrl}"/> 
<kendo:splitter name="vertical" orientation="vertical">
    <kendo:splitter-panes>
        <kendo:splitter-pane id="top-pane" collapsible="false">
            <kendo:splitter-pane-content>
                <kendo:splitter name="horizontal" style="height: 100%; width: 100%;">
				    <kendo:splitter-panes>
				        <kendo:splitter-pane id="left-pane" collapsible="true" size="220px">
				            <kendo:splitter-pane-content >
				                <div class="pane-content">
				                	<c:import url="${dbTreeJsp}"/>
                                </div>
				            </kendo:splitter-pane-content>
				        </kendo:splitter-pane>
				        <kendo:splitter-pane id="center-pane" collapsible="false">
				            <kendo:splitter-pane-content>
								<kendo:splitter layoutChange="changeMiddlePane" name="vertical1" orientation="vertical" style="height: 100%; width: 100%;">
				   					<kendo:splitter-panes>
		       							<kendo:splitter-pane id="top-pane" collapsible="false" >
							                <div class="pane-content">
						                		<c:import url="${tabJsp }"/>
						                	</div>
		       							</kendo:splitter-pane>
		       							<kendo:splitter-pane id="middle-pane" collapsible="true" >
						                	<div id="resultGrid"></div>
		       							</kendo:splitter-pane>
	       							</kendo:splitter-panes>
       							</kendo:splitter>
				            </kendo:splitter-pane-content>
				        </kendo:splitter-pane>
				    </kendo:splitter-panes>
				</kendo:splitter>
            </kendo:splitter-pane-content>
        </kendo:splitter-pane>
        <kendo:splitter-pane id="middle-pane" collapsible="false" size="100px">
            <kendo:splitter-pane-content>
                <div class="pane-content">
	                <h3>Outer splitter / middle pane</h3>
	                <p>Resizable only.</p>
                </div>
            </kendo:splitter-pane-content>
        </kendo:splitter-pane>
        <kendo:splitter-pane id="bottom-pane" collapsible="false" resizable="false" size="20px" scrollable="false">
            <kendo:splitter-pane-content>
	                MySql Tool For Web
            </kendo:splitter-pane-content>
        </kendo:splitter-pane>
    </kendo:splitter-panes>
</kendo:splitter>
</body>
<style>	
	@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	*{margin:0; padding:0; border:none;}
		
	#tabstrip-parent,
    #tabstrip {
      height: 100%;
      margin: 0;
      padding: 0;
      border-width: 0;
    }
	body{font-family: 'Jeju Gothic', serif;}
	nav{
		position:relative;
		width:100%;
		height:54px;
		border-bottom:0;
	}	
	nav.navbar{
		margin-bottom:0;		
	}
	.navbar-nav{
		float:right;	
	}	
	.container{
		width:100%;
		height:54px;
		background:linear-gradient(0deg,#cb1436,#ee1745);
		border-bottom:2px dashed #fff;		
	}		
	#navbar ul li:last-child{
		position:absolute;
		right:0;
	}
	#navbar ul li a{
		font-size:15px;
		color:#fff;
	}
	#navbar ul li a:hover{
		transition:0.3s;
		color:#ee1745;	
		background-color:#333;
		border-radius:15px;	
	}
	.k-block, .k-content, .k-dropdown .k-input, .k-popup, .k-toolbar, .k-widget{
		color:#fff;
	}
	.k-autocomplete, .k-block, .k-button-group .k-tool, .k-calendar th, .k-content, .k-dropdown-wrap, .k-dropzone-active, .k-editable-area, .k-editor-dialog .k-tabstrip-items, .k-filter-row>th, .k-footer-template td, .k-grid td, .k-grid td.k-state-selected, .k-grid-content-locked, .k-grid-footer, .k-grid-footer-locked, .k-grid-footer-wrap, .k-grid-header, .k-grid-header-locked, .k-grid-header-wrap, .k-group, .k-group-footer td, .k-grouping-header, .k-grouping-header .k-group-indicator, .k-header, .k-input, .k-pager-refresh, .k-pager-wrap, .k-pager-wrap .k-link, .k-panel>.k-item>.k-link, .k-panelbar .k-content, .k-panelbar .k-panel, .k-panelbar>.k-item>.k-link, .k-popup.k-align .k-list .k-item:last-child, .k-separator, .k-slider-track, .k-splitbar, .k-state-default, .k-state-default .k-select, .k-state-disabled, .k-textbox, .k-textbox>input, .k-tiles, .k-toolbar, .k-tooltip, .k-treemap-tile, .k-upload-files, .k-widget{
		border-color:#cb1436;
	}
	.k-active-filter, .k-state-active, .k-state-active:hover, .k-tabstrip .k-state-active{
		background-color:#cb1436;
	}
	.k-block, .k-button, .k-draghandle, .k-grid-header, .k-grouping-header, .k-header, .k-pager-wrap, .k-toolbar, .k-treemap-tile, html .km-pane-wrapper .k-header{
		background-color:#ee1745;
	}
	.k-grid-content .k-auto-scrollable{
		background-color:#333;
	}
	.k-autocomplete, .k-button, .k-draghandle, .k-dropdown-wrap, .k-grid-header, .k-grouping-header, .k-header, .k-numeric-wrap, .k-pager-wrap, .k-panelbar .k-tabstrip-items .k-item, .k-picker-wrap, .k-progressbar, .k-state-highlight, .k-tabstrip-items .k-item, .k-textbox, .k-toolbar, .km-pane-wrapper>.km-pane>.km-view>.km-content{
		background-image:none,-webkit-gradient(linear,left top,left bottom,from(#cb1436),to(rgba(255,255,255,0)));
	}
	.k-button{
		color:#fff;
	}
	.k-grid-header .k-header>.k-link, .k-header, .k-treemap-title{
		color:#fff;
	}
	.k-active-filter, .k-state-active, .k-state-active:hover, .k-tabstrip .k-state-active{
		color:#fff;
	}
	.k-panelbar>li.k-state-default>.k-link, .k-tabstrip-items .k-state-default .k-link{
		color:#fff;
	}
	.k-active-filter, .k-state-active, .k-state-active:hover, .k-tabstrip .k-state-active{
		border-color:#fff;
	}
	.navbar-brand {
		background:url("${imgUrl}home_3.png")no-repeat center;
		text-indent:-9999px;
		width:50px;		
	}
	.navbar-brand:hover{
		background:url("${imgUrl}home_4.png")no-repeat center;				
	}
	p{
		width:0;
		height:0;
	}	
	tr{
		background-color:#333;
		border-bottom:1px solid #fff;
	}
	tr.k-alt{
		background-color:#393939;
	}
    #vertical {
    	position:relative;
    	width:100%;
        height: 893px;
        top:31px;
    }
    .pane-content{
    	background-color:#333;
    	color:#fff;
    }
    #middle-pane { 
        color: #000; background-color: #333; 
    }

    #bottom-pane { 
        color: #000; background-color: #333; 
    }
    #left-pane{
    	width:233px;
    }
    #left-pane .pane-content {
    	width:100%; 
    	border:none;
    }
    #toolbar {
        width:100%;
        background-color:#ee1745;        
    }
    .k-toolbar{
    	background-image:none,-webkit-gradient(linear,left top,left bottom,from(#cb1436),to(rgba(255,255,255,0)));
    }
    .k-button.k-state-active:hover, .k-button:active:hover{
    	background-color:#cb1436;
    	box-shadow:inset 0 0 3px 1px #fff;
    }
    .k-button:focus:active:not(.k-state-disabled):not([disabled]){
    	background-color:#cb1436;
    	box-shadow:inset 0 0 3px 1px #cb1436;
    }
    .k-state-selected.k-state-focused{
    	background-color:#cb1436;
    	box-shadow:inset 0 0 3px 1px #cb1436;
    	-webkit-box-shadow:inset 0 0 3px 1px #cb1436;
    }        
    .k-state-selected{
    	background-color:#cb1436;
    	box-shadow:0 0 3px 1px  #cb1436;
    	-webkit-box-shadow:0 0 3px 1px #cb1436;
    }
    .k-header.k-state-focused{
    	background-color:#cb1436;
    	color:#fff;
    }
    .k-header .k-sorted .k-state-focused{
    	border-color:#cb1436;
    }    
    #btnConnect{
    	position:relative;
    	margin:6px 0 0 8px;
    } 
    
   
    .k-state-selected{
    	border-color:#fff;
    }
    .user-image {
        margin: 0 .5em;
    }
    #example {
        height: 500px;
    }
    #example .box p {
        padding-bottom: 5px;
    }
    .k-grid-content{
    	overflow:auto;
    }
    #content .demo-section {
        margin: 0;
        padding: 10px;
        border-width: 0 0 1px 0;
    }
    #content .demo-section label {
        display: inline-block;
        width: 40px;
        text-align: right;
        line-height: 2.5em;
        vertical-align: middle;
    }   
    #middle-pane>.pane-content >h3{
    	margin:10px 0 0 10px;
    }    
    #middle-pane>.pane-content >p{
    	margin:10px 0 0 10px;
    }    
	#bottom-pane.k-pane{		
		background-color:#333;	
		color:#fff;
		text-align:center;		
		border:none;
		font-size:12px;
		line-height:20px;
	}	
	.k-splitbar{
		border-color:#ee1745;	
		background-color:#ee1745;	
	}
	.k-splitter .k-scrollable{
		overflow:hidden;
	}	
	#tabStrip > ul >li:last-child span{
		background:url("${imgUrl}pen2.png")no-repeat center;
		text-indent:-9999px;
	}
	@media screen and (min-width: 768px){
		.navbar-nav{float:left;}
	}
	.k-tabstrip>.k-content{
		padding:0;
	}
	#tabstrip{
		background-color:#333;
	}
	#tabStrip-1{
		height:90%;
		background-color:#333;
	}
	#tabStrip-2{
		height:90%;
	}
	.k-tabstrip .k-content.k-state-active{
		background-color:#333;
	}
	.pane-content{
		height:100%;
	}
	.k-tabstrip-wrapper{
		height:100%;
	}
	.k-grid-content{
		overflow-x: auto;
   		overflow-y: scroll;
	}
	.k-tabstrip>.k-content{
		overflow:hidden;
	}
	.weather{
		position:relative;
		width:100%;
		height:100%;
	}
	#tableInfoGrid{
		height:100%;
	}
	#btnRun{
		position:absolute;
		left:5px;		
		top:7px;
	}
	#queryToolbar{
		position:relative;		
	}
	#query{
		position:absolute;
		left:0;	
		margin:10px;		
		width:98%;
		height:80%;
		background-color:#333;
		color:#fff;
		font-size:18px;
	}
</style>
</html>