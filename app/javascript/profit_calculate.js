function profitCalculate (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(itemPrice.value * 0.1);

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.round(itemPrice.value - Math.round(itemPrice.value * 0.1));
  });
};

window.addEventListener('load', profitCalculate);
