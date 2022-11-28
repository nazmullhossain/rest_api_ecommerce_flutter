import 'package:flutter/material.dart';
import 'package:rest_api_ecommerce/pages/home_page.dart';

import 'consts/global_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter 3.0.4",
      theme: ThemeData(
        scaffoldBackgroundColor: lightScaffoldColor,
        primaryColor: lightCardColor,
        backgroundColor: lightBackgroundColor,
        appBarTheme: AppBarTheme(
         iconTheme: IconThemeData(
           color: lightIconsColor,
         ),
          backgroundColor: lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: lightTextColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,

          ),
          elevation: 0
        ),
        iconTheme: IconThemeData(
          color: lightIconsColor,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.blue,


        ),
        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: lightIconsColor,
          brightness: Brightness.light,
        )

      ),
      home: HomePage(),
    );
  }
}
