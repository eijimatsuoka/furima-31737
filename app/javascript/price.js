window.addEventListener('load', function(){
  const path = location.pathname
  if (path == "/items/new" || path == "/items"){
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
  }
})