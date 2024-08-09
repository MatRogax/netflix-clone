import 'package:flutter/material.dart';
import 'package:netflix/ui/widgets/netflix_home_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "Netflix App",
      debugShowCheckedModeBanner: false,
      home: NetflixHome(),
    ),
  );
}
