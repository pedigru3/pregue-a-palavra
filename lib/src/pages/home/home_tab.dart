import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pregue_a_palavra/src/config/app_data.dart' as app_data;
import 'package:pregue_a_palavra/src/models/item_model.dart';
import 'package:pregue_a_palavra/src/pages/common_widgets/custom_text_field.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/home/components/category_tile.dart';
import 'package:pregue_a_palavra/src/pages/home/components/item_tile.dart';
import 'package:pregue_a_palavra/src/services/remote_service.dart';

import '../cart/cart_tab.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String categorySelected = "";

  List<ItemModel>? itens = [];
  bool isLoaded = false;

/*
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    itens = await RemoteService().getItens();
    if (itens != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Image(
          image: AssetImage('images/icon.png'),
          height: 80,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartTab()));
              },
              child: Badge(
                position: const BadgePosition(top: 10, start: 10),
                badgeColor: CustomColors.primaryColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.secondaryColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // Campo de pesquisa
          const Padding(
            padding: EdgeInsets.all(10),
            child: CustomTextField(
              hintText: "Pesquise aqui...",
              prefixIcon: Icons.search,
              isDarkMode: false,
              backgroundColor: Colors.white,
              removeBorder: true,
            ),
          ),
          // Categorias
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        categorySelected = app_data.categories[index];
                      });
                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == categorySelected,
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: app_data.categories.length),
          ),
          // Grid
          Expanded(
            child: MasonryGridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                itemCount: app_data.listItems.length,
                itemBuilder: (_, index) =>
                    ItemTile(item: app_data.listItems[index])),
          )
        ],
      ),
    );
  }
}
