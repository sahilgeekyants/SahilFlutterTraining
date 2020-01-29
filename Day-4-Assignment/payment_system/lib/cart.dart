class Cart{
  var products = {'Product1':500,'Product2':345,'Product3':670,'Product4':400}; // 'Product name':Price 
  List<int> productsAddedInCart = [0,0,0,0];     // its Length must be equal to number of product types
  var currencies = {1:['USA','DOLLAR','\$',1.0000]
                 ,2:['INDIA','RUPEE','₹',71.2651]
                 ,3:['CHINA','YUAN','¥',6.93837]
                 ,4:['RUSSIA','RUBLE','₽',62.7485]
                 ,5:['FRANCE','EURO','€',0.908970]};        // base currency is ($) DOLLAR here 
  int currencySelected;
  var rupeeValueinDollar = 71.2651;
  Cart(int currencyNumber ){
    currencySelected = currencyNumber;
  }
  void addToCart(int productNumber){
    productsAddedInCart[productNumber-1]++;
  }
  void removeFromCart(int productNumber){
    productsAddedInCart[productNumber-1]--;
  }
  void showCartList(){
    print('\nItems added in cart--\n');
    var flag = 0;
    for(var index=0; index < productsAddedInCart.length ; index++){
      if(productsAddedInCart[index]!=0){
        flag = 1;
        print('${productsAddedInCart[index]} unit of ${products.keys.elementAt(index)}');
      }
    }
    if(flag == 0){
      print('Cart is empty!\n');
    }
  }
  void generateBill(){
    showCartList();
    print('\n---------------------- Bill ---------------------\n');
    print('Currency -> (${currencies[currencySelected].elementAt(2)}) ${currencies[currencySelected].elementAt(1)} - ${currencies[currencySelected].elementAt(0)}');
    double currencyValue = currencies[currencySelected].elementAt(3);
    var totalAmount = 0.00;
    double productAmount ;
    for(var index=0; index < productsAddedInCart.length ; index++){
      productAmount = products.values.elementAt(index)*productsAddedInCart[index]*currencyValue ;
      totalAmount += productAmount;
      if(productAmount!=0){
        productAmount /= rupeeValueinDollar;   // because the given price is in ₹
        print('\t${productsAddedInCart[index]} unit of ${products.keys.elementAt(index)} = ${currencies[currencySelected].elementAt(2)} ${productAmount}');
      }
    }
    totalAmount /=  rupeeValueinDollar;   // because the given price is in ₹
    print(' -------------------------------------------------');
    print('\tTotal bill amount  = ${currencies[currencySelected].elementAt(2)} ${totalAmount}');
  }
  void changeCurrencyTo(int currencyNumber){
    currencySelected = currencyNumber;
    print('Currency changed to -> (${currencies[currencySelected].elementAt(2)}) ${currencies[currencySelected].elementAt(1)} - ${currencies[currencySelected].elementAt(0)}');
    
  }
  int productsCount(){
    return products.length;
  }
  int currenciesCount(){
    return currencies.length;
  }
  void productDetails(){
    var iterator = 1;
    print('We have following products in our store--');
    for(var entry in products.entries){
      print('${iterator++}. ${entry.key} : Price ₹${entry.value}');
    }
  }
  void acceptableCurrencies(){
    print('\nWe accept payment in following countries currencies--');
    for(var entry in currencies.entries){
      print('${entry.key}.  (${entry.value.elementAt(2)}) ${entry.value.elementAt(0)} - ${entry.value.elementAt(1)}');
    }
  }
  void shopDetails(){
    productDetails();
    acceptableCurrencies();
  }
}