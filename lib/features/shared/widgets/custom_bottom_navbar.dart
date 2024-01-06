import 'package:app_cafe/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
//Agregar la dependencia de GoRouter para pusar el método go

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({super.key, required this.currentIndex});

  final bottomNavigationBar = const BoxDecoration(
    color: Colors.black12,
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );

  // void onItemTapped(BuildContext context, int index) {
  //   switch (index) {
  //     case 0:
  //       context.go('/home/0');
  //       break;
  //     case 1:
  //       context.go('/home/1');
  //       break;
  //     case 2:
  //       context.go('/home/2');
  //       break;
  //     default:
  //       context.go('/home/0');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5, top: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BottomNavigationBar(
          selectedFontSize: 14,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: AppTheme().getTheme().primaryColor,
          currentIndex: currentIndex,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: 'Profile'),
          ],
          onTap: (value) {},
          //onTap: (index) => onItemTapped(context, index),
        ),
      ),
    );
  }
}
