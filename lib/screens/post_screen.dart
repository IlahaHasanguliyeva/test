import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/main.dart';
import 'package:project/model/product_model.dart';
import 'package:project/services/fav_list.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen(
      {super.key,
      required this.product,
      });

  final Product product;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  double textSize = 14;
  // bool isActive = true;

  void increaseTextSize() {
    setState(() {
      if (textSize < 18) {
        textSize += 2;
      }
    });
  }

  void decreaseTextSize() {
    setState(() {
      if (textSize > 14) {
        textSize -= 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 130,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.chevron_left,
                            color: Colors.white,
                            size: 25,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<FavListProvider>().favAdd(widget.product);
                              },
                              icon: const Icon(
                                Icons.bookmark_add,
                                color: Colors.white,
                                size: 25,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share_sharp,
                                color: Colors.white,
                                size: 25,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                  flex: 14,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // subtype
                        Text(
                          widget.product.category,
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // Headline
                        SizedBox(
                          width: 350,
                          child: Text(
                            widget.product.title,
                            style: GoogleFonts.lato(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        // date
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/cnn.png',
                              width: 15,
                              height: 15,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'CNN - April 21, 2024',
                              style: GoogleFonts.lato(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            widget.product.imageUrl,
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Image text
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Pexels.com',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // Paragpah
                        Text(
                          widget.product.description * 10,
                          style: GoogleFonts.lato(
                            fontSize: textSize,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: textSize < 18 ? increaseTextSize : null,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.orange,
                              disabledBackgroundColor:
                                  const Color.fromARGB(162, 255, 153, 0)),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        IconButton(
                          onPressed: textSize > 14 ? decreaseTextSize : null,
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 20,
                          ),
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.orange,
                              disabledBackgroundColor:
                                  const Color.fromARGB(162, 255, 153, 0)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
