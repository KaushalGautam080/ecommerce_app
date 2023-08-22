import 'dart:developer';

import 'package:api_practise/features/home_screen/home_screem.dart';
import 'package:api_practise/page4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        height: 50,
        decoration: const BoxDecoration(
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
                    ? SvgPicture.asset("images/selhome_icon.svg")
                    : SvgPicture.asset("images/unselhome_icon.svg"),
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
