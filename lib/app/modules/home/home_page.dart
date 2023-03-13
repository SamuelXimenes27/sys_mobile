import 'package:design_leveling/app/modules/home/components/mapTabPage.dart';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.checkIsLogged(context);
    store.tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void selectItemNavigationBar(int index) {
      setState(() {
        store.selectedIndex = index;
      });
    }

    TabBar tabBar = TabBar(
      unselectedLabelColor: const Color(0xff3B66A4),
      indicatorColor: const Color(0xff49BEB7),
      labelColor: const Color(0xff3B66A4),
      controller: store.tabController,
      tabs: const [
        Tab(
          text: 'Pessoas',
          height: 30,
        ),
        Tab(
          text: 'Veículos',
          height: 30,
        ),
      ],
    );

    late final List<Widget> tabOptions = <Widget>[
      DefaultTabController(
        length: 2,
        child: TabBarView(
          controller: store.tabController,
          children: const [
            Tab(
              child: Scaffold(
                backgroundColor: Colors.amber,
                body: Text('tab1'),
              ),
            ),
            Tab(
              child: Scaffold(
                backgroundColor: Colors.red,
                body: Text('tab2'),
              ),
            ),
          ],
        ),
      ),
      const MapTabPage()
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(0, size.height * 0.25),
            child: DefaultAppBar(
              tabBar: PreferredSize(
                preferredSize: const Size(0, 0),
                child: ColoredBox(
                  color: Colors.white,
                  child: store.selectedIndex == 0 ? tabBar : null,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: tabOptions.elementAt(store.selectedIndex),
            ),
          ),
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
            currentIndex: store.selectedIndex,
            backgroundColor: const Color(0xff3B66A4),
            selectedItemColor: const Color(0xff49BEB7),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (selectedIndex) async {
              if (selectedIndex == 2) {
                await FirebaseAuth.instance.signOut();
                Modular.to.navigate(RoutesConst.login);
              } else {
                selectItemNavigationBar(selectedIndex);
              }
            },
          ),
        ),
      ),
    );
  }
}
