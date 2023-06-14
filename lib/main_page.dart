import 'package:flutter/material.dart';
import 'package:flutter_application_movie6/kobis_api.dart';

import 'movie_detail.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
  final kobisApi = KobisApi(apiKey: 'b36905e98360ed4f49ba8603c3c56271');
  dynamic body = const Center(child: Text('MOVIES'));
  void showCal() async {
    var dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 1)),
      firstDate: DateTime(2022),
      lastDate: DateTime.now().subtract(const Duration(days: 1)),
    );
    if (dt != null) {
      var targetDt = dt.toString().split(' ')[0].replaceAll('-', '');
      var movies = kobisApi.getDailyBoxOffice(targetDt: targetDt);
      showList(movies);
    }
  }

  void showList(Future<List<dynamic>> movies) {
    setState(() {
      body = FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //데이터가 넘어옴
            var movies = snapshot.data;
            return ListView.separated(
                //빌더는 함수
                itemBuilder: (context, index) {
                  //반복 저장
                  var rankColor = Colors.black;
                  if (index == 0) {
                    rankColor = Colors.red;
                  } else if (index == 1) {
                    rankColor = Colors.blue;
                  } else if (index == 2) {
                    rankColor = Colors.green;
                  }
                  var movie = movies[index];
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: rankColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        movies[index]['rank'],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    title: Text(movies[index]['movieNm']),
                    subtitle: Text('${movies[index]['audiAcc']}'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(
                            movieCd: movies[index]['movieCd'],
                          ),
                        )),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: movies!.length); //! 돈있다고
          } else {
            //로딩중..
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: showCal,
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}
