let url = "ws://" + window.location.hostname + ":" + window.location.port + "/chat";
console.log(url);

let connect = false;
let socket = new WebSocket(url);

socket.onopen = function() {
	connect = true;
	alert("서버 연결 완료");
}

socket.onclose = function() {
	connect = false;
	alert("서버 연결 종료");
}

socket.onmessage = function(msg) {
	let chat = document.getElementById("chat");
	
	chat.innerHTML += "<li>" + msg.data + "</li>";
}

function send() {
	if(connect) {
		let msg = document.getElementById("msg");
		
		socket.send(msg.value);
		
		msg.value = "";
	}
}




// window.onload = function () {

//   document.getElementById('sendMessage').addEventListener('click', () => {

//     const item = document.getElementById("msg").value;

//     console.log(item);

//     fetch("../add", {
//       method: "POST",
//       headers: { 'Content-Type': 'application/json' },
//       body: JSON.stringify(item)
//     }).then(resp => {
//       if (resp.status == 200)
//         return resp.json();
//     }).then(result => {
//       console.log(result);

//       const message = document.querySelector("#message");
//       const div = makeItem(result);

//       console.log(message);
//       console.log(div);

//       message.append(div);
//     });
//   });

// };


// function makeItem(element) {
//   const div = document.createElement("div");
//   div.classList.add("list");

//   const head = document.createElement("p");
//   head.textContent = '${item.nickname}' + " | " + '${item.regDate}';
//   div.append(head);

//   const content = document.createElement("p");
//   content.textContent = '${item.content}';
//   div.append(content);

//   return div;
// };
