window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  console.log("イベント発火");
  const addTaxDom_Commission = document.getElementById("add-tax-price");
  addTaxDom_Commission.innerHTML = Math.round(priceInput.value * 0.1);
  const addTaxDom_Profit = document.getElementById("profit");
    addTaxDom_Profit.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
})
});





