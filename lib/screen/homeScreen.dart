import 'package:challenge/movie.dart';
import 'package:challenge/main.dart';
import 'package:challenge/movie_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<List<MovieModel>> popularMovies =
      MyHomePageState.getTodayMovie();
  final Future<List<MovieModel>> comingMovies =
      MyHomePageState.getComingMovie();
  final Future<List<MovieModel>> playingMovies =
      MyHomePageState.getPlayingMovie();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: Future.wait([popularMovies, comingMovies, playingMovies]),
        builder: (context, AsyncSnapshot<List<List<MovieModel>>> result) {
          if (result.hasData) {
            List<MovieModel> popularInnerList = result.data![0];
            List<MovieModel> comingInnerList = result.data![1];
            List<MovieModel> playingInnerList = result.data![2];
            return Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Popular Movies',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                // for (var comingMovie in comingInnerList)
                Expanded(child: makeList(popularInnerList)),
                const Text(
                  'Now in Cinemas',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Expanded(child: makeList(playingInnerList)),
                const Text(
                  'Coming Soon',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Expanded(child: makeList(comingInnerList)),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(List<MovieModel> movies) {
    print(movies.length);
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];
        return movie1(
          title: movie.title,
          backdrop_path: movie.backdrop_path,
          overview: movie.overview,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
