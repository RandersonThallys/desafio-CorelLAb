import 'package:corelab_app_challenge/src/shared/widgets/custom_bottomnavigationbar_widget.dart';
import 'package:corelab_app_challenge/src/view/announce_page.dart';
import 'package:corelab_app_challenge/src/view/categories_page.dart';
import 'package:corelab_app_challenge/src/view/favorites_page.dart';
import 'package:corelab_app_challenge/src/view/home_page.dart';
import 'package:corelab_app_challenge/src/view/profile_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const CustomBottomNavigationBar(),
        '/home': (context) => const HomePage(),
        '/categories': (context) => const CategoriesPage(),
        '/announce': (context) => const AnnouncePage(),
        '/favorites': (context) => const FavoritesPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
