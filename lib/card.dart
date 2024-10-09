import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardNew extends StatelessWidget {
  const CardNew({required this.onClick,super.key, required this.title, required this.category, required this.image});

  final void Function() onClick;
  final String title;
  final String category;
  final String image;
  

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onClick,
      child: SizedBox(
        height: 150,
        child: Card(
                color: Colors.transparent,
                elevation: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10.0), 
                            child: Image.network(
                              image,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                category,
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 160,
                                child: Text(title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                                        ),),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'CNN',
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    height: 6,
                                    width: 6,
                                    decoration: const BoxDecoration(
                                        color: Colors.grey, shape: BoxShape.circle),
                                  ),
                                  Text(
                                    'April 1',
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  const SizedBox(height: 10,),
                  Divider(
                    height: 12,
                    thickness: 1 ,
                    color: Colors.grey[300],
                  )
                  ],
                ),
              ),
      ),
    );
  }
}