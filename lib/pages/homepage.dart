import 'package:flutter/material.dart';
import 'package:movie_app2_0/provider/home_provider.dart';
import 'package:movie_app2_0/services/base_api.dart';
import 'package:movie_app2_0/widgets/detailsPopup.dart';
import 'package:movie_app2_0/widgets/moviethumbnail_vertical.dart';
import 'package:movie_app2_0/widgets/moviethumbnail_horizontal.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const String routeName = '/home';

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    var provider = Provider.of<HomeProvider>(context, listen: false);
    provider.fetchHomeProviderNowShowing(context);
    provider.fetchHomeProviderPopular(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Home',
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  'Bookmarks',
                  style: TextStyle(fontSize: 35),
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<HomeProvider>(
            builder: (child, provider, _) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: 'Now, ',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Showing',
                              style: TextStyle(
                                  color: Colors.deepOrangeAccent,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold))
                        ])),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Text(
                        'View All',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            provider.nowPlayingModel?.results.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = provider.nowPlayingModel?.results[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPopup(
                                          title: item?.title ?? '',
                                          voteAverage: item?.voteAverage ?? 0,
                                          genreIds: item?.genreIds ?? [],
                                          originalLanguage:
                                              item?.originalLanguage ?? '',
                                          adult: item?.adult ?? false,
                                          overview: item?.overview ?? '',
                                          posterPath:
                                              '$baseImageUrl${item?.posterPath}' ??
                                                  '')));
                            },
                            child: MovieThumbnailHorizontal(
                              movieName: item?.title ?? '',
                              ratings: item?.voteAverage ?? 0,
                              image: '$baseImageUrl${item?.posterPath}' ?? '',
                            ),
                          );
                        })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Text(
                        'View All',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount:
                            provider.popularModel?.results.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = provider.popularModel?.results[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPopup(
                                          title: item?.title ?? '',
                                          voteAverage: item?.voteAverage ?? 0,
                                          genreIds: item?.genreIds ?? [],
                                          originalLanguage:
                                              item?.originalLanguage ?? '',
                                          adult: item?.adult ?? false,
                                          overview: item?.overview ?? '',
                                          posterPath:
                                              '$baseImageUrl${item?.posterPath}' ??
                                                  '')));
                            },
                            child: MovieThumbnailVertical(
                              movieName: item?.title ?? '',
                              ratings: item?.voteAverage ?? 0,
                              image: '$baseImageUrl${item?.posterPath}' ?? '',
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
