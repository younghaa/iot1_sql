<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    
<c:url var="readUrl" value="/vendor/list" />
<c:url var="createUrl" value="/vendor/createone" />
<c:url var="updateUrl" value="/vendor/updateone" />
<c:url var="deleteUrl" value="/vendor/deleteone"  />
<c:url var="vexcelUrl" value="/vendor/excel" />

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
    <kendo:grid title="VENDOR" name="grid" pageable="true" sortable="true" scrollable="true" height="450" navigatable="true">
<kendo:grid-editable mode="popup"/><!-- 컬럼수정형식 -->
<kendo:grid-toolbar>
	<kendo:grid-toolbarItem name="create" text="생성"/>
	<kendo:grid-toolbarItem name="excel" text="엑셀로저장"/>
</kendo:grid-toolbar>
<kendo:grid-excel fileName="업체정보.xlsx" allPages="true" filterable="true" proxyURL="${vexcelUrl}"/>

<kendo:grid-pageable refresh="true" pageSizes="true"><!-- 표시되는페이지개수 -->
	</kendo:grid-pageable>

<kendo:grid-columns>
<kendo:grid-column title="거래처번호" field="viNum"/>
<kendo:grid-column title="업체명" field="viName"/>
<kendo:grid-column title="회사정보" field="viDesc"/>
<kendo:grid-column title="주소" field="viAddress"/>
<kendo:grid-column title="전화번호" field="viPhone"/>
<kendo:grid-column title="등록일" field="viCredat" format="{0:yyyyMMdd}"/>
<kendo:grid-column title="등록시간" field="viCretim"/>
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
		<kendo:dataSource-schema-model id="viNum">
		<kendo:dataSource-schema-model-fields>
				<kendo:dataSource-schema-model-field name="viNum" type="number" editable="false"/>
				<kendo:dataSource-schema-model-field name="viName" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="viDesc" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="viAddress" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="viPhene" type="string">
				<kendo:dataSource-schema-model-field-validation required="true"/>
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="viCredat"  editable="true" type="date"> 
				</kendo:dataSource-schema-model-field>
				<kendo:dataSource-schema-model-field name="viCretim" editable="false">
				</kendo:dataSource-schema-model-field>
					</kendo:dataSource-schema-model-fields>
		</kendo:dataSource-schema-model>
	</kendo:dataSource-schema>
</kendo:dataSource>
</kendo:grid>
</body>