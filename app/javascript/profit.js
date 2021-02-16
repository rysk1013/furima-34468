function profit() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', () => {
    const value = itemPrice.value;
    const taxPrice = value / 10;
    const profit = document.getElementById("profit");
    if (value < 10) {
      profit.innerHTML = Math.floor(value);
    } else {
      profit.innerHTML = Math.floor(value - taxPrice);
    }
  });
}
window.addEventListener('load', profit);