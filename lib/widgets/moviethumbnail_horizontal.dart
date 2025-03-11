import 'package:flutter/material.dart';

class MovieThumbnailHorizontal extends StatelessWidget {
  final String movieName;
  final double ratings;
  final String image;

  const MovieThumbnailHorizontal(
      {super.key,
      required this.movieName,
      required this.ratings,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 360,
      width: 180,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 240,
            width: 160,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
          ),
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
    );
  }
}
