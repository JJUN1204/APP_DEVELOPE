import 'package:flutter_application_3/carrot_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<CarrotItem> items = [];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 1000));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 13550));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 10000));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 10560));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 20500));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 17000));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 19000));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 14570));
    items.add(CarrotItem(title: '팝니다.', addr: '우리집', price: 40000));

    return MaterialApp(
      home: HomePage(items: items),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.items,
  });

  final List<CarrotItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Malbob market'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var item in items)
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(price: item.price),
                        ));
                  },
                  child: item)
          ],
        ),
      ),
    );
  }
}
