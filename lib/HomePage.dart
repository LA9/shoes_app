import 'package:flutter/material.dart';
import 'package:shoes_app/ProductCard.dart';
import 'package:shoes_app/product_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ["All", "Nike", "Addidas", "Puma"];

  late String selectedFilter = filters[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("Shoes\nCollections",
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Expanded(
                child: TextField(
                  cursorWidth: 0.5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0)
                            .withOpacity(0.5)),
                    prefixIcon: Icon(Icons.search,
                        color: const Color.fromARGB(255, 51, 51, 51)),
                  ),
                  cursorColor: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filters[index];
                        });
                      },
                      child: Chip(
                        shape: StadiumBorder(
                            side: BorderSide(
                                color: Colors.transparent, width: 0)),
                        backgroundColor: selectedFilter == filters[index]
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromARGB(255, 255, 255, 255),
                        label: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(filters[index],
                              style: TextStyle(
                                  fontSize: 13,
                                  color:
                                      const Color.fromARGB(255, 66, 66, 66))),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ProductCard(),
        ],
      ),
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
