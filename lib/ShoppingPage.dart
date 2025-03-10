// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shoes_app/product_details.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({
    super.key,
  });

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Map<String, dynamic>> shoesList = getShoesList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(),
          FilterList(),
          ProductsList(shoesList: shoesList),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              hintStyle:
                  TextStyle(color: const Color.fromARGB(255, 51, 51, 51)),
              prefixIcon: Icon(Icons.search,
                  color: const Color.fromARGB(255, 51, 51, 51)),
            ),
            cursorColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ],
    );
  }
}

class FilterList extends StatefulWidget {
  const FilterList({
    super.key,
  });

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  final List<String> filters = const ["All", "Nike", "Addidas", "Puma"];
  late String selectedFilter = filters[0];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      side: BorderSide(color: Colors.transparent, width: 0)),
                  backgroundColor: selectedFilter == filters[index]
                      ? Theme.of(context).colorScheme.primary
                      : const Color.fromARGB(255, 255, 255, 255),
                  label: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(filters[index],
                        style: TextStyle(
                            fontSize: 13,
                            color: const Color.fromARGB(255, 66, 66, 66))),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.shoesList,
  });

  final List<Map<String, dynamic>> shoesList;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
        child: screenWidth < 650
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: shoesList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetails(product: shoesList[index]);
                      }));
                    },
                    child: Column(
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
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text("${shoesList[index]['price']}",
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Image.asset("${shoesList[index]['imageUrl']}",
                                  height: 150, width: 300),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of columns
                  childAspectRatio: 1.3, // aspect ratio of each child
                  crossAxisSpacing: 1, // spacing between columns
                  mainAxisSpacing: 1, // spacing between rows
                ),
                itemCount: shoesList.length, // number of items
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetails(product: shoesList[index]);
                      }));
                    },
                    child: Column(
                      children: [
                        Container(
                          width:double.infinity,
                          decoration: BoxDecoration(
                            color: index.isEven
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromARGB(255, 216, 216, 216),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(15),
                          margin: EdgeInsets.all(9),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${shoesList[index]['title']}",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text("${shoesList[index]['price']}",
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Image.asset("${shoesList[index]['imageUrl']}",
                                  height: 150, width: 300),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ));
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
    {
      'id': 4,
      'title': 'Converse 45',
      'price': 90.0,
      'size': [45, 47, 49, 50],
      'company': 'Converse',
      'imageUrl': 'assets/images/shoes_4.jpeg',
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
