window.addEventListener("load", () => {

    getPage(1);

    document.querySelector(".search_btn").addEventListener("click", e => {
        const search = document.querySelector("select[name='search']").value;
        const keyword = document.querySelector("input[name='keyword']").value;

        getPage(1, { search, keyword });
    });


    // 모달 닫기 버튼
    document.querySelector(".btn-close").addEventListener("click", e => {
    });


    // 참여 버튼
    document.querySelector("#join_btn").addEventListener("click", e => {
        const mannaId = 1;

        fetch("/addJoin/" + mannaId, {
            method: "POST",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify()
        }).then(resp => {
            if (resp.status == 200)
                return resp.json();
        }).then(result => {
            document.querySelector("#join_btn").textContent = "참여 취소";
        });

    });


    // 참여 취소 버튼
    document.querySelector("#join_btn.cancle").addEventListener("click", e => {
        const mannaId = 9;

        fetch("/deleteJoin/" + mannaId, {
            method: "DELETE",
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify()
        }).then(resp => {
            if (resp.status == 200)
                return resp.json();
        }).then(result => {
            document.querySelector("#join_btn").textContent = "참여";
        });

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
                const box = document.querySelector(".card_box");
    
                result.list.forEach(element => {
                    const item = makeItem(element);
    
                    box.append(item);
                });
            };

            if(page >= result.pager.last || window.location.pathname == '/'){
                document.querySelector("#more-btn").classList.add("hide");
            }
            

        });
}



function makeItem(element){
    const id = element.id;

    const a = document.createElement("a")
    if(window.location.pathname == '/')
        a.href = "manna/detail/" + id; // 메인페이지용으로 if문 추가
    else 
        a.href = "detail/" + id;


    const card = document.createElement("div");
    card.classList.add("card");

    // 모달 만들던 것 -이현주
    // card.addEventListener("click", e => {
    //     const id = element.id;

    //     fetch("/api/item/" + id)
    //     .then(resp => resp.json())
    //     .then(result => {
    //         e.preventDefault();  
    //         const memberBox = document.querySelector(".member_num");
            
    //         for(var i in result.member){
    //             const nameDiv = document.createElement("div");
    //             nameDiv.textContent = result.member.nickname;

    //             memberBox.append(nameDiv);
    //         };
            
    //         document.querySelector(".model_Category").textContent = "[" + result.item.category_ + "]";
    //         document.querySelector(".model_address").innerHTML = '<i class="bi bi-geo-alt"></i> ' + result.item.address;
    //         document.querySelector(".model_title h4").textContent = result.item.title;
    //         document.querySelector(".model_Writer").textContent = "작성자: " + result.item.nickname;
    //         document.querySelector(".model_grade").innerHTML = '<i class="bi bi-star"></i> ' + result.item.star;
    //         document.querySelector(".model_views").innerHTML = '<i class="bi bi-eye"></i> ' + result.item.viewCnt;
    //         document.querySelector(".model_date").innerHTML = '<i class="bi bi-calendar-check"></i> ' + result.item.dDay;
            
    //         document.querySelector(".model_personnel span").textContent = "참여 현황: " + result.item.sum + "/" + result.item.member;
    //         document.querySelector("#model_progress").value = result.item.sum;
    //         document.querySelector("#model_progress").max = result.item.member;
            
    //         document.querySelector(".model_text_box").innerHTML = result.item.content;

            
    //         if(result.status == 1){
    //             document.querySelector("#join_btn").textContent = "참여 취소";
    //         } else {
    //             document.querySelector("#join_btn").textContent = "참여";
    //         }
            
              
    //         const modal = new bootstrap.Modal(document.getElementById("detailModal"));
    //         modal.toggle(); 
            
    //     });
    // });


	const div = document.createElement("div");

    const category = document.createElement("div");
    category.classList.add("Category");

    const span = document.createElement("span");
    span.textContent = element["category_"];

    category.append(span);
    div.append(category);
    card.append(div);


    const title = document.createElement("div");
    title.classList.add("title");

    const h5 = document.createElement("h5");

    const strong = document.createElement("strong");
    strong.textContent = element["title"];

    h5.append(strong);
    title.append(h5);
    card.append(title);


    const line = document.createElement("div");
    line.classList.add("line");

    card.append(line);
    

    const nickname = document.createElement("div");
    nickname.classList.add("date_day");

    nickname.textContent = "작성자 : " + element["nickname"];
    
    card.append(nickname);
    
    
    const dDay = document.createElement("div");
    dDay.classList.add("interval");
   
    dDay.textContent = "D-day : " + element["dDay"];
    
    card.append(dDay);


    const member = document.createElement("div");
    member.classList.add("interval");

    member.textContent = "인원 : " + "(" + element["sum"] + "/" + element["member"] + ")";
    
    card.append(member);


    const progress = document.createElement("progress");
    progress.value = element["sum"];
    progress.max = element["member"];

    card.append(progress);
 

    a.append(card);
    return a;
}
