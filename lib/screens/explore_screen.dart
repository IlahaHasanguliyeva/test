import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/card.dart';
import 'package:project/model/product_model.dart';
import 'package:project/services/product_api.dart';
import 'package:project/screens/post_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                textAlign: TextAlign.left,
                style: GoogleFonts.lato(
                  fontSize: 16,
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
          Expanded(
            child: FutureBuilder<List<Product>>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final products = snapshot.data;
                    if (products == null) {
                      return const SizedBox.shrink();
                    }
            
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CardNew(
                            onClick: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostScreen(
                                         product: products[index])));
                            },
                            title: products[index].title,
                            category: products[index].category,
                            image: products[index].imageUrl);
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
