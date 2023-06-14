import 'package:flutter/material.dart';
import 'package:flutter_application_movie6/kobis_api.dart';

class MovieDetail extends StatelessWidget {
  final String movieCd;
  MovieDetail({super.key, required this.movieCd});
  final kobis_api = KobisApi(apiKey: 'b36905e98360ed4f49ba8603c3c56271');
  @override
  Widget build(BuildContext context) {
    print(kobis_api.getMovieDetail(movieCd: movieCd));

    return Scaffold(
      body: Text(movieCd),
    );
  }
}
