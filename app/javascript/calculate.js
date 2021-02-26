window.addEventListener("load",calculate);

function calculate() {
  //計算対象を持ってくる
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input",() => {
    //計算対象を計算する
    const price = itemPrice.value;
    const tax = Math.floor(price / 10);
    const result = Math.floor(price - tax);

    //表示先を取得する
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    //表示先の表示を計算結果に差し替える
    addTaxPrice.innerHTML = `${tax}`
    profit.innerHTML = `${result}`
  });
}