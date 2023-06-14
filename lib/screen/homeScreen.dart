// import 'package:challenge/movie.dart';
// import 'package:challenge/main.dart';
// import 'package:challenge/movie_widget.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
//   final Future<List<MovieModel>> popularMovies =
//       MyHomePageState.getTodayMovie();
//   final Future<List<MovieModel>> comingMovies =
//       MyHomePageState.getComingMovie();
//   final Future<List<MovieModel>> playingMovies =
//       MyHomePageState.getPlayingMovie();

//   // List<MovieModel> movies = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           FutureBuilder(
//             future: Future.wait([popularMovies, comingMovies, playingMovies]),
//             builder: (context, result) {
//               if (result.hasData) {
//                 // List<MovieModel> firstInnerList = result.data;
//                 // for(var movie in result.data!)
//                 List<MovieModel> popularInnerList = result.data![0];
//                 List<MovieModel> comingInnerList = result.data![1];
//                 List<MovieModel> playingInnerList = result.data![2];

//                 for (var popularData in popularInnerList) {
//                   print(popularData.title);
//                 }
//                 for (var comingData in comingInnerList) {
//                   print(comingData.title);
//                 }
//                 for (var playingData in playingInnerList) {
//                   print(playingData.title);
//                 }
//                 return Column(
//                   children:  [
//                     SizedBox(
//                       height: 50,
//                     ),
//                     for (var movie in playingInnerList)
//                       {Expanded(child: makeList(playingInnerList))},
//                   ],
//                 ); //아이템들 사이에 구분자를 넣어주는 것(이모지, 텍스트 등도 가능)

//                 //모든 아이템을 한번에 빌드하지 않음
//                 // return ListView.builder(
//                 // scrollDirection: Axis.horizontal,
//                 // itemCount: result.data!.length,
//                 // itemBuilder: (context, index) {
//                 //   var movie = result.data![index];
//                 //   return Text(movie.title);
//                 // }); // 리스트 아이템의 아이템을 만드는 역할을 하는 친구
//                 // return ListView(
//                 //   children: [
//                 //     for (var movie in result.data!)
//                 //       Text(
//                 //         movie.title,
//                 //         style: const TextStyle(fontSize: 20),
//                 //       )
//                 //   ],
//                 // );
//               }
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             },
//           ),
//           // FutureBuilder(
//           //   future: Future.wait([comingMovies, playingMovies]),
//           //   builder: (context, result) {
//           //     if (result.hasData) {
//           //       return Column(
//           //         children: [
//           //           const SizedBox(
//           //             height: 50,
//           //           ),
//           //           Expanded(child: makeList(result)),
//           //         ],
//           //       );
//           //     }
//           //     return const Center(
//           //       child: CircularProgressIndicator(),
//           //     );
//           //   },
//           // ),
//           // FutureBuilder(
//           //   future: playingMovies,
//           //   builder: (context, result) {
//           //     if (result.hasData) {
//           //       return Column(
//           //         children: [
//           //           const SizedBox(
//           //             height: 50,
//           //           ),
//           //           Expanded(child: makeList(result)),
//           //         ],
//           //       );
//           //     }
//           //     return const Center(
//           //       child: CircularProgressIndicator(),
//           //     );
//           //   },
//           // ),
//         ],
//       ),
//     );
//   }

//   ListView makeList(AsyncSnapshot<List<MovieModel>> result) {
//     return ListView.separated(
//       scrollDirection: Axis.horizontal,
//       itemCount: result.data!.length,
//       itemBuilder: (context, index) {
//         var popularMovie = result.data![index];
//         return movie(
//           title: popularMovie.title,
//           backdrop_path: popularMovie.backdrop_path,
//           overview: popularMovie.overview,
//         );
//       },
//       separatorBuilder: (context, index) => const SizedBox(
//         width: 20,
//       ),
//     );
//   }
// }
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
            // final List<MovieModel> movieList = [];
            // for (var i = 0; i < result.data!.length; i++) {
            //   movieList.addAll(result.data![i]);
            // }
            // for (var popularData in popularInnerList) {
            //   print(popularData.title);
            // }
            // for (var comingData in comingInnerList) {
            //   print(comingData.title);
            // }
            // for (var playingData in playingInnerList) {
            //   print(playingData.title);
            // }

            return Column(
              children: [
                const SizedBox(height: 20),
                // for (var popularMovie in popularInnerList)
                // Expanded(
                //     child: Column(
                //   children: [
                //     makeList(popularInnerList),
                //     makeList(comingInnerList),
                //     makeList(playingInnerList),
                //   ],
                // ))
                const Text(
                  'Popular Movies',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                // for (var comingMovie in comingInnerList)
                Expanded(child: makeList(popularInnerList)),
                const Text(
                  'Coming Soon',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Expanded(child: makeList(comingInnerList)),
                const Text(
                  'Now in Cinemas',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                // const SizedBox(height: 50),
                // for (var playingMovie in playingInnerList)
                Expanded(child: makeList(playingInnerList)),
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
