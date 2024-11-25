import 'now_playing_page.dart';
import 'upcoming_page.dart';
import '../../../../widgets/movie_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const MovieText(
            text: 'Movie Update',
            size: 16,
            weight: FontWeight.bold,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Now Playing',),
              Tab(text: 'Upcoming',)
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NowPlayingPage(),
            UpcomingPage()
          ],
        ),
      ),
    );
  }
}