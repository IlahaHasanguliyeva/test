import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:project/project.dart';

class AppBarIcons extends StatelessWidget implements PreferredSizeWidget {
  const AppBarIcons({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16),
      child: AppBar(
        toolbarHeight: 80,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/blu.png'),
              radius: 30,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning',
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'User Name',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: <Widget>[
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
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
                  Icons.notifications,
                  color: Colors.white,
                  size: 25,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
