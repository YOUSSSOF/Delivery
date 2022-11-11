import 'package:flutter/material.dart';
import 'package:food_delivery/bindings.dart';
import 'package:food_delivery/routes/pages.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialRoute: Routes.splash,
      initialBinding: MyBindings(),
    );
  }
}
