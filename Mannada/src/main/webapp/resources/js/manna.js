window.addEventListener("load", () => {

    getPage(1);

    document.getElementById("search-btn").addEventListener("click", e => {
        const search = document.querySelector("select[name='search']").value;
        const keyword = document.querySelector("input[name='keyword']").value;

        getPage(1, { search, keyword });
    });
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
            
            
            document.querySelector("#more-btn").onclick = e => getPage(page + 1, query);


            // 더보기 조건    
            if(page <= result.pager.last){
                const box = document.querySelector("#card-box");
    
                result.list.forEach(element => {
                    const item = makeItem(element);
    
                    box.append(item);
                });
            };

            if(page >= result.pager.last){
                document.querySelector("#more-btn").classList.add("hide");
            }
                
        });
}



function makeItem(element){
    const link = document.createElement("a");

    const card = document.createElement("div");
    card.classList.add("card");    


    const category = document.createElement("div");
    category.classList.add("category");

    const span = document.createElement("span");
    span.textContent = element["category_"];

    category.append(span);
    card.append(category);


    const title = document.createElement("div");
    category.classList.add("title");

    const h5 = document.createElement("h5");
    h5.textContent = element["title"];

    title.append(h5);
    card.append("title");


    const line = document.createElement("div");
    category.classList.add("line");

    card.append(line);


    const i = document.createElement("i");
    i.classList.add("bi", "bi-check");

    const address = document.createElement("div");
    address.classList.add("address");

    address.append(i);
    address.textContent = element["address"];
    
    card.append(address);
    
    
    const dDay = document.createElement("div");
    dDay.classList.add("dDay");
    
    dDay.append(i);
    dDay.textContent = element["dDay"];
    
    card.append(dDay);


    const member = document.createElement("div");
    member.classList.add("member");

    member.append(i);
    member.textContent = "(" + element["sum"] + "/" + element["member"] + ")";
    
    card.append(member);


    const progress = document.createElement("progress");
    progress.value = element["sum"];
    progress.max = element["member"];

    card.append(progress);
    
    
    link.append(card);


    return link;
}
