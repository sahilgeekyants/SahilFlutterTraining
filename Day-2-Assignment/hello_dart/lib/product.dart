class Product{
  String p_name;
  int p_price;
  int discount_percent;
  double real_price;
  Product(String p_name,int p_price,int discount_percent){
    this.p_name = p_name;
    this.p_price = p_price;
    this.discount_percent = discount_percent;
    real_price = p_price - p_price*discount_percent/100;
  }
  void getProductDetails(){
    print('Details of product are:\nName : ${p_name}\nPrice : Rs. ${p_price}\nDiscount : ${discount_percent}%\nActual price : Rs. ${real_price}');
  }
}