import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishlist_page.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context);

    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/cart'),
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          clipBehavior: Clip.antiAlias,
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: backgroundColor4,
              currentIndex: pageProvider.currentIndex,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: (value) => pageProvider.currentIndex = value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                      color: pageProvider.currentIndex == 0
                          ? primaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 40,
                    ),
                    child: Image.asset(
                      'assets/icon_chat.png',
                      width: 20,
                      color: pageProvider.currentIndex == 1
                          ? primaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 40,
                    ),
                    child: Image.asset(
                      'assets/icon_wishlist.png',
                      width: 22,
                      color: pageProvider.currentIndex == 2
                          ? primaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 18,
                      color: pageProvider.currentIndex == 3
                          ? primaryColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ChatPage();
        case 2:
          return const WishlistPage();
        case 3:
          return const ProfilePage();
        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor:
          pageProvider.currentIndex == 0 ? backgroundColor1 : backgroundColor3,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
