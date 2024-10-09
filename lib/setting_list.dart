import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingList extends StatelessWidget {
  const SettingList(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.notifications,
            size: 18,
            color: Colors.orange,
          ),
          title: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
          height: 0,
        )
      ],
    );
  }
}
