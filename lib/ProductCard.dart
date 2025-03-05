// ignore: file_names
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> shoesList = getShoesList();
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: shoesList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: index.isEven
                      ? Theme.of(context).colorScheme.primary
                      : const Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${shoesList[index]['title']}",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("${shoesList[index]['price']}",
                        style: Theme.of(context).textTheme.titleSmall),
                    Image.asset("${shoesList[index]['imageUrl']}",
                        height: 150, width: 300),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Map<String, dynamic>> getShoesList() {
  return [
    {
      'id': 1,
      'title': 'Nike Air Max',
      'price': 120.0,
      'size': [45, 47, 49, 50],
      'company': 'Nike',
      'imageUrl': 'assets/images/shoes_1.jpeg',
    },
    {
      'id': 2,
      'title': 'Adidas Superstar',
      'price': 100.0,
      'size': [45, 47, 49, 50],
      'company': 'Adidas',
      'imageUrl': 'assets/images/shoes_2.jpeg',
    },
    {
      'id': 3,
      'title': 'Converse Chuck Taylor',
      'price': 80.0,
      'size': [45, 47, 49, 50],
      'company': 'Converse',
      'imageUrl': 'assets/images/shoes_3.jpeg',
    },

    {
      'id': 4,
      'title': 'Converse 45',
      'price': 90.0,
      'size': [45, 47, 49, 50],
      'company': 'Converse',
      'imageUrl': 'assets/images/shoes_4.jpeg',
    },

    // Add more shoes to the list...
  ];
}
