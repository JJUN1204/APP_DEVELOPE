import 'package:flutter/material.dart';
import 'package:flutter_application_meal/neis_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic mealList = const Text('급식을 검색하세요.');
  void showCal() async {
    var dt = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2023, 3, 2),
        lastDate: DateTime(2023, 12, 30));
    String fromDate = dt.toString().split(' ')[0].replaceAll('-', '');
    String toDate = dt.toString().split(' ')[3].replaceAll('-', '');
    var neisApi = NeisApi();
    var meals = await neisApi.getMeal(fromDate: fromDate, toDate: toDate);

    setState(() {
      if (meals.isEmpty) {
        mealList = const Center(
          child: Text('결과가 텅텅'),
        );
      } else {
        mealList = ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(meals[index]['MLSV_YMD']),
                  subtitle: Text(meals[index]['DDISH_NM']
                      .toString()
                      .replaceAll('<br/>', '\n')));
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: meals.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('성일(정보)고등학교'),
          Expanded(child: mealList),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showCal,
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}
