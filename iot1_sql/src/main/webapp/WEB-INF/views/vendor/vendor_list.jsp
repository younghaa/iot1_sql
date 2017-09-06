<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    <%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="/vendor/list" var="readUrl" />
<c:url value="/vendor/vendor_list/update" var="updateUrl" />
<c:url value="/vendor/vendor_list/delete" var="deleteUrl" />
<c:url value="/vendor/vendor_list/create" var="createUrl" />
<br><p><br><br><p><br>
<kendo:grid title="VENDOR"
name="grid" pageable="true" sortable="true" scrollable="true" height="450">
<kendo:grid-editable mode="incell"/>
<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="5">
	</kendo:grid-pageable>
<kendo:grid-toolbar>
	<kendo:grid-toolbarItem name="create" text="생성"/>
	<kendo:grid-toolbarItem name="cancel" text="취소"/>
	<kendo:grid-toolbarItem name="save" text="저장"/>
</kendo:grid-toolbar>
<kendo:grid-columns>
<kendo:grid-column title="번호" field="viNum"/>
<kendo:grid-column title="이름" field="viName"/>
<kendo:grid-column title="정보" field="viDesc"/>
<kendo:grid-column title="주소" field="viAddress"/>
<kendo:grid-column title="전화번호" field="viPhone"/>
<kendo:grid-column title="날짜" field="viCredat"/>
<kendo:grid-column title="시간" field="viCretim"/>

</kendo:grid-columns>
<kendo:dataSource pageSize="20">
	<kendo:dataSource-transport>
		<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
	</kendo:dataSource-transport>
</kendo:dataSource>
</kendo:grid>


<body>
<%-- <script>
 function callback(result){
	alert(result.length);
	var result = "";
	for(var i=0, max=result.length;i<max;i++){
		var vendor=result[i];
		result +="," +vendor.viNum+vendor.viName+vendor.viDesc+vendor.viAddress+vendor.viPhone+vendor.viCredat+vendor.viCretim
	}
	$("#r_div").html(result);
}
$(document).ready(function(){
	$("input[type='button']").click(function(){
		var au = new AjaxUtil("vendor/list");
		au.setCallbackSucess(callback);
		au.send();
	})
})
</script>

<form action="${rootPath}/vendor/list" method="post">
<input type="button" value="전송"/>
</form> --%>
</body>
<div r_dov></div>
</html>