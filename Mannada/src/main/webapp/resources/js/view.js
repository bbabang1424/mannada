$(document).ready(function(){
	
	$('ul.tabs li').click(function(){							//선택자를 통해 tabs 메뉴를 클릭 이벤트를 지정해줍니다.
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');			//선택 되있던 탭의 current css를 제거하고 
		$('.tab-content').removeClass('current');		

		$(this).addClass('current');								////선택된 탭에 current class를 삽입해줍니다.
		$("#" + tab_id).addClass('current');
	})
});

/* fullcalendar 관련 코드
document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		headerToolbar : { // 헤더에 표시할 툴 바
			start : 'prev next',
			center : 'title',
			end : 'dayGridMonth,dayGridWeek,dayGridDay'
		},
		titleFormat : function(date) {
			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		},
		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		selectable : true, // 달력 일자 드래그 설정가능
    	selectMirror: true,
 		// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
  		select: function(arg) {
    	  console.log(arg);

        var title = prompt('입력할 일정:');
  		//title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay,
            backgroundColor: "yellow",
            textColor:"blue"
          })
        }
        calendar.unselect()
      },
	  eventClick: function(arg) {
    	  // 있는 일정 클릭시,
    	  console.log("#등록된 일정 클릭#");
    	  console.log(arg.event);
    	  
        if (confirm('일정을 삭제하시겠습니까?')) {
          arg.event.remove()
        }
      },
	  droppable : true,
	  editable : true,
	  dayMaxEvents: true, // allow "more" link when too many events
	  nowIndicator: true, // 현재 시간 마크
	  locale: 'ko' // 한국어 설정  
	});
	calendar.render();
}); */