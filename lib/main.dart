import 'package:flutter/material.dart';
import 'package:movie_app2_0/pages/bookmarkspage.dart';
import 'package:movie_app2_0/pages/homepage.dart';
import 'package:movie_app2_0/pages/viewallpage.dart';
import 'package:movie_app2_0/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => HomeProvider(),
    ),
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Homepage.routeName,
      routes: {
        Homepage.routeName: (_) => const Homepage(),
        // DetailsPopup.routeName: (_) => DetailsPopup(title: title, voteAverage: voteAverage, genreIds: genreIds, originalLanguage: originalLanguage, adult: adult, overview: overview, posterPath: posterPath),
        Bookmarkspage.routeName: (_) => const Bookmarkspage(),
        Viewallpage.routeName: (_) => const Viewallpage(),
      },
    );
  }
}
