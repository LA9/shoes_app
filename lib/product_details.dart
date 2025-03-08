import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int selectedSize =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details"),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text("${widget.product["title"]}",
                  style: Theme.of(context).textTheme.titleLarge),
              Spacer(),
              Image.asset("${widget.product["imageUrl"]}"),
              Spacer(flex: 1),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 30),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: const Color.fromARGB(255, 223, 223, 223),
                ),
                child: Column(
                  children: [
                    Text("\$${widget.product["price"]}",
                        style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.product["size"].length,
                        itemBuilder: (context, index) {
                        

                          return SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSize =
                                        widget.product["size"][index];
                                    print(" ss${selectedSize}");
                                    print("s${widget.product["size"][index]}");
                                  });
                                },
                                child: Chip(
                                  shape: StadiumBorder(
                                      side: BorderSide(
                                          color: Colors.black, width: 0.8)),
                                  backgroundColor: selectedSize ==
                                          widget.product["size"][index]
                                      ? Theme.of(context).colorScheme.primary
                                      : const Color.fromARGB(
                                          255, 255, 255, 255),
                                  label: Text(
                                      "${widget.product["size"][index]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              255, 66, 66, 66))),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 50, left: 50),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary, // or any other color
                          ),
                          onPressed: () {},
                          icon:Icon(Icons.add_circle , size:30, color:Colors.black),
                          label: Text("Add to cart",
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
