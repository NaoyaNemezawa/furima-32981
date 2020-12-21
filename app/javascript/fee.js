function fee () {
  const itemprice = document.getElementById("item-price");
  itemprice.addEventListener("keyup",() => {
    const servicefee = Math.floor(itemprice.value/10)
    const addtaxprice = document.getElementById("add-tax-price");
    addtaxprice.innerHTML = servicefee;

    const profit = itemprice.value - servicefee;
    const grossprofit = document.getElementById("profit")
    grossprofit.innerHTML = profit;
  });
}
window.addEventListener("load",fee);