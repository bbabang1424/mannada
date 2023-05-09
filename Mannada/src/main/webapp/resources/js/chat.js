
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
