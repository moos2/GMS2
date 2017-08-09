<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.beans.Statement"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<%@ page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@ page import="oracle.jdbc.driver.DBConversion"%>

<jsp:include page="../member/member_head.jsp"></jsp:include>
<link rel="stylesheet" href="${css}/member.css" />


		<div id="container">
		<table id="index_tab">
			<tr id="index_tab_tr">
				<th><i class="glyphicon glyphicon-user"></i>학생관리</th>
				<th><i class="glyphicon glyphicon-cloud"></i>성적관리</th>
				<th><i class="glyphicon glyphicon-thumbs-up"></i>게시판</th>
			</tr>
			<tr>
				<td>
					<ul class="index-ul">
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_add">학생정보 추가</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_list">학생정보 목록</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_detail">학생 상세정보</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_update">학생정보 수정</a></li>
						<li><a href="<%=request.getContextPath()%>/member.do?action=move&page=member_delete">학생정보 삭제</a></li>
					</ul>
				</td>
				<td>
					<ul class="index-ul" >
						<li><a href="/grade/grade_add.jsp">성적 입력</a></li>
						<li><a href="/grade/grade_list.jsp">성적 목록</a></li>
						<li><a href="/grade/grade_detail.jsp">성적 상세</a></li>
						<li><a href="/grade/grade_update.jsp">성적 수정</a></li>
						<li><a href="/grade/grade_delete.jsp">성적 삭제</a></li>
					</ul>
				</td>
				<td>
					<ul class="index-ul">
						<li><a href="/board/board_write.jsp">게시글 목록</a></li>
						<li><a href="/board/board_list.jsp">게시글 목록</a></li>
						<li><a href="/board/board_detail.jsp">게시글 상세</a></li>
						<li><a href="/board/board_update.jsp">게시글 수정</a></li>
						<li><a href="/board/board_delete.jsp">게시글 삭제</a></li>
					</ul>
				</td>
			</tr>
		</table>
		</div>
<%-- 
<script>
	alert('잘못된 비밀번호');
	location.href="<%=%>/index.jsp";
</script>
		 
<script>
	alert('없는 ID..회원가입 바랍니다');
	location.href="<%=%>/member/member_add.jsp";
</script>
 --%>
<%@ include file="footer.jsp" %>