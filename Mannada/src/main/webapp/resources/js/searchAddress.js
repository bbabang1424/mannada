$(function() {
	$("input[name='addressType']").click(e => {
		const metro_name = $("#metro").val();
		const city_name = $("#city").val();
		
		console.log(metro_name, city_name);
		
		if(metro_name == "선택하세요" || city_name == "선택하세요")
			return;
			
		const type = e.target.value;	
			
		$.getJSON(type + "?metro=" + metro_name + "&city=" + city_name, addr_result => {
			$("#address").empty();
			
			addr_result.unshift({road:"선택하세요", local:"선택하세요"});
			
			addr_result.forEach(item => {
				//값이 없는건 숨기기
				if(item[type] == '')
					return;
				//option 생성
				const option = document.createElement("option");
				
				option.value = item[type]; //item.addrId;
				option.textContent = item[type];
				
				$("#address").append(option);
			});							
		});
	});
		
		//광역시&도 값 가져오기
	$.getJSON("metro", metro_result => {			
		metro_result.forEach(item => {	
				//option 생성
				const option = document.createElement("option");
				
				option.value = item.metro;
				option.textContent = item.metro;
				
				$("#metro").append(option);
		});
		
		//광역시&도 값 변화에 따른 시&군&구 값 가져오기
		$("#metro").change(e => {				
			const metro_name = e.target.value;
			//광역시&도 값이 없다면 0값 select>option의 value값에 넣기
			if(metro_name == 0)
				return;
			else if(metro_name != '세종특별자치시') {
				$.getJSON("city?metro=" + metro_name, city_result => {
					$("#city").empty();
					
					city_result.unshift({city: "선택하세요"});					
						
					city_result.forEach(item => {	
						//option 생성
						const option = document.createElement("option");
						
						option.value = item.city;
						option.textContent = item.city;
							
						$("#city").append(option);
					});
					//시&군&구 값 변화에 따른 도로명 혹은 지번 값 가져오기
					$("#city").change(e => {
						const metro_name = $("#metro").val();
						const city_name = e.target.value;
						
						//시&군&구 값이 없다면 0값 select>option의 value값에 넣기
						//if(city_name == 0)
						//	return;
						
						//시&군&구 값이 아닌건 숨기기
						if(!city_name)
							return;
						
						const type = $("input[name='addressType']:checked").val();
						
						$.getJSON(type + "?metro=" + metro_name + "&city=" + city_name, addr_result => {
							$("#address").empty();
							
							addr_result.unshift({road:"선택하세요", jibun:"선택하세요"});
							
							addr_result.forEach(item => {
								//값이 없는건 숨기기
								if(item[type] == '')
									return;
								//option 생성
								const option = document.createElement("option");
								
								option.value = item[type]; // item.addrId;
								option.textContent = item[type];
									
								$("#address").append(option);
							});							
						});		
					})
				});
			} else if(metro_name == '세종특별자치시') {
				$("#city").empty();					
				const option = document.createElement("option");						
				option.value = '0';
				option.textContent = "해당없음";
				$("#city").append(option);

				const metro_name = $("#metro").val();
											
				const type = $("input[name='addressType']:checked").val();
				
				$.getJSON(type + "?metro=" + metro_name + "&city=0", addr_result => {
					$("#address").empty();
					
					addr_result.unshift({road:"선택하세요", jibun:"선택하세요"});
					
					addr_result.forEach(item => {
						//값이 없는건 숨기기
						if(item[type] == '')
							return;
						//option 생성
						const option = document.createElement("option");
						
						option.value = item[type]; // item.addrId;
						option.textContent = item[type];
							
						$("#address").append(option);
					});							
				});
			}
		});		
	});		
});
