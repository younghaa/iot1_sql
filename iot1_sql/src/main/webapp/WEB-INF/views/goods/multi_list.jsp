<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:url var="readUrl" value="/goods/list" />
<c:url var="createUrl" value="/goods/create" />
<c:url var="updateUrl" value="/goods/update" />
<c:url var="deleteUrl" value="/goods/delete" />
<c:url var="excelUrl" value="/goods/excel" />
<c:url var="vrUrl" value="/vendor/list" />

<c:url var="vendorComboUrl" value="/vendor/combo" />
<title>둘돠</title>
</head>
<body>
	<style>
		.k-link, tr {
             text-align : center;
         }
	</style>
	<script>
		var goodsGrid;
		/* $(document).ready(function() {
			if (!"${vendors}") {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
				location.href = "${vendorComboUrl}";
			}
			goodsGrid = $("#goodsGrid");
		}) */
		function onChange(arg) {
			//this는 무조건 변경없음
			//goodsGrid 타겟 그리드 즉 데이터가 변경이 되어야 하는 그리드
			//kendo의 name속성에 준 값으로 jquery를 사용해 그리드 객채를 만들어서
			//넘기면됨.
			goodsGrid = $("#goodsGrid");
			//"${rUrl}"은 타겟 그리드가 실제로 갔다와야 하는 컨트롤러의 매핑 값
			//"viNum"은 헤더에서의 키값
			var ki = new KendoItem(this, goodsGrid, "${readUrl}", "viNum");
			ki.send();
		}

		function onDataBound(arg) {
			console.log("Grid data bound");
		}

		function onDataBinding(arg) {
			console.log("Grid data binding");
		}

		function onSorting(arg) {
			console.log("Sorting on field: " + arg.sort.field + ", direction:"
					+ (arg.sort.dir || "none"));
		}

		function onFiltering(arg) {
			console.log("Filter on " + kendo.stringify(arg.filter));
		}

		function onPaging(arg) {
			console.log("Paging to page index:" + arg.page);
		}

		function onGrouping(arg) {
			console.log("Group on " + kendo.stringify(arg.groups));
		}
	</script>
	<br>
	<p />
	<br>
	<p />
	<br>
	<p />
	<kendo:grid title="회사리스트" name="vendorGrid" height="320px"
		pageable="true" sortable="true" selectable="true" filterable="true"
		groupable="true" change="onChange" dataBound="onDataBound"
		dataBinding="onDataBinding" sort="onSorting" filter="onFiltering"
		page="onPaging" group="onGrouping" >
		
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성" />
			<kendo:grid-toolbarItem name="save" text="저장" />
			<kendo:grid-toolbarItem name="excel" text="엑셀저장" />
		</kendo:grid-toolbar>
		<kendo:grid-excel fileName="회사정보.xlsx" allPages="true"  filterable="true" proxyURL="${excelUrl}" />

		<kendo:grid-columns>
			<kendo:grid-column title="회사번호" field="viNum" />
			<kendo:grid-column title="회사이름" field="viName" />
			<kendo:grid-column title="회사설명" field="viDesc" />
			<kendo:grid-column title="전화번호" field="viPhone" />
			<kendo:grid-column title="등록일자" field="viCredat"
				format="{0:yyyy-MM-dd}" />
			<kendo:grid-column title="등록시간" field="viCretim" />
			<kendo:grid-column title="삭제" command="destroy" />
		</kendo:grid-columns>

		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url="${vrUrl}" dataType="json"
					type="POST" contentType="application/json" />
				<kendo:dataSource-transport-parameterMap>
					<script>
						function parameterMap(options, type) {
							if (type === "read") {
								return JSON.stringify(options);
							} else {
								var str = JSON.stringify(options.models);
								return str;
							}
						}
					</script>
				</kendo:dataSource-transport-parameterMap>
			</kendo:dataSource-transport>

			<kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="viNum">
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="viNum" type="number"
							editable="false" />
						<kendo:dataSource-schema-model-field name="viName" type="string">
							<kendo:dataSource-schema-model-field-validation required="true" />
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="viPhone" />
						<kendo:dataSource-schema-model-field name="viCredat"
							editable="true" type="date">
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="viCretim"
							editable="false">
						</kendo:dataSource-schema-model-field>
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
		</kendo:dataSource>
	</kendo:grid>
	<kendo:grid title="상품리스트" name="goodsGrid" pageable="true"
		sortable="true" scrollable="true" height="450" navigatable="true">
		<kendo:grid-editable mode="incell" />
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성" />
			<kendo:grid-toolbarItem name="save" text="저장" />
			<kendo:grid-toolbarItem name="excel" text="엑셀저장" />
		</kendo:grid-toolbar>
		<kendo:grid-excel fileName="상품정보.xlsx" allPages="true"
			filterable="true" proxyURL="${excelUrl}" />

		<kendo:grid-columns>
			<kendo:grid-column title="제품번호" field="giNum" />
			<kendo:grid-column title="제품이름" field="giName" />
			<kendo:grid-column title="제품설명" field="giDesc" />
			<kendo:grid-column title="회사번호" field="viNum">
				<kendo:grid-column-values value="${vendors}" />
			</kendo:grid-column>
			<kendo:grid-column title="생산일자" field="giCredat"
				format="{0:yyyy-MM-dd}" />
			<kendo:grid-column title="생산시간" field="giCretim" />
			<kendo:grid-column command="destroy" title="삭제" />
			
		</kendo:grid-columns>

		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url="${readUrl}" dataType="json"
					type="POST" contentType="application/json" />
				<kendo:dataSource-transport-create url="${createUrl}" dataType="json"
					type="POST" contentType="application/json" />
				<kendo:dataSource-transport-destroy url="${deleteUrl}" dataType="json"
					type="POST" contentType="application/json" />
				<kendo:dataSource-transport-update url="${updateUrl}" dataType="json"
					type="POST" contentType="application/json" />
				<kendo:dataSource-transport-parameterMap>
					<script>
						function parameterMap(options, type) {
							if (type === "read") {
								return JSON.stringify(options);
							} else {
								var str = JSON.stringify(options.models);
								return str;
							}
						}
					</script>
				</kendo:dataSource-transport-parameterMap>
			</kendo:dataSource-transport>

			<kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="giNum">
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="giNum" type="number"
							editable="false" />
						<kendo:dataSource-schema-model-field name="giName" type="string">
							<kendo:dataSource-schema-model-field-validation required="true" />
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="viNum" defaultValue="1">
							<kendo:dataSource-schema-model-field-validation required="true"
								min="1" />
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="giCredat"
							editable="true" type="date">
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="giCretim"
							editable="false">
						</kendo:dataSource-schema-model-field>
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
		</kendo:dataSource>
	</kendo:grid>
</body>
</html>