import 'package:api_practise/features/all_products/all_products.dart';
import 'package:api_practise/features/category_display/category_display.dart';
import 'package:api_practise/features/home_screen/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final ValueNotifier<String?> _selectedCategory = ValueNotifier<String?>(null);
  // @override
  // void dispose() {
  //   _selectedCategory.dispose();
  //   super.dispose();
  // }
  int selectedIndex = 0;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Tab(
                    icon: SvgPicture.asset(
                      "images/unselsearch_icon.svg",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
              ),
            ),
            //sale clearance container
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              // height: 150,
              width: 400,
              margin: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(
                  20,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Clearance Sales",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                          maxLines: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                            top: 20,
                          ),
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "%   Up to 50% ",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //categories text
            const Padding(
              padding: EdgeInsets.only(left: 32),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            //categories row
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
              ),
              child: FutureBuilder(
                future: getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final data = snapshot.data;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...data!.map(
                            (e) => InkWell(
                              onTap: () {
                                setState(() {
                                  // _selectedCategory.value = e;
                                  value = e;
                                  selectedIndex = e.length;
                                });

                                // log(_selectedCategory.value.toString());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(
                                  right: 5,
                                  top: 10,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: selectedIndex == e.length
                                      ? Colors.yellow
                                      : null,
                                  border: Border.all(color: Colors.black87),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(e.toString()),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            value != null
                ? DisplayCategory(
                    // category: _selectedCategory.value ?? "smartphones",
                    category: value.toString(),
                  )
                : const AllProducts(),
          ],
        ),
      ),
    );
  }
}
