<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<kendo:tabStrip name="tabStrip">
	<kendo:tabStrip-animation>
		<kendo:tabStrip-animation-open effects="fadeIn"></kendo:tabStrip-animation-open>
	</kendo:tabStrip-animation>
	<kendo:tabStrip-items>
		<kendo:tabStrip-item text="테이블정보" selected="true">
			<kendo:tabStrip-item-content>
				<div class="weather">
					<kendo:grid title="테이블정보" name="tableInfoGrid" sortable="true"
					pageable="false" navigatable="true">
						<kendo:grid-excel fileName="테이블정보.xlsx" allPages="true"
							filterable="true" proxyURL="${eUrl}" />
						<kendo:grid-columns>
							<kendo:grid-column title="컬럼명" field="columnName" />
							<kendo:grid-column title="데이터타입" field="dataType" />
							<kendo:grid-column title="길이" field="characterMaximumLength" />
							<kendo:grid-column title="널허용여부" field="isNullable">
							</kendo:grid-column>
						</kendo:grid-columns>
						
					</kendo:grid>
				</div>
			</kendo:tabStrip-item-content>
		</kendo:tabStrip-item>
		<kendo:tabStrip-item text="쿼리">
			<kendo:tabStrip-item-content>
				<div class="weather">
					<textarea id="query"></textarea>
				</div>
			</kendo:tabStrip-item-content>
		</kendo:tabStrip-item>
	</kendo:tabStrip-items>
</kendo:tabStrip>
<style>
#tabStrip {
	width: 100%;
	height: 100%
}

.sunny, .cloudy, .rainy {
	margin: 30px auto 10px;
	width: 100%;
	height: 128px;
}

.weather {
	margin: 0 auto 30px;
	text-align: center;
}

#tabstrip h2 {
	font-weight: lighter;
	font-size: 5em;
	line-height: 1;
	padding: 0 0 0 30px;
	margin: 0;
}

#tabstrip h2 span {
	background: none;
	padding-left: 5px;
	font-size: .3em;
	vertical-align: top;
}

#tabstrip p {
	margin: 0;
	padding: 0;
}
</style>