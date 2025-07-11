import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix/repository/netflix_repository.dart';
import 'package:netflix/ui/widgets/netflix_home.dart';
import 'package:netflix/utils/constant.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void initData() async {
    final dataProvider = Provider.of<NetflixRepository>(context, listen: false);
    await dataProvider.initData();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return NetflixHome();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/netflix_logo_1.png"),
          const SpinKitFadingCircle(
            color: kPrimaryColor,
            size: 20,
          )
        ],
      ),
    );
  }
}
