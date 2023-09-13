import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '간단한 계산기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String statement = ""; // 현재 상황을 띄우는 변수
  String result = "0"; // 결과 화면을 띄우는 변수
  final List<String> buttons = [
    'C',
    '(',
    ')',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    'AC',
    '0',
    '.',
    '='
  ];

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // 레이아웃 위젯
          children: [
            Flexible(flex: 2, child: _resultView()),
            Expanded(flex: 4, child: _buttons())
          ],
        ),
      ),
    );
  }

  //맨 위에 계산 결과를 보여주는 뷰
  Widget _resultView() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              statement,
              style: const TextStyle(fontSize: 32),
            )),
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  // 버튼을 그리드 형식으로 뿌려주는 함수
  Widget _buttons() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4), //특정한 개수의 그리드를 생성할때 쓰임
      itemBuilder: (BuildContext context, int index) {
        return _myButton(buttons[index]);
      },
      itemCount: buttons.length,
    );
  }

  // 개개의 버튼을 꾸며주는 함수
  Widget _myButton(String text) {
    return Container(
      //도형 만들때에
      margin: const EdgeInsets.all(8),
      child: MaterialButton(
        onPressed: () {
          setState(() {
            clickButton(text);
          });
        },
        color: _getColor(text),
        textColor: Colors.white,
        shape: const CircleBorder(),
        child: Text(text, style: const TextStyle(fontSize: 26)),
      ),
    );
  }

  //버튼의 색깔을 정해주는 함수
  _getColor(String text) {
    if (text == '=' ||
        text == '*' ||
        text == '+' ||
        text == '-' ||
        text == '/') {
      return Colors.orange;
    }

    if (text == 'C' || text == 'AC') {
      return Colors.red;
    }

    if (text == '(' || text == ')' || text == '.') {
      return Colors.blueGrey;
    }
    return Colors.blueAccent;
  }

  clickButton(String text) {
    if (text == 'AC') {
      statement = '';
      result = '0';
      return;
    }

    if (text == 'C') {
      statement = statement.substring(0, statement.length - 1);
      return;
    }

    if (text == '=') {
      result = calculate();
      return;
    }
    statement = statement + text; //현재의 수를 저장
    
  }

  calculate() {
    try {
      //statement 에 저장된 수식을 가져와서
      //math expression 의 Parser() 함수로 분석합니다
      var exp = Parser().parse(statement);
      //해답은 math expression 의 evaluate 함수를 사용해서
      //(에러가 있을경우)
      //해당 수식을 계산합니다
      var ans = exp.evaluate(EvaluationType.REAL, ContextModel());
      return ans.toString();
    } catch (e) {
      return '에러발생';
    }
  }
}
