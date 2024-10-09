import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class InfoCard extends StatelessWidget {
  const InfoCard(this.title, this.subTitle, {super.key});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.orange,
        margin: const EdgeInsets.only(right: 16),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          title: Center(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          subtitle: Center(
            child: Text(
              subTitle,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
