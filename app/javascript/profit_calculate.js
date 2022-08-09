function profitCalculate (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(itemPrice.value * 0.1);

    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(itemPrice.value - Math.floor(itemPrice.value * 0.1));
  });
};

window.addEventListener('load', profitCalculate);
