import 'package:flutter/material.dart';

class MovieThumbnailVertical extends StatelessWidget {
  final String movieName;
  final double ratings;
  final String image;

  const MovieThumbnailVertical(
      {super.key,
      required this.movieName,
      required this.ratings,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 160,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            height: 150,
            width: 125,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieName,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  maxLines: 1,
                ),
                Text(
                  '⭐$ratings/10 IMDb',
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
