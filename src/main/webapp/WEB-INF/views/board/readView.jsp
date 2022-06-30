<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?")
				
				if(deleteYN == true) {
				
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				
				}
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
			
			// 목록
			$(".list_btn").on("click", function(){
			
			location.href = "/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			//댓글
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "/board/replyWrite");
				  formObj.submit();
			});
			
			// $(this).attr("data-rno") => 클릭 이벤트가 발생한 수정 버튼의 data-rno값
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/board/replyUpdateView?bno=${read.bno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&rno="+$(this).attr("data-rno");
			});
					
		//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/board/replyDeleteView?bno=${read.bno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&rno="+$(this).attr("data-rno");
			});
	
		
		// 답변완료
			/*  $(".replyAnswerBtn").on("click", function(){
				let replyCh = $("")
				
				$("#sendBtn").click(function () {
		            let comment = $("textarea[name=comment]").val();
		            if (comment.trim() == '') {
		                alert("댓글을 입력해주세요");
		                $("textarea[name=comment]").focus();
		                return;
		            }
		            $.ajax({
		                type: 'POST',       // 요청 메서드
		                url: '/pro/comments?bno=' + bno,  // 요청 URI
		                headers: {"content-type": "application/json"}, // 요청 헤더
		                data: JSON.stringify({bno: bno, comment: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
		                success: function () {
		                    alert("등록되었습니다.");       // result는 서버가 전송한 데이터
		                    showList(bno);
		                },
		                error: function () {
		                    alert("error")
		                } // 에러가 발생했을 때, 호출될 함수
		            }); // $.ajax()
		            $("input[name=comment]").val('');
		            
		            
		        });  */
			}) 
			
	</script>
	
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file = "nav.jsp" %>
			</div>
			<hr/>
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type = "hidden" id = "bno" name ="bno" value="${read.bno }"/>
					<input type ="hidden" id = "page" name = "page" value ="${scri.page}"/>
					<input type ="hidden" id = "perPageNum" name = "perPageNum" value ="${scri.perPageNum}"/>
					<input type = "hidden" id = "searchType" name = "searchType" value = "${scri.searchType }" />
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}" />
				</form>
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>		
					</tbody>			
				</table>
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
				</div>
				
				<!-- 댓글 -->
				<div id ="reply">
					<ol class = "replyList">
						<c:forEach items ="${replyList }" var = "replyList">
							<li>
								<p>
								작성자 : ${replyList.writer }<br/>
								작성 날짜 : <fmt:formatDate value = "${replyList.regdate }" pattern="yyyy-MM-dd"/>
								</p>
								
								<p>${replyList.content }</p>
								<div>
									<button type = "button" class = "replyUpdateBtn" data-rno = "${replyList.rno }">수정</button>
									<button type = "button" class = "replyDeleteBtn" data-rno = "${replyList.rno }">삭제</button>
									<button type = "button" class = "replyAnswerBtn" data-rno = "${replyList.rno }">답변완료</button>
								</div>
							</li>
						</c:forEach>
					</ol>
				</div>
				
				<form name="replyForm" method="post">
					<input type="hidden" id="bno" name="bno" value="${read.bno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<div>
					    <label for="writer">댓글 작성자</label><input type="text" id="writer" name="writer" />
					    <br/>
					    <label for="content">댓글 내용</label><input type="text" id="content" name="content" />
					</div>
					<div>
					 	 <button type="button" class="replyWriteBtn">작성</button>
					</div>
				</form>
				
			</section>
			<hr />
		</div>
	</body>
</html>
