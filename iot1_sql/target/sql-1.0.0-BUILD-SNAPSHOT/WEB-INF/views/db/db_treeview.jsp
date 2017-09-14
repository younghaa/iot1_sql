<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp" %>
<c:url var="dbRUrl" value="/db/list/tree" />
<kendo:toolBar name="toolbar">
	<kendo:toolBar-items>
		<kendo:toolBar-item type="button" text="접속" id="btnConnect"
			click="toolbarEvent"></kendo:toolBar-item>
	</kendo:toolBar-items>
</kendo:toolBar>
<kendo:treeView name="treeview"
	dataTextField="<%= new String[]{\"dbTitle\", \"database\",\"tableName\"} %>"
	change="treeSelect" dataBound="onBound">
	<kendo:dataSource>
		<kendo:dataSource-transport>
			<kendo:dataSource-transport-read url="${dbRUrl}" type="POST"
				contentType="application/json" />
			<kendo:dataSource-transport-parameterMap>
				<script>
	              	function parameterMap(options,type) {
	              		return JSON.stringify(options);
	              	}
             	</script>
			</kendo:dataSource-transport-parameterMap>
		</kendo:dataSource-transport>
		<kendo:dataSource-schema>
			<kendo:dataSource-schema-hierarchical-model id="dbTitle"
				hasChildren="hasDatabases" />
		</kendo:dataSource-schema>
	</kendo:dataSource>
</kendo:treeView>