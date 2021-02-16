function tax() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', () => {
    const value = itemPrice.value; 
    const taxPrice = Math.floor(value / 10);
    const addTaxContent = document.getElementById("add-tax-price");
    if (value < 10) {
      addTaxContent.innerHTML = 0;
    } else {
      addTaxContent.innerHTML = `${taxPrice}`;
    }
  });
}
window.addEventListener('load', tax);