import 'package:flutter/material.dart';
import 'package:flutter_application_movie6/rank_page.dart';
import 'package:flutter_application_movie6/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var menus = [const RankPage(), const RankPage(), const SearchPage()];
  int _idx = 1;
  dynamic loadPage = const Text('검색하세여');
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [];
    items.add(
        const BottomNavigationBarItem(label: 'home', icon: Icon(Icons.star)));
    items.add(const BottomNavigationBarItem(
        label: '일별 박스오피스', icon: Icon(Icons.star)));
    items.add(const BottomNavigationBarItem(
        label: '영화 검색', icon: Icon(Icons.search)));

    return Scaffold(
      body: loadPage,
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: _idx,
        onTap: (value) {
          setState(() {
            _idx = value;
            loadPage = menus[value];
          });
        },
      ),
    );
  }
}
