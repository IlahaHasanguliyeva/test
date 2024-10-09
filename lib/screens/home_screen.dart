// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/carousel.dart';
import 'package:project/card.dart';
import 'package:project/model/product_model.dart';
import 'package:project/services/product_api.dart';
import 'package:project/screens/post_screen.dart';
import 'package:project/services/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final productMdl = Provider.of<ProductProvider>(context, listen: false);
    productMdl.getProductsData();
  }

  @override
  Widget build(BuildContext context) {
    // final productMdl = Provider.of<ProductProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Breaking News',
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'See More',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      color: Colors.blue[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ))
            ],
          ),
          const Carousel(),
          // tabBar---------
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              child: DefaultTabController(
                initialIndex: 0,
                length: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        unselectedLabelStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        labelStyle: const TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const <Widget>[
                          Tab(
                            child: Text('Feeds'),
                          ),
                          Tab(
                            child: Text('Popular'),
                          ),
                          Tab(
                            child: Text('Following'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Center(
                            child: Consumer<ProductProvider>(
                                builder: (context, productProvider, child) {
                              if (productProvider.loading == false) {
                                final products = productProvider.posts;
                                return ListView.builder(
                                  itemCount: products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardNew(
                                        onClick: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PostScreen(
                                                        product:
                                                            products[index],
                                                      )));
                                        },
                                        title: products[index].title,
                                        category:
                                            products[index].category,
                                        image:
                                            products[index].imageUrl);
                                  },
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                            // child: SingleChildScrollView(
                            //   child: Column(
                            //     children: [
                            //        Text('data'),
                            // CardNew(
                            //   onClick: postPage,
                            // ),
                            // CardNew(
                            //   onClick: postPage,
                            // ),
                            // CardNew(
                            //   onClick: postPage,
                            // ),
                            // CardNew(
                            //   onClick: postPage,
                            // ),
                            //     ],
                            //   ),
                            // ),
                          ),
                          const Center(
                            child: Text("b"),
                          ),
                          const Center(
                            child: Text("c"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
