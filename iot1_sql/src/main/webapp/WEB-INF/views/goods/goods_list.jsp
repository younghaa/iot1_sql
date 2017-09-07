<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/goods/list" var="readUrl" />
<c:url value="/goods/create" var="createUrl" />
<c:url value="/goods/update" var="updateUrl" />
<c:url value="/goods/delete" var="deleteUrl" />

<br><p><br><br><p><br>
<kendo:grid title="GOODS" name="grid" pageable="true" sortable="true" scrollable="true" height="450">
<kendo:grid-toolbar>
	<kendo:grid-toolbarItem name="create" text="생성"/>
	<kendo:grid-toolbarItem name="cancel" text="취소"/>
	<kendo:grid-toolbarItem name="save" text="저장"/>
</kendo:grid-toolbar>
<kendo:grid-editable mode="popup"/><!-- 컬럼수정형식 -->
<kendo:grid-toolbar>
            <kendo:grid-toolbarItem name="create"/>
        </kendo:grid-toolbar>
<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="10"><!-- 표시되는페이지개수 -->
	</kendo:grid-pageable>

<kendo:grid-columns>
<kendo:grid-column title="제품번호" field="giNum" editable="false"/>
<kendo:grid-column title="제품명" field="giName"/>
<kendo:grid-column title="제품정보" field="giDesc"/>
<kendo:grid-column title="회사번호" field="viNum"/>
<kendo:grid-column title="생산일자" field="giCredat" format="{0:yyyyMMdd}"/>
<kendo:grid-column title="생산완료시간" field="giCretim"/>
<kendo:grid-column title="&nbsp;" width="200px" >
	<kendo:grid-column-command>
            		<kendo:grid-column-commandItem name="edit" />
            		<kendo:grid-column-commandItem name="destroy" />
            	</kendo:grid-column-command>
</kendo:grid-column>
</kendo:grid-columns>
<kendo:dataSource pageSize="20" batch="true">
	<kendo:dataSource-transport>
		<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
		<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json" />
		<kendo:dataSource-transport-create url="${updateUrl}" dataType="json" type="POST" contentType="application/json" />
		<kendo:dataSource-transport-create url="${deleteUrl}" dataType="json" type="POST" contentType="application/json" />
		<kendo:dataSource-transport-parameterMap>
		<script>
		function parameterMap(options, type){
			if(type==="read"){
				return JSON.stringify(options);
			}else{
				return JSON.stringify(options.models);
			}	
		}
		</script>
		</kendo:dataSource-transport-parameterMap>
	</kendo:dataSource-transport>
	
	<kendo:dataSource-schema>
		<kendo:dataSource-schema-model id="giNum">
		<kendo:dataSource-schema-model-fields>
				<kendo:dataSource-schema-model-field name="giName" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="giDesc" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="viNum" type="number">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="giCredat"  editable="true" type="date"/> 
				<kendo:dataSource-schema-model-field name="giCretim" editable="false" />
					</kendo:dataSource-schema-model-fields>
		</kendo:dataSource-schema-model>
	</kendo:dataSource-schema>
	
</kendo:dataSource>
</kendo:grid>


<body>
<%--<script>
 function callback(result){
	alert(result.length);
	var result = "";
	for(var i=0, max=result.length;i<max;i++){
		var goods=result[i];
		result +="," +goods.giNum+goods.giName+goods.giDesc+goods.viNum+goods.giCredat+goods.giCretim
	}
	$("#r_div").html(result);
}
$(document).ready(function(){
	$("input[type='button']").click(function(){
		var au = new AjaxUtil("goods/list");
		au.setCallbackSucess(callback);
		au.send();
	})
})
</script>

<form action="${rootPath}/goods/list" method="post">
<input type="button" value="전송"/>
</form> --%>
</body>
<div r_dov></div>
</html>