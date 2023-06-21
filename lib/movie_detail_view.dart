import 'package:flutter/material.dart';
import 'package:flutter_application_movie6/kobis_api.dart';

class MovieDetailView extends StatefulWidget {
  Map<String, dynamic> movie;

  MovieDetailView({super.key, required this.movie});

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  void showPopup() async {
    var kobisApi = KobisApi(apiKey: 'b36905e98360ed4f49ba8603c3c56271');
    var company = await kobisApi.getCompanuDetail(
        companyCd: widget.movie['companys'][0]['companyCd']);

    var msg = showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${company['companyNm']}'),
        content: const Text('company info'),
        actions: [
          TextButton(onPressed: () => false, child: const Text('아니오')),
          TextButton(
              onPressed: () {
                Navigator.pop(context); // 창 닫기
              },
              child: const Text('예'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.movie);
    //19 동그라미 모양
    var grade = widget.movie['audits'][0]['watchGradeNm'].toString();
    Map<String, dynamic> gradeStyle = {};
    if (grade == '15세이상관람가') {
      var gradeColor = Colors.blue;
      var gradeText = '15';
      gradeStyle['color'] = Colors.blue;
      gradeStyle['text'] = '15';
    }
    return Column(
      //범죄도시(2023)
      children: [
        Text('${widget.movie['movieNm']}(${widget.movie['prdtYear']})'),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: gradeStyle['color'], shape: BoxShape.circle),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Center(child: Text(gradeStyle['text'])),
            )
          ],
        ),
        GestureDetector(
            onTap: () {
              //영화회사정보를 검색해서 ,다이얼 로그 띠우기
              showPopup();
            }, //
            child: Text('${widget.movie['companyNm']}'))
      ],
    );
  }
}
