import '../components/home_page/favorite_page.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int pageIndex = 0;
  List<Widget> pages = const [
    HomePage(),
    FavoritePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: (newIndex) => setState(() {
          pageIndex = newIndex;
        }),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.movie), label: 'Film'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}