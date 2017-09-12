<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:url var="dbRUrl" value="/db/list/tree" />
<script>
var treeview;
function onBound(){
	treeview = $('#treeview').data('kendoTreeView');
}
function onChange(e){
}
function onSelect(e){
	window.selectedNode = e.node;
	var data = treeview.dataItem(window.selectedNode);
	if(data.database){
		var au = new AjaxUtil("db/table/list");
		var param = {};
		param["database"] = data.database;
		au.param = JSON.stringify(param);
		au.setCallbackSuccess(callbackForTreeItem2);
		au.send();
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
	$("#btnConnect").text("접속해제");
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
</script>
<br><br><br><p></p><br>
<kendo:splitter name="vertical" orientation="vertical">
    <kendo:splitter-panes>
        <kendo:splitter-pane id="top-pane" collapsible="false">
            <kendo:splitter-pane-content>
                <kendo:splitter name="horizontal" style="height: 100%; width: 100%;">
				    <kendo:splitter-panes>
				        <kendo:splitter-pane id="left-pane" collapsible="true" size="220px">
				            <kendo:splitter-pane-content >
				                <div class="pane-content">
					                <kendo:toolBar name="toolbar">
										<kendo:toolBar-items>
											<kendo:toolBar-item type="button" text="접속" id="btnConnect" click="toolbarEvent"></kendo:toolBar-item>
										</kendo:toolBar-items>
									</kendo:toolBar>
									 <kendo:treeView name="treeview" dataTextField="<%= new String[]{\"dbTitle\", \"database\",\"tableName\"} %>" change="onChange" select="onSelect" 
									 dataBound="onBound">
									     <kendo:dataSource>
									         <kendo:dataSource-transport>
									             <kendo:dataSource-transport-read url="${dbRUrl}" type="POST"  contentType="application/json"/>    
									             <kendo:dataSource-transport-parameterMap>
									             	<script>
										              	function parameterMap(options,type) {
										              		return JSON.stringify(options);
										              	}
									             	</script>
									             </kendo:dataSource-transport-parameterMap>         
									         </kendo:dataSource-transport>
									         <kendo:dataSource-schema>
									             <kendo:dataSource-schema-hierarchical-model id="dbTitle" hasChildren="hasDatabases"/>
									         </kendo:dataSource-schema>
									     </kendo:dataSource>
									 </kendo:treeView>
                                </div>
				            </kendo:splitter-pane-content>
				        </kendo:splitter-pane>
				        <kendo:splitter-pane id="center-pane" collapsible="false">
				            <kendo:splitter-pane-content>
								<kendo:splitter name="vertical1" orientation="vertical" style="height: 100%; width: 100%;">
				   					<kendo:splitter-panes>
		       							<kendo:splitter-pane id="top-pane" collapsible="false" >
							                <div class="pane-content">
						                		<h3>Inner splitter / middle top pane</h3>
			                                </div>
		       							</kendo:splitter-pane>
		       							<kendo:splitter-pane id="middle-pane" collapsible="true" >
							                <div class="pane-content">
						                		<h3>Inner splitter / middle-middle pane</h3>
			                                </div>
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
	                <b>MySql Tool For Web</b>
            </kendo:splitter-pane-content>
        </kendo:splitter-pane>
    </kendo:splitter-panes>
</kendo:splitter>

<style>
    #vertical {
        height: 580px;
        margin: 0 auto;
    }

    #middle-pane { 
        color: #000; background-color: #fff; 
    }

    #bottom-pane { 
        color: #000; background-color: #fff; 
    }

    #left-pane, #center-pane, #right-pane  { 
        color: #000; background-color: #fff;
    }

    .pane-content {
        padding: 0 10px;
    }
    

    #toolbar {
        border-width: 0 0 1px;
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
    #content .demo-section input {
        width: 80%;
    }
</style>