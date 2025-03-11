import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';
import 'moviecatagory.dart';

class DetailsPopup extends StatelessWidget {
  static const String routeName = '/detailspop';

  final String? title;
  final double? voteAverage;
  final List<int> genreIds;
  final String? originalLanguage;
  final bool? adult;
  final String? overview;
  final String? posterPath;

  const DetailsPopup(
      {super.key,
      required this.title,
      required this.voteAverage,
      required this.genreIds,
      required this.originalLanguage,
      required this.adult,
      required this.overview,
      required this.posterPath});

  @override
  Widget build(BuildContext context) {
    var rating = adult! ? '18+' : 'PG-13';
    return SafeArea(
        child: Scaffold(
      body: Consumer<HomeProvider>(
          builder: (child, provider, _) => Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(posterPath!),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: MediaQuery.sizeOf(context).height / 2,
                        width: MediaQuery.sizeOf(context).width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              color: Color(0xc5fcf4fc),
                            ),
                            child: Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            title!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.bookmark))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('⭐$voteAverage/10 IMDb'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Moviecatagory(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          RichText(
                                              textAlign: TextAlign.center,
                                              text: const TextSpan(
                                                  text: 'length\n',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '01hour 38min',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ])),
                                          RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  text: 'language\n',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: originalLanguage,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ])),
                                          RichText(
                                              textAlign: TextAlign.center,
                                              text: TextSpan(
                                                  text: 'rating\n',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: rating,
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                    )
                                                  ])),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Description',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(overview!),
                                    ]),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              )),
    ));
  }
}
