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
        <h3 class="m-0">${message}</h3>
    </div>
     <div class="form-body">
        <div class="d-flex gap-2">
                <button type="button" class="btn btn-light w-25" onclick="history.back()">back</button>
               <a href="/board/insertForm" class="btn btn-submit"><button type="submit"  class="btn btn-submit">게시판등록</button></a> 
                <button type="reset" class="btn btn-submit">게시판<br>리스트</button>
        </div>
     </div>
</div>

</body>
</html>