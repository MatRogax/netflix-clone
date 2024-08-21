import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/movie_model.dart';
import 'package:netflix/repository/netflix_repository.dart';
import 'package:netflix/services/netflix_api_service.dart';
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
    getMovies();
  }

  Future<void> getMovies() async {
    final dataProvider = Provider.of<NetflixRepository>(context, listen: false);
    await dataProvider.getPopularMovies();
  }

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
        Container(
          height: 500,
          color: Colors.red,
          child: dataProvider.popularMovieList.isEmpty
              ? const Center()
              : Image.network(
                  dataProvider.popularMovieList[0].posterUrl(),
                  fit: BoxFit.cover,
                ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Têndencias Atuais",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: 110,
                color: Colors.yellow,
                child: dataProvider.popularMovieList.isEmpty
                    ? Center(
                        child: Text(index.toString()),
                      )
                    : Image.network(
                        dataProvider.popularMovieList[index].posterUrl(),
                        fit: BoxFit.cover,
                      ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Atualmente nos cinemas",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 320,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: 220,
                color: Colors.blue,
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Em Breve",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: 110,
                color: Colors.green,
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}
