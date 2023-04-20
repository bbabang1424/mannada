var pageCounter = 2;
var animalContainer = document.getElementById("more");
var btn = document.getElementById("more");

btn.addEventListener("click", function() {
  var ourRequest = new XMLHttpRequest();
  ourRequest.open('GET', 'list/json/' + pageCounter);
});

$(document).ready(function(){
	$("button").click(function(){
		$.ajax({url:'list/json/', async:false, success:function(result){
			//manna_list.js
			$('div').html(result);

		}});

		});

	});

	// ajax을 lode할렸는데 404뜸.. 데이터를 못 받는 건가