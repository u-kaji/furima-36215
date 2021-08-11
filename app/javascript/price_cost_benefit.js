window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
price.addEventListener("input",() => {
  const priceValue = price.value;
  const cost = document.getElementById("add-tax-price");
  const benefit = document.getElementById("profit");
  cost.innerHTML = Math.floor(priceValue * 0.1);
  const costValue = cost.value;
  benefit.innerHTML = Math.floor(priceValue * 0.9);
});

})

