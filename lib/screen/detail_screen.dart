import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String backdrop_path, title, overview;
  const DetailScreen({
    super.key,
    required this.title,
    required this.backdrop_path,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          'Back to list',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage('https://image.tmdb.org/t/p/w500$backdrop_path'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              const Spacer(),
              Text(
                overview,
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
