window.addEventListener('load', () => {

  //   nil == location.pathname
  // if (nil == /items/new){

  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price")
  addTaxDom.innerHTML = Math.floor(inputValue/10)
  const addLaxDom = document.getElementById("profit")
  addLaxDom.innerHTML = Math.floor(inputValue-inputValue/10)
  console.log(inputValue);
})
});

