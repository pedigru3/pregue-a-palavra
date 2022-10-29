import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/pages/bible/views/bible_tab.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/home/home_tab.dart';
import 'package:pregue_a_palavra/src/pages/store/store_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          StoreTab(),
          BibleTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: CustomColors.primaryColor,
          fixedColor: Colors.white,
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
              pageController.jumpToPage(index);
            });
          },
          unselectedItemColor: Colors.white.withAlpha(100),
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: "Livraria",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp),
              label: "Biblia",
            ),
          ]),
    );
  }
}
