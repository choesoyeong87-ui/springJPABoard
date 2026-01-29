<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Write Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root { --primary-color: #4a90e2; }
        body { background: #f4f7f6; font-family: 'Segoe UI', sans-serif; }
        .form-card { 
            max-width: 600px; margin: 60px auto; 
            background: white; border-radius: 20px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.08); 
            overflow: hidden;
        }
        .form-header { background: var(--primary-color); padding: 30px; color: white; text-align: center; }
        .form-body { padding: 40px; }
        /* 플로팅 라벨 효과 */
        .form-floating > .form-control:focus ~ label { color: var(--primary-color); }
        .btn-submit { 
            background: var(--primary-color); color: white; border: none;
            padding: 12px 30px; border-radius: 10px; font-weight: 600;
            transition: all 0.3s; width: 100%;
        }
        .btn-submit:hover { background: #357abd; transform: translateY(-2px); }
    </style>
</head>
<body>

<div class="form-card">
    <div class="form-header">
        <h3 class="m-0">게시판</h3>
        <p class="small opacity-75 mt-2">당신의 생각을 자유롭게 적어주세요.</p>
    </div>
    
    <div class="form-body">
        <form action="/board/insert" method="post">
            
            <div class="form-floating mb-3">
                <input type="text" name="title" class="form-control shadow-none" id="title" placeholder="Title" required>
                <label for="title">제목</label>
            </div>

            <div class="form-floating mb-3">
                <input type="text" name="writer" class="form-control shadow-none" id="writer" placeholder="Writer" required>
                <label for="writer">작성자</label>
            </div>

            <div class="form-floating mb-4">
                <textarea name="content" class="form-control shadow-none" id="content" placeholder="Content" style="height: 200px" required></textarea>
                <label for="content">내용을 입력하세요...</label>
            </div>

            <div class="d-flex gap-2">
                <a href="/board/boardList" class="btn btn-light w-25" style="width: 40% !important; white-space: normal;"> 게시판<br>리스트 </a>
                <button type="submit" class="btn btn-submit">게시판전송</button>
                <button type="reset" class="btn btn-submit">게시판취소</button>
            </div>
            
        </form>
    </div>
</div>

</body>
</html>
