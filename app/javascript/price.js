function price(){
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price"); //販売手数料 
   const profit = document.getElementById("profit"); //販売利益
   
    priceInput.addEventListener('keyup', () => {     //数字入力時の非同期通信
       const value = priceInput.value; //金額、手数料、販売利益を定義
         
      if (value >= 300 && value <= 9999999){
        let fee = value * 0.1
        let gains = value - fee
        add_tax.textContent = fee;
        profit.textContent = gains;
    } else {
      let fee = '-';
      let gains = '-';
      add_tax.textContent = fee;
      profit.textContent = gains;
    }
  });

}
window.addEventListener('load', price);