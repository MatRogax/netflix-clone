import 'package:flutter/material.dart';
import 'package:netflix/utils/constant.dart';

class NetflixHome extends StatefulWidget {
  const NetflixHome({super.key});

  @override
  State<NetflixHome> createState() => _NetflixHomeState();
}

class _NetflixHomeState extends State<NetflixHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: Image.asset('assets/imagens/netflix_logo_2.png'),
      ),
    );
  }
}
