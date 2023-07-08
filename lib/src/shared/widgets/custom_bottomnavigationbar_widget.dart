import 'package:corelab_app_challenge/src/controller/bottommenu_controller.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_colors.dart';
import 'package:corelab_app_challenge/src/shared/theme/app_typography.dart';
import 'package:corelab_app_challenge/src/view/announce_page.dart';
import 'package:corelab_app_challenge/src/view/categories_page.dart';
import 'package:corelab_app_challenge/src/view/favorites_page.dart';
import 'package:corelab_app_challenge/src/view/home_page.dart';
import 'package:corelab_app_challenge/src/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomMenuController controller = BottomMenuController();
    List<Widget> screens = [
      const HomePage(),
      const CategoriesPage(),
      const AnnouncePage(),
      const FavoritesPage(),
      const ProfilePage(),
    ];
    return Observer(
      builder: (context) {
        return Scaffold(
          body: Observer(builder: (_) => screens[controller.currentIndex]),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            onTap: controller.onTabTapped,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: AppTypography().textBottomMenu,
            unselectedLabelStyle: AppTypography().textBottomMenu,
            selectedItemColor: AppColors().textLightBlue,
            unselectedItemColor: AppColors().textGray,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/bottom_menu_icons/home_off.png'),
                ),
                activeIcon: ImageIcon(
                  AssetImage('assets/icons/bottom_menu_icons/home_on.png'),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                      'assets/icons/bottom_menu_icons/categories_off.png'),
                ),
                activeIcon: ImageIcon(
                  AssetImage(
                      'assets/icons/bottom_menu_icons/categories_on.png'),
                ),
                label: 'Categorias',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/icons/bottom_menu_icons/new_off.png')),
                label: 'Anunciar',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(
                    'assets/icons/bottom_menu_icons/favorite_off.png')),
                label: 'Favoritos',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                    AssetImage('assets/icons/bottom_menu_icons/user_off.png')),
                label: 'Conta',
              ),
            ],
          ),
        );
      },
    );
  }
}
