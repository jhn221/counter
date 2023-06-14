import 'package:challenge/movie.dart';
import 'package:challenge/main.dart';
import 'package:challenge/widget/popularMovie_widget.dart';
import 'package:flutter/material.dart';

import '../widget/comingMovie_widget.dart';
import '../widget/playingMovie_widget.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
          future: Future.wait([popularMovies, comingMovies, playingMovies]),
          builder: (context, AsyncSnapshot<List<List<MovieModel>>> result) {
            if (result.hasData) {
              List<MovieModel> popularInnerList = result.data![0];
              List<MovieModel> comingInnerList = result.data![1];
              List<MovieModel> playingInnerList = result.data![2];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Popular Movies',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    // for (var comingMovie in comingInnerList)
                    // Expanded(child: makeList(popularInnerList)),
                    SizedBox(height: 300, child: makeList(popularInnerList)),
                    const Text(
                      'Now in Cinemas',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    // Expanded(child: playingList(playingInnerList)),
                    SizedBox(height: 250, child: playingList(playingInnerList)),
                    const Text(
                      'Coming Soon',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    SizedBox(
                      height: 300,
                      child: comingList(comingInnerList),
                    ),
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  ListView makeList(List<MovieModel> movies) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];
        return popularMovie(
          title: movie.title,
          backdrop_path: movie.backdrop_path,
          overview: movie.overview,
          vote_average: movie.vote_average,
          popularity: movie.popularity,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }

  ListView playingList(List<MovieModel> movies) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];
        return playingMovie(
          title: movie.title,
          backdrop_path: movie.backdrop_path,
          overview: movie.overview,
          vote_average: movie.vote_average,
          popularity: movie.popularity,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }

  ListView comingList(List<MovieModel> movies) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        var movie = movies[index];
        return comingMovie(
          title: movie.title,
          backdrop_path: movie.backdrop_path,
          overview: movie.overview,
          vote_average: movie.vote_average,
          popularity: movie.popularity,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
