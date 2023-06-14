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
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image:
        //         NetworkImage('https://image.tmdb.org/t/p/w500$backdrop_path'),
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(29)),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500$backdrop_path')),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.black),
              ),
              const Spacer(),
              const Text(
                'StoryLine',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                overview,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
