import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 25,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
