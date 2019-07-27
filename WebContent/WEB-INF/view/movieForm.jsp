<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Input</title>
</head>
<body>
<h1>Movie Input</h1>
<form id="movieForm" action="/movieInsert.gm" method="post">

<fieldset>
	<legend>movie input form</legend>
	<div>
	<input name="name" placeholder="movie's title" />			
	</div>
	<div>
	<input name="director" placeholder="director's name" />			
	</div>
	<div>
		<h2>release date</h2>
		<select class="year" id="releasedYear" >
			
		</select>
		
		<select class="month" id="releasedMonth">
		</select>
		<select class="day" id="releasedDay">
		</select>		
	</div>
	<div>
		<h2>end date</h2>
		<select class="year" id="endYear">
		
		</select>
		
		<select class="month" id="endMonth">
		
		</select>
		<select class="day" id="endDay">
		
		</select>	
	
	</div>
	<div>
	<input name="audienceNum" value="0" placeholder="audience number" />			
	</div>
	<div>
	<h2>genre</h2>
	
	<select name="genre">
		<c:forEach items="${genres }" var="genre">
		<option value="${genre.no }">${genre.name }</option>
		</c:forEach>
		</select>
	
	</div>
	<input id="endDate" type="hidden" name="endDate" />
	<input id="releasedDate" type="hidden" name="releaseDate"/>
	
	<button>input</button>
</fieldset>

</form>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js"></script>
<script type="text/javascript">
 
var $releasedYear = $("#releasedYear") , $releasedMonth = $("#releasedMonth")
, $releasedDay = $("#releasedDay") , $releasedDate = $("#releasedDate");
 
var $endYear = $("#endYear"), $endMonth = $("#endMonth")
, $endDay= $("#endDay"), $endDate = $("#endDate");
var now = moment();
var year = now.year();
var month = now.month();
var $year = $(".year");
var $month = $(".month");
var $day = $(".day");

//alert(now);

 appendYear();
 appendMonth();
 appendDay();
 

 
function selectReleasedDate() {
	var releaseDate = $releasedYear.val()+"-"+$releasedMonth.val()+"-"+$releasedDay.val();
	$releasedDate.val(releaseDate);
} 
function selectEndDate() {	
	var endDate = $endYear.val()+"-"+$endMonth.val()+"-"+$endDay.val();
	$endDate.val(endDate);
} 

	$("#movieForm").submit(function() {
		selectReleasedDate();
		selectEndDate();
		//alert("test");
	});

 
 function appendYear(){
	 
	 for(var i= now.year(); i>1910; i--){
		 $year.append("<option>"+i+"</option>");
	 }
 }//appendYear() end
 function appendMonth(){
	
	 for(var i=1; i<13; i++){
		 $month.append("<option>"+i+"</option>");
	 }
 }//appendMonth() end
 
 function appendDay(){
	$day.empty();
	 var that =  moment([year,month-1]); //해당하는 년월일의 첫
	// alert(that.endOf("month"));

	 for(var i=1; i<=that.endOf("month").date(); i++){
		 $day.append("<option>"+i+"</option>");
	 }
 }//appendDay() end
 
 
 $year.change(function() {
	year = this.value;
	console.log(month);
	appendDay();
});
 
 $month.change(function() {
	 month = this.value;
	 appendDay();
	 
})

 
 
 
 
 

</script>
</body>
</html>