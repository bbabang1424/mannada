window.onload = function() {
	console.log("...");
	
	document.getElementById('currentDate').value =
new Date().toISOString().substring(0, 10);
}
// 우편번호 찿기
function DaumPostcode() {
    	new daum.Postcode({
			oncomplete:function(data){
				//alert("data" + JSON.stringify(data));
				$('[name=postnum]').val(data.zonecode);
				$('[name=address]').val(data.address);
				$('[name=detAddress]').val(data.buildingName);
			}
		}).open();
    }