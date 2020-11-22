window.addEventListener('load', function(){

  const priceGet = document.getElementById("item-price");

  priceGet.addEventListener('input',function(){
  const priceInput = document.getElementById("item-price").value;
  const Tax = document.getElementById("add-tax-price");
  const Prof = document.getElementById("profit");

  tax = priceInput / 10
  prof = priceInput - tax

  Tax.textContent = tax
  Prof.textContent = prof
})
})





// ①３箇所の要素を取得する（入力・手数料・利益）
// ②入力されたときにイベントを発火させる（inputイベント）
// ③入力された値を取得する
// ④計算をする（手数料・利益）
// ⑤取得した要素に対して、④で計算した値を貼り付ける