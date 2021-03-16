const tag = () => {
  if (location.pathname.match("/items/new")){
    const inputElement = document.getElementById("item-tag");       //タグ欄を変数代入
    inputElement.addEventListener("keyup", () => {                  //タグ欄に入力した時イベント発火
      const keyword = document.getElementById("item-tag").value;    //タグ欄の入力文字をkeywordとして変数代入
      const XHR = new XMLHttpRequest();                             //非同期通信用の変数XHRを用意
      XHR.open("GET", `search/?keyword=${keyword}`, true);          //XHRの動作を設定（keywordが対象）
      XHR.responseType = "json";                                    //JSON形式
      XHR.send();                                                   //JSから送信
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          console.log(XHR.response)
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("item-tag").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  };
};


window.addEventListener("load", tag);