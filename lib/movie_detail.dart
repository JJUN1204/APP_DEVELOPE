import 'package:flutter/material.dart';
import 'package:flutter_application_movie6/kobis_api.dart';
import 'package:flutter_application_movie6/movie_detail_view.dart';

class MovieDetail extends StatelessWidget {
  final String movieCd;
  MovieDetail({super.key, required this.movieCd});
  final kobis_api = KobisApi(apiKey: 'b36905e98360ed4f49ba8603c3c56271');
  @override
  Widget build(BuildContext context) {
    var movieData = kobis_api.getMovieDetail(movieCd: movieCd); //미래 데이터

    return Scaffold(
      body: FutureBuilder(
        future: movieData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movie = snapshot.data; //['movieNm']
            return MovieDetailView(movie: movie);
          } else {
            var msg = '데이터 로드중입니다.';
            return Center(child: Text(msg));
          }
        },
      ),
    );
  }
}
