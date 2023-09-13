import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var isvisible = false;
  var portfolios = [
    '플루터를 이용한 급식 알리미',
    '넷플릭스 클론 코딩',
    '유니티 2D슈팅게임',
    '플루터를 이용한 영화 조회기',
    'AWS로 웹 구축하기',
    '유니티 클릭커 알 까기 게임',
    '자바 fx를 이용한 계산기',
    '자바 fx를 이용한 키오스크',
    '나만의 홈페이지 html로 구성하기',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
    '백준 플레티넘 문제 10043512',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color: Colors.grey),
            ),
            elevation: 10.0,
            margin: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    width: 120,
                    height: 150,
                    child: const Image(image: AssetImage('images/new.jpg')),
                  ),
                  const SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  const Text(
                    '박준호',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'awdawdwj@icloud.com',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'Programming Developer',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      isvisible = !isvisible;
                      setState(() {});
                    },
                    color: Colors.lightBlueAccent,
                    textColor: Colors.white,
                    child: const Text('포트폴리오'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: isvisible,
                    child: Container(
                      color: Colors.greenAccent,
                      width: double.infinity, //가로 최대로
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i = 0; i < portfolios.length; i++)
                              _myBox(portfolios[i])
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _myBox(String txt) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.blueGrey,
      ),
      height: 100,
      child: Center(
        child: Text(txt),
      ),
    );
  }
}
