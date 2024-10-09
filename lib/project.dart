import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/explore_screen.dart';
import 'package:project/app_bar_icons.dart';
import 'package:project/screens/saved_screen.dart';
import 'package:project/screens/profile_screen.dart';
import 'package:project/profile_bar.dart';
// import 'package:http/http.dart' as http;

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int currentPage = 0;

  final List<Widget> body = [
    const HomeScreen(),
    const ExploreScreen(),
    const SavedPosts(),
    const ProfileScreen(),
  ];

  final List<PreferredSizeWidget> appBarIcon = [
    const AppBarIcons(),
    const AppBarIcons(),
    const AppBarIcons(),
    const ProfileBar(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: appBarIcon[currentPage],
          body: IndexedStack(
            index:currentPage ,
            children:body,
          ),
          // navbar
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.orange,
            ),
            child: BottomNavigationBar(
              currentIndex: currentPage,

              onTap: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              // fixedColor: Colors.red,
              // backgroundColor: Colors.blue,
              selectedItemColor: Colors.grey[50],
              unselectedItemColor: const Color.fromARGB(171, 255, 255, 255),
              iconSize: 35,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
