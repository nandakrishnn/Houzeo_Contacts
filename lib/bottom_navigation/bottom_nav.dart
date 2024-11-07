import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:houzeocontacts/view/home/favourites.dart';
import 'package:houzeocontacts/view/home/home_view.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  String? workerId;
  final ValueNotifier<bool> bottomNavBarVisible = ValueNotifier(true);


  List<Widget> get screens {
    // Ensure workerId is not null before creating the list
    return [
    
 const HomeContacts(),
 const Favourites()
    ];
  }

  void setPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.reverse) {
            bottomNavBarVisible.value = false;
          } else if (notification.direction == ScrollDirection.forward) {
            bottomNavBarVisible.value = true;
          }
          return true;
        },
        // Use IndexedStack to keep the state of each screen
        child: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: bottomNavBarVisible,
        builder: (context, isVisible, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isVisible ? kBottomNavigationBarHeight + 20 : 0,
            child: isVisible ? child : const SizedBox.shrink(),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 90, right: 90),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(149, 78, 73, 73),
                  offset: Offset(0, 0),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ],
              color: Color.fromARGB(255, 97, 100, 103), 
              borderRadius: BorderRadius.circular(35),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: GNav(
                haptic: true,
                color: AppColors.redColor,
                activeColor: AppColors.colorGray,
                gap: 8,
                onTabChange: setPage,
                padding: const EdgeInsets.all(16),
                textStyle:  const TextStyle(color: AppColors.colorGray,fontSize: 18),
                tabBackgroundColor: AppColors.backgroundColor,
                selectedIndex: currentIndex, // Ensure correct tab is highlighted
                tabs:  const [
                  GButton(
               
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.favorite,
                    
                    text: 'Favourites',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
