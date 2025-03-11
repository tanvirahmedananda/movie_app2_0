import 'package:flutter/material.dart';

class Moviecatagory extends StatelessWidget {
  const Moviecatagory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2,bottom: 2,left: 22,right: 22),
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text('Comedy'),
    );
  }
}
