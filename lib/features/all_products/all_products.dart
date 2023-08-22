import 'dart:developer';

import 'package:api_practise/features/all_products/services/all_product_services.dart';
import 'package:flutter/material.dart';

import 'modal/all_product_modal.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  AllProductServices allProductServices = AllProductServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: allProductServices.getAllProducts(),
      builder: (BuildContext context, AsyncSnapshot<AllProductModal> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("loading...");
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          final data = snapshot.data;
          var product = data!.products;
          log(data.toString());
          return Column(
            children: [
              ...product!.map(
                (e) => InkWell(
                  onTap: () {
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
      },
    );
  }
}
