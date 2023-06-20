window.addEventListener("load", () => {

    getNotice(1);
    getQnA(1);

});

function getNotice(page, query) {
    let url = `${notice_url}?page=${page}`;

    if (query)
        url += "&" + new URLSearchParams(query).toString();

    console.log(url);
        
	fetch(url)
        .then(resp => resp.json())
        .then(result => {
        
            if (result.notice_list.length)
                document.querySelector("#notice .empty").classList.add("hide");
            else
                document.querySelector("#notice .empty").classList.remove("hide");
            
            document.querySelector("#notice-more-btn").onclick = e => getPage(page + 1, query);


            // 더보기 조건    
            if(page <= result.notice_pager.last){
                const tbody = document.querySelector("#notice");
    
                result.notice_list.forEach(element => {
                    const item = makeNotice(element);
    
                    tbody.append(item);
                });
            };

            if(page >= result.notice_pager.last){
                document.querySelector("#notice-more-btn").classList.add("hide");
            }
        });
}

function makeNotice(element) {
    const tr = document.createElement("tr");

    notice_item.forEach( (item, i) => {
        const { name } = item;

        const td = document.createElement("td");
        
        if(name=="title"){
        	const a = document.createElement("a");
        	a.href = "/notice/detail/" + notice_item[i - 1];
        	
        	td.append(a);
        	td.textContent += element[name];
        }
        
        tr.append(td);
    });
    
    return tr;
}


function getQnA(page, query) {
    let url = `${qna_url}?page=${page}`;

    if (query)
        url += "&" + new URLSearchParams(query).toString();

    console.log(url);
        
	fetch(url)
        .then(resp => resp.json())
        .then(result => {
        
            if (result.qna_list.length)
                document.querySelector("#qna .empty").classList.add("hide");
            else
                document.querySelector("#qna .empty").classList.remove("hide");
            
            document.querySelector("#qna-more-btn").onclick = e => getPage(page + 1, query);


            // 더보기 조건    
            if(page <= result.qna_pager.last){
                const tbody = document.querySelector("#qna");
    
                result.qna_list.forEach(element => {
                    const item = makeQnA(element);
    
                    tbody.append(item);
                });
            };

            if(page >= result.qna_pager.last){
                document.querySelector("#qna-more-btn").classList.add("hide");
            }
        });
}

function makeQnA(element) {
    const tr = document.createElement("tr");

    qna_item.forEach(item => {
        const { name } = item;

        const td = document.createElement("td");
        
        if(name=="title"){
        	const a = document.createElement("a");
        	a.href = "/qna/detail/" + qna_item[i - 1];
        	
        	td.append(a);
        	td.textContent += element[name];
        }
        
        tr.append(td);
    });
    
    return tr;
}