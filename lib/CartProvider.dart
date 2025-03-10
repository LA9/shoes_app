import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{


final List<Map<String , dynamic>> cartList = [] ;


void addCart(Map<String , dynamic> cart){
  cartList.add(cart);
  notifyListeners();
}

void removeCart(Map<String , dynamic> cart){
  cartList.remove(cart);
  notifyListeners();

}


}