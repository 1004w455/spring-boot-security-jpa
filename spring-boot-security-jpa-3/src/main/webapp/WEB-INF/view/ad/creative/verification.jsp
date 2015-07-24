<%@ page pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 광고소재 검수</title>
<style type="text/css">
li {
	display: inline-block;
	list-style: none;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div>
		<a href="${pageContext.request.contextPath}/ad/creative/verification?type=all">모든 광고</a> | <a href="${pageContext.request.contextPath}/ad/creative/verification?type=pending">승인 대기중인 광고</a> | <a href="${pageContext.request.contextPath}/ad/creative/verification?type=approved">승인된 광고</a> | <a
			href="${pageContext.request.contextPath}/ad/creative/verification?type=rejected">반려된 광고</a>
	</div>
	<br />
	<br />
	<br />
	<div>
		<c:forEach items="${page.content}" var="creative">
			<div id="${creative.id}">
				<div>
					광고 이름 : ${creative.name}<br /> 본문 : ${creative.body}<br /> 이미지 : <img src="${creative.imageUrl}" width="280" /><br /> 링크 : ${creative.linkUrl}<br /> 콜투액션 : ${creative.callToActionType}<br />
				</div>
				<br /> <select id="s_${creative.id}">
					<option value="1">선정적</option>
					<option value="2">정치</option>
					<option value="3">반사회</option>
					<option value="4">아몰랑 그냥 싫음</option>
				</select>
				<button onclick="reject($('#s_${creative.id}').val(), '${creative.id}')">반려</button>
				<button onclick="approve('${creative.id}');">승인</button>
				<br />
				<hr>
				<br />
			</div>
		</c:forEach>
		<div class="pagination">
			<ul>
				<c:forEach var="i" begin="0" end="${page.totalPages-1}">
					<c:choose>
						<c:when test="${i == page.number}">
							<li class="active"><a href="${pageContext.request.contextPath}/ad/creative/verification?type=${param.type}&page=${i}">${i+1}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath}/ad/creative/verification?type=${param.type}&page=${i}">${i+1}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>
	</div>

	<script type="text/javascript">
		var rootPath = '${pageContext.request.contextPath}/';
		function reject(reason, creativeId) {
			if (confirm('광고를 리젝하시겠습니까? ')) {
				$.ajax({
					url : rootPath + 'ad/creative/verify',
					type : 'POST',
					data : {
						creativeId : creativeId,
						reason : reason,
						action : 'reject'
					},
					dataType : 'JSON',
					success : function(result) {
						if (result == true) {
							$('#' + creativeId).remove();
						}
					},
					error : function(x, e) {
					}
				});
			}
		}

		function approve(creativeId) {
			if (confirm('광고를 승인하시겠습니까?')) {
				$.ajax({
					url : rootPath + 'ad/creative/verify',
					type : 'POST',
					data : {
						creativeId : creativeId,
						action : 'approve'
					},
					dataType : 'JSON',
					success : function(result) {
						if (result == true) {
							$('#' + creativeId).remove();
						}
					},
					error : function(x, e) {
					}
				});
			}
		}
	</script>
</body>
</html>