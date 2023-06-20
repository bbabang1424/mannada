window.addEventListener("load", () => {

    getPage(1);

});

function getPage(page, query) {
    let url = `${pager_url}?page=${page}`;

    if (query)
        url += "&" + new URLSearchParams(query).toString();

    console.log(url);

    fetch(url)
        .then(resp => resp.json())
        .then(result => {
            if (result.list.length)
                document.querySelector("#empty_list").classList.add("hide");
            else
                document.querySelector("#empty_list").classList.remove("hide");

            document.querySelector(".pagination .page-next").onclick = e => getPage(result.pager.next, query);
            document.querySelector(".pagination .page-prev").onclick = e => getPage(result.pager.prev, query);
            document.querySelector(".pagination .page-last").onclick = e => getPage(result.pager.last, query);
            document.querySelector(".pagination .page-first").onclick = e => getPage(1, query);

            const pagination = document.querySelector(".pagination .page-next");

            document.querySelectorAll(".pagination .page-list").forEach(element => element.remove());

            result.pager.list.forEach(element => {
                const li = document.createElement("li");
                li.classList.add("page-item", "page-list");

                const link = document.createElement("div");
                link.classList.add("page-link");
                link.textContent = element;

                if (element == result.pager.page)
                    link.classList.add("active");

                link.addEventListener("click", e => getPage(element, query));

                li.append(link);

                pagination.before(li);
            });

            const tbody = document.querySelector("#list");

            tbody.querySelectorAll(".item").forEach(element => {
                element.remove();
            });

            result.list.forEach(element => {
                const item = makeItem(element);

                tbody.append(item);
            });
        });
}

function makeItem(element) {
    const tr = document.createElement("tr");
    tr.dataset.id = element.id;


    const profile = document.createElement("td");
    profile.style.cssText = 'width:5%; align:left; valign:top';

    const profile_box = document.createElement("div");
    profile_box.classList.add("profile_box")

    const img = document.createElement("img");
    img.classList.add("img");

    if (element.filename == null)
        img.src = "/upload/" + element.reply.uuid + "_" + element.reply.filename;
    else
        img.src = "/resources/image/profile.png";

    profile_box.append(img);
    profile.append(profile_box);


    const td = document.createElement("td");
    td.style.css.width = '0%';


    const reply = document.createElement("td");
    reply.style.cssText = 'margin: 5%; width: 51%';

    const reply_name_date = document.createElement("div");

    const reply_nickname = document.createElement("span");

    const c = document.createElement("a");
    c.href = "/user/view/" + element.item.num;
    c.style.color = "black";
    c.classList.add("c");
    c.textContent = element.reply.nickname;
    reply_nickname.append(c);
    reply_name_date.append(reply_nickname);

    const reply_arrow_box = document.createElement("p");
    reply_arrow_box.classList.add("reply_arrow_box");
    reply_arrow_box.textContent = "회원정보";
    reply_name_date.append(reply_arrow_box);

    const reply_date = document.createElement("span");
    var date = element.reply.regDate;
    const formatDate = (current_datetime) => {
        let formatted_date = current_datetime.getFullYear() + "-" + (current_datetime.getMonth() + 1) + "-" + current_datetime.getDate() + " " + current_datetime.getHours() + ":" + current_datetime.getMinutes();
        return formatted_date;
    }
    reply_date.textContent = formatDate(date);
    reply_name_date.append(reply_date);

    reply.append(reply_name_date);

    const content_info = document.createElement("div");
    content_info.classList.add("content_info", "${reply.id}");
    content_info.textContent = element.reply.content;

    reply.append(content_info);

    const reply_btn = document.createElement("div");
    if("${sessionScope.user.num == reply.num }"){
        //아무튼 버튼 만들기.. 
    }

    reply.append(reply_btn);


    return tr;
}