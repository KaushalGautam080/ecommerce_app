import 'dart:developer';

import 'package:api_practise/features/home_page/widgets/custom_cart_container.dart';
import 'package:api_practise/features/home_screen/home_screem.dart';
import 'package:api_practise/features/single_product/provider/cart_provider.dart';
import 'package:api_practise/page4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../page2.dart';
import '../../page3.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  final pages = [
    const HomeScreen(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawer: Drawer(
        child: Consumer<AddToCart>(
          builder: (context, value, child) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "My Cart",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                ...value.cartProducts.map(
                  (e) => CustomCartContainer(
                    price: e.price.toString(),
                    title: e.title.toString(),
                    quantity: value.value.toString(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 90,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(
              40,
            ),
          ),
        ),
        backgroundColor: Colors.yellow,
        centerTitle: false,
        title: const Text(
          "Discover",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              _drawerKey.currentState?.openEndDrawer();
              log("cart button pressed");
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 32,
              ),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black87,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "images/cart_icon.png",
                ),
              ),
            ),
          ),
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
            // color: Colors.black87.withOpacity(1),
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //home button
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: Tab(
                icon: pageIndex == 0
                    ? Image.asset("images/selectedHome.png")
                    : Image.asset("images/unSelectedHome.png"),
              ),
            ),
            //search button
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: Tab(
                icon: pageIndex == 1
                    ? SvgPicture.asset("images/selsearch_icon.svg")
                    : SvgPicture.asset("images/unselsearch_icon.svg"),
              ),
            ),
            //favorites button
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: Tab(
                icon: pageIndex == 2
                    ? Image.asset("images/selheart_icon.png")
                    : Image.asset("images/unselheart_icon.png"),
              ),
            ),
            //profile button
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: Tab(
                icon: pageIndex == 3
                    ? Image.asset("images/selperson_icon.png")
                    : Image.asset("images/unselperson_icon.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
