import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/global_variable.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              //color: (_page == 0) ? primaryColor : secondaryColor,
              color: Color(0xFFffb247),
              size: 25,
            ),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_moderator_outlined,
                //color: (_page == 1) ? primaryColor : secondaryColor,
                color: Color(0xFFffb247),
                size: 25,
              ),
              label: 'Advice',
              ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                //color: (_page == 2) ? primaryColor : secondaryColor,
                color: Color(0xFFffb247),
                size: 25,
              ),
              label: 'Post',
              ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call_rounded,
              //color: (_page == 3) ? primaryColor : secondaryColor,
              color: Color(0xFFffb247),
              size: 25,
            ),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              //color: (_page == 4) ? primaryColor : secondaryColor,
              color: Color(0xFFffb247),
              size: 25,
            ),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}