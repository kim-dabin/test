<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Management Service</title>
</head>
<body>
<h1>MMS</h1>
<ul>
<li><a href="/genre.gm">장르목록</a></li>
<li><a href="/movieList.gm">영화목록</a></li>
</ul>
<h2>영화 검색 </h2>
<form id="form" action="">
<input id = "no"/>
<button>검색 </button>
</form>
<ul id="movieList">
	<li>영화 없음 </li>

</ul>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$("#form").submit(function () {
	var no = $("#no").val();
	$.ajax({
		url:"/ajax/getMovie.gm",
		type:"post",
		dataType:"json",
		data:{no: no},
		error :function(){
			alert("error!");
		},
		success:function(json){
			
			console.log(json);
			$("#movieList").empty();
			$("<li>").text("number: "+json.no+"/ title: "+json.name)
			.appendTo("#movieList");
		}
	
		
	});
	
	
	return false;
});

</script>
</body>
</html>