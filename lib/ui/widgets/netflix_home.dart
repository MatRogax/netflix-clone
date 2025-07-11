import 'package:flutter/material.dart';
import 'package:netflix/repository/netflix_repository.dart';
import 'package:netflix/ui/widgets/netflix_movie_card.dart';
import 'package:netflix/ui/widgets/netflix_movie_category.dart';
import 'package:netflix/utils/constant.dart';
import 'package:provider/provider.dart';

class NetflixHome extends StatefulWidget {
  const NetflixHome({super.key});

  @override
  State<NetflixHome> createState() => _NetflixHomeState();
}

class _NetflixHomeState extends State<NetflixHome> {
  @override
  void initState() {
    super.initState();
    // getMovies();
  }

  // Future<void> getMovies() async {
  //   final dataProvider = Provider.of<NetflixRepository>(context, listen: false);
  //   await dataProvider.getPopularMovies();
  // }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<NetflixRepository>(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset('assets/images/netflix_logo_2.png'),
      ),
      body: ListView(children: [
        SizedBox(
          height: 500,
          child: MovieCard(movie: dataProvider.popularMovieList.first),
        ),
        MovieCategory(
          imageHeight: 160,
          imageWidth: 110,
          label: "Tendências atuais",
          movieList: dataProvider.popularMovieList,
          callback: dataProvider.getPopularMovies,
        ),
        // MovieCategory(
        //   imageHeight: 320,
        //   imageWidth: 220,
        //   label: "Atualmente nos cinemas",
        //   movieList: dataProvider.popularMovieList,
        // ),
        // MovieCategory(
        //   imageHeight: 160,
        //   imageWidth: 110,
        //   label: "Em Breve",
        //   movieList: dataProvider.popularMovieList,
        // ),
      ]),
    );
  }
}
