const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formDate = new FormData(formResult);

    const card = {
      number: formDate.get("order_address[number]"),
      exp_month: formDate.get("order_address[exp_month]"),
      exp_year: `20${formDate.get("order_address[exp_year]")}`,
      cvc: formDate.get("order_address[cvc]"),
    };

    Payjp.createToken(card,(status, response) => {
      if (status == 200){
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name="token" type=hidden >`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};
addEventListener("load",pay);