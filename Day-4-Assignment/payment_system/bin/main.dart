import 'dart:io';
import 'package:payment_system/cart.dart';
void main(List<String> arguments) {
  var defaultCurrency = 1;
  var cart = Cart(defaultCurrency);
  print('---Welcome to the Shop---');
  cart.shopDetails();
  do {
    stdout.write('Enter the no. alongwith country to select resp. currency: ');
    defaultCurrency = int.parse(stdin.readLineSync());
  } while (!(defaultCurrency>0 && defaultCurrency <=cart.currenciesCount()));
  cart.changeCurrencyTo(defaultCurrency);
  int operation;
  do {
    print('\nOperations --\n\t1. Add item to the cart\n\t2. Change Currency');
    print('\t3. Generate List\n\t4. Generate Bill\n\t5. Exit');
    stdout.write('Enter the operation number you want to perform :');
    operation = int.parse(stdin.readLineSync());
    if (operation==1) {
      cart.productDetails();
      var productNum;
      do {
        stdout.write('Enter the no. alongwith the product :');
        productNum = int.parse(stdin.readLineSync());
      } while (!(productNum>0 && productNum <=cart.productsCount()));
      cart.addToCart(productNum);
      cart.showCartList();
    }else if(operation==2) {
      cart.acceptableCurrencies();
      do {
        stdout.write('Enter the no. alongwith country to select resp. currency: ');
        defaultCurrency = int.parse(stdin.readLineSync());
      } while (!(defaultCurrency>0 && defaultCurrency <=cart.currenciesCount()));
      cart.changeCurrencyTo(defaultCurrency);
    }else if(operation==3) {
      cart.showCartList();
    }else if(operation==4) {
      cart.generateBill();
    }
  } while (operation!=5);
}