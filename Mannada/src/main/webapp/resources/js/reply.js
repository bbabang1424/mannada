window.addEventListener("load", () => {
    document.getElementById("add").addEventListener("click", e => {
        const modal = new bootstrap.Modal(document.getElementById("addModal"));
        modal.toggle();
    });

    document.querySelector("#addModal .submit").addEventListener("click", e => {
        const item = {};

        document.querySelectorAll("#addModal .pager-item").forEach(element => {
            item[element.name] = element.value
        });

        console.log(item);

        fetch(pager_url, {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(item)
        }).then(resp => {
            if (resp.status == 200)
                return resp.json();
        }).then(result => {
            console.log(result);

            const tbody = document.querySelector("#empty_list");
            const tr = makeItem(result);

            console.log(tbody);
            console.log(tr);

            tbody.after(tr);
        });
    });

    document.querySelector("#updateModal .submit").addEventListener("click", e => {
        const item = {};

        document.querySelectorAll("#updateModal .pager-item").forEach(element => {
            item[element.name] = element.value;
        });

        console.log(item);

        fetch(pager_url, {
            method: "PUT",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(item)
        }).then(resp => {
            if (resp.status == 200)
                return resp.json();
        }).then(result => {
            console.log(result);

            const tr = document.querySelector(`#list tr[data-id='${result.id}']`);

            pager_item.forEach(item => {
                if (item.select) {
                    tr.querySelector(`.${item.name}`).textContent = result[item.name];
                    tr.querySelector(`.${item.name}`).textContent = result[`${item.name}_`];

                } else {
                    tr.querySelector(`.${item.name}`).textContent = result[item.name];

                    if (item.suffix)
                        tr.querySelector(`.${item.name}`).textContent += item.suffix;
                }
            });
        });
    });

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
    profile.style.cssText  = 'width:5%; align:left; valign:top';

    const profile_box = document.createElement("div");
    profile_box.classList.add("profile_box")
    
    const img = document.createElement("img");
    img.classList.add("img");
    
    if(element.filename == null)
        img.src = "/upload/${element.uuid}_${element.filename}";
    else
        img.src = "/resources/image/profile.png";
    
    profile_box.append(img);
    profile.append(profile_box);


    const td = document.createElement("td");
    td.style.css.width='0%';


    const reply = document.createElement("td");
    reply.style.cssText  = 'margin: 5%; width: 51%';

    return tr;
}