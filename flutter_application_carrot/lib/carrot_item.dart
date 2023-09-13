import 'package:flutter/material.dart';

class CarrotItem extends StatelessWidget {
  String title, addr;
  int price;
  CarrotItem({
    required this.title,
    required this.addr,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage('images/알빠노.jpg'))),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 150,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$title',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Divider(),
                Text('$addr',
                    style: TextStyle(
                        decoration: TextDecoration.underline, fontSize: 15)),
                Text('$price원'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite),
                    Text('12'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
