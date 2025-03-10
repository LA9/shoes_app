import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/CartProvider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> cartList =
        context.watch<CartProvider>().cartList;

    return Scaffold(
      body: ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text('Confirm Deletion' ,style:TextStyle( fontWeight: FontWeight.bold)),
                    content: Text('Are you sure you want to delete this item?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel', style:TextStyle(color:Colors.green , fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                        onPressed: () {
                          context
                              .read<CartProvider>()
                              .removeCart(cartList[index]);

                          Navigator.of(context).pop();
                        },
                        child: Text('Delete', style:TextStyle(color:Colors.red, fontWeight: FontWeight.bold)),
                      ),
                    ],
                    
                  );
                },
              );
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
                leading: Image.asset(cartList[index]["imageUrl"]),
                title: Text(cartList[index]["title"]),
                subtitle: Text('\$${cartList[index]["price"]}'),
              ),
            ),
          );
        },
      ),
    );
  }
}

  // {
  //   'id': "2",
  //   'title': "Nike Shoes",
  //   'price': "90",
  //   'imageUrl': "assets/images/shoes_1.jpeg",
  //   'company': "Nike",
  //   'size': "45",
  // }
