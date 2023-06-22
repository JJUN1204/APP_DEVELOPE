import 'package:flutter/material.dart';
import 'package:flutter_application_movie6/kobis_api.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var controller = TextEditingController();
  var _searchType = 'movieNm';
  var kobis_api = KobisApi(apiKey: 'b36905e98360ed4f49ba8603c3c56271');

  void getMovieList() async {
    //검색을 눌렀을때 동작

    var movies = await kobis_api.getSearchMovieList(
        searchType: _searchType, searchvalue: controller.text);
    print(movies);
    for (var movie in movies) {
      print(movie);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DropdownButton(
            items: const [
              DropdownMenuItem(value: 'movieNm', child: Text('영화제목')),
              DropdownMenuItem(value: 'directorNm', child: Text('감독명')),
            ],
            onChanged: (value) {
              _searchType = value.toString();
            },
          ),
          Expanded(
            child: TextFormField(
              autofocus: true,
              controller: controller,
            ),
          ),
          ElevatedButton(onPressed: getMovieList, child: const Text('검색'))
        ],
      ),
    );
  }
}
