import 'dart:convert';

import 'package:http/http.dart' as http;

class KobisApi {
  final String apiKey;
  final String _site = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest';
  KobisApi({required this.apiKey});

  Future<List<dynamic>> getDailyBoxOffice({required String targetDt}) async {
    var uri = '$_site/boxoffice/searchDailyBoxOfficeList.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&targetDt=$targetDt';
    print(uri);

    var reponse = await http.get(Uri.parse(uri));
    //정상일때
    if (reponse.statusCode == 200) {
      try {
        var movies = jsonDecode(reponse.body)['boxOfficeResult']
            ['dailyBoxOfficeList'] as List<dynamic>;
        return movies;
      } catch (e) {
        return [];
      }
    }
    //에러일때
    else {
      return [];
    }
  }

  Future<dynamic> getMovieDetail({required String movieCd}) async {
    var uri = '$_site/movie/searchMovieInfo.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&movieCd=$movieCd';
    var reponse = await http.get(Uri.parse(uri));
    if (reponse.statusCode == 200) {
      var movie = jsonDecode(reponse.body)['movieInfoResult']['movieInfo']
          as dynamic; //var = 고정 dynamic = 바뀔수 있음
      return movie;
      // movie[0] a[1] => 배열 , 리스트 (index=주소) 보기에 안편함...
      // movie['name'] = 123 => dynamic
    }
    //에러일때
    else {
      return [];
    }
  }
}
