import 'package:challenge/screen/detail_screen.dart';
import 'package:flutter/material.dart';

class popularMovie extends StatelessWidget {
  final String backdrop_path, title, overview;
  final num vote_average, popularity;
  const popularMovie({
    super.key,
    required this.title,
    required this.backdrop_path,
    required this.overview,
    required this.popularity,
    required this.vote_average,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              title: title,
                              backdrop_path: backdrop_path,
                              overview: overview,
                              vote_average: vote_average,
                              popularity: popularity,
                            )));
              },
              child: Column(
                children: [
                  // const Text(
                  //   'Popular Movies',
                  //   style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    clipBehavior: Clip.hardEdge, //자식의 부모 영역 침범을 제어하는 방법,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    width: 350,
                    child: Image.network(
                        'https://image.tmdb.org/t/p/w500$backdrop_path'),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
