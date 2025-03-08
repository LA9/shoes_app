import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(cart[index]["title"]),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              setState(() {
                cart.removeAt(index);
              });
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                ],
                color: const Color.fromARGB(255, 226, 226, 226),
                border: Border.all(
                  color: Colors.white,
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 90,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: Image.asset(cart[index]["imageUrl"]),
                title: Text(cart[index]["title"]),
                subtitle: Text('\$${cart[index]["price"]}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

List cart = [
  {
    'id': "2",
    'title': "Nike Shoes",
    'price': "90",
    'imageUrl': "assets/images/shoes_1.jpeg",
    'company': "Nike",
    'size': "45",
  },
  {
    'id': "2",
    'title': "Addidas Shoes",
    'price': "70",
    'imageUrl': "assets/images/shoes_3.jpeg",
    'company': "Addidas",
    'size': "45",
  },
  {
    'id': "2",
    'title': "Addidas Shoes",
    'price': "70",
    'imageUrl': "assets/images/shoes_3.jpeg",
    'company': "Addidas",
    'size': "45",
  },
  {
    'id': "2",
    'title': "Addidas Shoes",
    'price': "70",
    'imageUrl': "assets/images/shoes_3.jpeg",
    'company': "Addidas",
    'size': "45",
  },
  {
    'id': "2",
    'title': "Addidas Shoes",
    'price': "70",
    'imageUrl': "assets/images/shoes_3.jpeg",
    'company': "Addidas",
    'size': "45",
  },


];
