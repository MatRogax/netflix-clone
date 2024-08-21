import 'package:flutter/material.dart';
import 'package:netflix/repository/netflix_repository.dart';
import 'package:netflix/ui/widgets/netflix_home_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NetflixRepository(),
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Netflix",
      debugShowCheckedModeBanner: false,
      home: NetflixHome(),
    );
  }
}
