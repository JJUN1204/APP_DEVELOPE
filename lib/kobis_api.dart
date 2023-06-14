import 'dart:convert';

import 'package:http/http.dart' as http;

class KobisApi {
  final String apiKey;
  final String _site = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/';
  KobisApi({required this.apiKey});

  Future<List<dynamic>> getDailyBoxOffice({required String targetDt}) async {
    var uri = '$_site/boxoffice/searchDailyBoxOfficeList.json';
    uri = '$uri?key=$apiKey';
    uri = '$uri&targetDt=$targetDt';

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

  getMovieDetail() {}
}
