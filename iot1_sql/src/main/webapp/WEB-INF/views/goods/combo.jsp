<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/vendor/vendor_list.jsp" %>
<body>
<br><p><br><br><p><br>
<br><p><br><br><p><br>
<br><p><br><br><p><br>
<br><p><br><br><p><br>
<br><p><br><br><p><br>
<br><p><br><br><p><br>
<br><p><br><br><p><br>
<br><p><br><br><p><br>
<c:url var="readUrl" value="/goods/list"  />
<c:url var="createUrl" value="/goods/createone" />
<c:url var="updateUrl" value="/goods/updateone" />
<c:url var="deleteUrl" value="/goods/deleteone"  />
<c:url var="excelUrl" value="/goods/excel" />
<c:url var="vendorComboUrl" value="/vendor/combo"/>


</head>
<body>
<script>
 /* 	$(document).ready(function(){
		if(!"${vendors}"){
			location.href="${vendorComboUrl}";
		}
	})  */
</script>
<br><p><br><br><p><br>

<body>
<kendo:grid title="GOODS" name="grid" pageable="true" sortable="true" scrollable="true" height="450" navigatable="true">
<kendo:grid-editable mode="popup"/><!-- 컬럼수정형식 -->
<kendo:grid-toolbar>
	<kendo:grid-toolbarItem name="create" text="생성"/>
	<kendo:grid-toolbarItem name="excel" text="엑셀로저장"/>
</kendo:grid-toolbar>
<kendo:grid-excel fileName="상품정보.xlsx" allPages="true" filterable="true" proxyURL="${excelUrl}"/>

<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="10"><!-- 표시되는페이지개수 -->
	</kendo:grid-pageable>

<kendo:grid-columns>
<kendo:grid-column title="제품번호" field="giNum"/>
<kendo:grid-column title="제품명" field="giName"/>
<kendo:grid-column title="제품정보" field="giDesc"/>
<kendo:grid-column title="회사번호" field="viNum">
<kendo:grid-column-values value="${vendor}"/>
</kendo:grid-column>
<kendo:grid-column title="생산일자" field="giCredat" format="{0:yyyyMMdd}"/>
<kendo:grid-column title="생산완료시간" field="giCretim"/>
<kendo:grid-column title="&nbsp;" width="200px" >
	<kendo:grid-column-command>
            		<kendo:grid-column-commandItem name="edit" />
            		<kendo:grid-column-commandItem name="destroy" />
            	</kendo:grid-column-command>
</kendo:grid-column>
</kendo:grid-columns>
<kendo:dataSource pageSize="20">
	<kendo:dataSource-transport>
		<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/>
			<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json"/>
				<kendo:dataSource-transport-destroy url="${deleteUrl}" dataType="json" type="POST" 	contentType="application/json"/>
					<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json"/>
		<kendo:dataSource-transport-parameterMap>
		<script>
		function parameterMap(options,type) { 
   			var str = JSON.stringify(options);
  
   			return str;
    	}
		</script>
		</kendo:dataSource-transport-parameterMap>
	</kendo:dataSource-transport>
	
	<kendo:dataSource-schema>
		<kendo:dataSource-schema-model id="giNum">
		<kendo:dataSource-schema-model-fields>
				<kendo:dataSource-schema-model-field name="giNum" type="number" editable="false"/>
				<kendo:dataSource-schema-model-field name="giName" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="giDesc" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="viNum" defaultValue="1">
				<kendo:dataSource-schema-model-field-validation required="true" min="1"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="giCredat"  editable="true" type="date"> 
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="giCretim" editable="false">
				</kendo:dataSource-schema-model-field>
					</kendo:dataSource-schema-model-fields>
		</kendo:dataSource-schema-model>
	</kendo:dataSource-schema>
</kendo:dataSource>
</kendo:grid>
</p></body>


</html>