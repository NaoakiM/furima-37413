window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const addTaxDom_Commission = document.getElementById("add-tax-price");
  addTaxDom_Commission.innerHTML = Math.floor(priceInput.value * 0.1);
  const addTaxDom_Profit = document.getElementById("profit");
    addTaxDom_Profit.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
})
});





