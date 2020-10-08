function calc() {
  const itemPrice = document.getElementById("item-price").value;
  const addTaxPrice = Math.round(itemPrice * 0.1);
  const Profit = Math.round(itemPrice * 0.9);
  input_addTaxPrice = document.getElementById("add-tax-price");
  input_addTaxPrice.innerHTML = addTaxPrice;
  input_Profit = document.getElementById("profit");
  input_Profit.innerHTML = Profit;
}
setInterval(calc, 100);