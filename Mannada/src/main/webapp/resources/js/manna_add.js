window.onload = function() {
	console.log("...");
	
	document.getElementById('currentDate').value =
new Date().toISOString().substring(0, 10);
}

