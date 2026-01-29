<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Post Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f4f7f6; font-family: 'Segoe UI', sans-serif; }
        .detail-container { 
            max-width: 800px; margin: 60px auto; 
            background: white; border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            overflow: hidden;
        }
        .detail-header { padding: 40px 40px 20px 40px; border-bottom: 1px solid #eee; }
        .detail-title { font-size: 2rem; font-weight: 700; color: #333; margin-bottom: 15px; }
        .detail-meta { color: #888; font-size: 0.9rem; display: flex; gap: 20px; }
        .detail-body { padding: 40px; min-height: 300px; line-height: 1.8; color: #444; font-size: 1.1rem; }
        .detail-footer { padding: 20px 40px; background: #fafafa; border-top: 1px solid #eee; }
        .btn-custom { border-radius: 8px; font-weight: 600; padding: 10px 20px; }
    </style>
</head>
<body>

<div class="detail-container">
    <div class="detail-header">
        <div class="detail-title">${board.title}</div>
        <div class="detail-meta">
            <span><strong>작성자:</strong> ${board.writer}</span>
            <span><strong>작성일:</strong> <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm" /></span>
            <span><strong>번호:</strong> ${board.no}</span>
        </div>
    </div>

    <div class="detail-body">
        <%-- 줄바꿈 처리를 위해 style="white-space: pre-wrap;" 사용 --%>
        <div style="white-space: pre-wrap;">${board.content}</div>
    </div>

    <div class="detail-footer d-flex justify-content-between">
        <a href="/board/boardList" class="btn btn-outline-secondary btn-custom">목록으로</a>
        
        <div class="d-flex gap-2">
            <a href="/board/updateForm?no=${board.no}" class="btn btn-primary btn-custom">수정하기</a>
            <%-- 삭제는 보통 JS로 확인 후 진행하므로 간단히 구현 --%>
            <button type="button" class="btn btn-danger btn-custom" onclick="deletePost(${board.no})">삭제하기</button>
        </div>
    </div>
</div>

<script>
    function deletePost(no) {
        if(confirm("정말 이 게시글을 삭제하시겠습니까?")) {
            location.href = "/board/delete?no=" + no;
        }
    }
</script>

</body>
</html>
