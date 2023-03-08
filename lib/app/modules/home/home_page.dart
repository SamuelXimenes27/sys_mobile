import 'dart:developer';

import 'package:design_leveling/app/modules/home/home_store.dart';
import 'package:design_leveling/app/shared/constants/routes_const.dart';
import 'package:design_leveling/app/shared/widgets/appbar/appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.checkIsLogged(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: const DefaultAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 38.84,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              size: 38.84,
            ),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
              size: 38.84,
            ),
            label: 'Logout',
          ),
        ],
        currentIndex: selectedIndex,
        backgroundColor: const Color(0xff3B66A4),
        selectedItemColor: const Color(0xff49BEB7),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (selectedIndex) async {
          if (selectedIndex == 2) {
            await FirebaseAuth.instance.signOut();
            Modular.to.navigate(RoutesConst.login);
          } else {
            onItemTapped(selectedIndex);
          }
        },
      ),
    );
  }
}
