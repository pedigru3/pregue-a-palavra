import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/pages/bible/views/bible_tab.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/cart/cart_tab.dart';
import 'package:pregue_a_palavra/src/pages/home/home_tab.dart';
import 'package:pregue_a_palavra/src/pages/orders/orders_tab.dart';
import 'package:pregue_a_palavra/src/pages/profile/profile_tab.dart';

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
          CartTab(),
          OrderTab(),
          ProfileTab(),
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
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Compras",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Pedidos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_sharp),
              label: "Biblia",
            ),
          ]),
    );
  }
}
