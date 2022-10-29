import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/config/custom_colors.dart';
import 'package:pregue_a_palavra/src/pages/cart/cart_tab.dart';
import 'package:pregue_a_palavra/src/pages/orders/orders_tab.dart';
import 'package:pregue_a_palavra/src/pages/profile/profile_tab.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const ProfileTab()));
          },
          child: DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Ink(
              color: CustomColors.primaryColor,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Felipe Ferreira da Silva',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            'ferreira@pregueapalavra.com',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Icon(
                      Icons.edit,
                      color: CustomColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => CartTab()));
          },
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Carrinho de compras'),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const OrderTab()));
          },
          leading: const Icon(Icons.list),
          title: const Text('Meus pedidos'),
        ),
      ]),
    );
  }
}
