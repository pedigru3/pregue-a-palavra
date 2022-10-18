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
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(child: SizedBox()),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://scontent.fbjp4-1.fna.fbcdn.net/v/t31.18172-8/15975012_10207891610557733_7646344930308295705_o.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeGGYV452Uvqqs5Y1-WB6MAbzr1mOyPhMzDOvWY7I-EzMGcdMBupw5Z853I2nyfGnRM&_nc_ohc=HajpmZtpe6QAX_p2nrG&_nc_ht=scontent.fbjp4-1.fna&oh=00_AT-lgQ5MTzihJwAeueOd9g-tJLNMTAY5ti3VCZg5sejprw&oe=637263A5'),
                      radius: 35,
                    ),
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
