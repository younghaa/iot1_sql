<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<c:url value="/user/list" var="readUrl" />
<c:url value="/grid/api/update" var="updateUrl" />
<c:url value="/grid/api/delete" var="deleteUrl" />
<c:url value="/grid/api/create" var="createUrl" />
<br><p><br><br><p><br>
<kendo:grid title="그리드"
name="grid" pageable="true" sortable="true" scrollable="false" height="550">
<kendo:grid-editable mode="incell"/>
<kendo:grid-pageable refresh="true" pageSizes="true" buttonCount="5">
	</kendo:grid-pageable>
<kendo:grid-toolbar>
	<kendo:grid-toolbarItem name="create" text="생성"/>
	<kendo:grid-toolbarItem name="cancel" text="취소"/>
	<kendo:grid-toolbarItem name="save" text="저장"/>
</kendo:grid-toolbar>
<kendo:grid-columns>
<kendo:grid-column title="번호" field="userNum"/>
<kendo:grid-column title="아이디" field="userId"/>
<kendo:grid-column title="이름" field="userName"/>
<kendo:grid-column title="나이" field="age"/>
<kendo:grid-column title="주소" field="address"/>
<kendo:grid-column-group title="전화번호" >
<kendo:grid-column-group-columns>
<kendo:grid-column title="hp1" field="hp1"/>
<kendo:grid-column title="hp2" field="hp2"/>
<kendo:grid-column title="hp3" field="hp3"/>
</kendo:grid-column-group-columns>
</kendo:grid-column-group>
<kendo:grid-column title="비밀번호" field="userPwd"/>
<kendo:grid-column title="유저권한" field="userRoleLevel"/>
<kendo:grid-column title="성별" field="gender"/>
</kendo:grid-columns>
<kendo:dataSource pageSize="20">
	<kendo:dataSource-transport>
		<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
	</kendo:dataSource-transport>
</kendo:dataSource>
</kendo:grid>

<script>	
</script>
   