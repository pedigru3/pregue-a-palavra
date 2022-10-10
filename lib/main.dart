import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pregue_a_palavra/src/pages/auth/controller/auth_controller.dart';
import 'package:pregue_a_palavra/src/pages/bible/controllers/bible_controller.dart';
import 'package:pregue_a_palavra/src/pages/cart/controllers/cart_controller.dart';
import 'package:pregue_a_palavra/src/pages_routes/app_pages.dart';
import 'package:provider/provider.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => CartController()),
        ChangeNotifierProvider(create: (_) => BibleController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white.withAlpha(190),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
        ),
        initialRoute: PagesRoute.splashRoute,
        routes: AppPages.pages,
      ),
    );
  }
}
