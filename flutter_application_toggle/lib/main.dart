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
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {
                  if (isVisible == false) {
                    isVisible = true;
                  } else {
                    isVisible = false;
                  }
                });
              },
              color: Colors.yellowAccent,
              textColor: Colors.white,
              child: const Text('토글'),
            ),
            Visibility(
              // 안보이게 됨
              visible: isVisible,
              child: Container(
                color: Colors.purple,
                width: 300,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
