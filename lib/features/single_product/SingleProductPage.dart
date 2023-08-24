import 'dart:developer';

import 'package:api_practise/features/single_product/provider/cart_provider.dart';
import 'package:api_practise/features/single_product/services/single_product_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modal/single_product_modal.dart';

class SingleProductPage extends StatefulWidget {
  final String id;
  const SingleProductPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SingleProductPage> createState() => _SingleProductPageState();
}

class _SingleProductPageState extends State<SingleProductPage> {
  SingleProductServices singleProductServices = SingleProductServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        actions: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              children: [
                const Icon(Icons.share_outlined),
                const SizedBox(
                  width: 14,
                ),
                Image.asset(
                  "images/unselheart_icon.png",
                  height: 24,
                )
              ],
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: singleProductServices.getSingleProduct(widget.id),
        builder:
            (BuildContext context, AsyncSnapshot<SingleProductModal> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading....");
          } else if (snapshot.hasError) {
            return Text("Error:${snapshot.error}");
          } else {
            final data = snapshot.data;
            return Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 2.0 / 1.0,
                      child: Image.network(
                        data!.thumbnail.toString(),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            " \$${data.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FittedBox(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  // height: 20,
                                  // width: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "images/unselstar_icon.png",
                                        height: 20,
                                        width: 20,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(data.rating.toString()),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                "Stocks Left: ${data.stock}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Text(
                            "Description",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            data.description.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          //bottom Navigation bar
                          Consumer<AddToCart>(
                            builder: (context, cartP, child) {
                              return Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // quantity container
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      height: 40,
                                      // width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              Provider.of<AddToCart>(context,
                                                      listen: false)
                                                  .decrementValue();
                                            },
                                            child: const Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Text(
                                            "${cartP.value}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Provider.of<AddToCart>(context,
                                                      listen: false)
                                                  .incrementValue();
                                            },
                                            child: const Text(
                                              "+",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // },
                                      // ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        cartP.cartProducts.add(data);

                                        log("Add to Cart Pressed");
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 10,
                                        ),
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Add to Cart",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    //add to cart button
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ));
          }
        },
      ),
    );
  }
}
