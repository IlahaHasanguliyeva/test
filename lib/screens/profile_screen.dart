import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/profile_cards.dart';
import 'package:project/setting_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // profile pic
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/blu.png'),
                  radius: 60,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'User Name',
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'UserName@gmail.com',
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Icon(
                      Icons.edit_square,
                      color: Colors.orange,
                      size: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
          // info cards
          Container(
            margin: const EdgeInsets.symmetric(vertical: 25),
            child: const SingleChildScrollView(
              child: Row(
                children: [
                  InfoCard('25', 'subTitle'),
                  InfoCard('5', 'subTitle'),
                  InfoCard('3', 'subTitle'),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // setting
          Text(
            'Settings',
            style: GoogleFonts.montserrat(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          // setting list
          const SettingList('Notifications Center'),
          const SettingList('Change Password'),
          const SettingList('Languages'),
          // const SettingList('FAQs'),
          // log out button
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    width: 2.0, color: Colors.orange), // Border width and color
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.logout,
                    size: 20,
                    color: Colors.red,
                  ),
                  Text(
                    'Log out',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
