import 'dart:developer';

import 'package:api_practise/features/category_display/services/category_display_services.dart';
import 'package:api_practise/features/single_product/SingleProductPage.dart';
import 'package:flutter/material.dart';

import 'modal/product_modal.dart';

class DisplayCategory extends StatefulWidget {
  final String category;
  const DisplayCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<DisplayCategory> createState() => _DisplayCategoryState();
}

class _DisplayCategoryState extends State<DisplayCategory> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiServices.getCategory(widget.category),
        builder: (BuildContext context, AsyncSnapshot<ProductModal> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading....");
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final data = snapshot.data;
            var product = data!.products;
            // log("PRODUCTS:$product");

            return Column(
              children: [
                ...product!.map(
                  (e) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SingleProductPage(
                            id: e.id.toString(),
                          ),
                        ),
                      );
                      log("${e.id} pressed");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(bottom: 12, left: 32),
                      width: 250,
                      color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            // height: 150,
                            child: Image.network(
                              e.thumbnail.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(e.brand.toString()),
                              const Icon(Icons.heart_broken),
                            ],
                          ),
                          Text(
                            e.title.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                height: 30,
                                child: Row(
                                  children: [
                                    const Icon(Icons.star),
                                    Text(e.rating.toString()),
                                    Text(e.stock.toString()),
                                  ],
                                ),
                              ),
                              Text(
                                "\$ ${e.price}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
