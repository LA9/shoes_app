import 'package:flutter/material.dart';
import 'package:shoes_app/CartPage.dart';
import 'package:shoes_app/ShoppingPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [ShoppingPage(), CartPage()];
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.grey,
          currentIndex: currentPageIndex,
          onTap: (value) {
            setState(() {
              currentPageIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          ]),
    );
  }
}

class CartProduct {
  CartProduct(int id, String title, int price, int size, String company,
      String imageUrl);

  CartProduct getCartProduct() {
    return CartProduct(
        1, "Nike Air Max", 90, 45, "nike", 'assets/images/shoes_4.jpeg');
  }
}
