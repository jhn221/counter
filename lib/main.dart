import 'dart:convert';

import 'package:challenge/movie.dart';
import 'package:challenge/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = 'popular';
  static const String nowPlaying = 'now-playing';
  static const String comingSoon = 'coming-soon';
  static const String detail = 'movie?id=1';

  static Future<List<MovieModel>> getTodayMovie() async {
    List<MovieModel> popularMovieInstances = [];
    final popularUrl = Uri.parse('$baseUrl/$popular');

    final response = await http.get(popularUrl);
    if (response.statusCode == 200) {
      final Map<String, dynamic> popularMovies = jsonDecode(response.body);
      final List<dynamic> popularMovieList = popularMovies['results'];
      for (var popularmovie in popularMovieList) {
        print(popularmovie);
        popularMovieInstances.add(MovieModel.fromJson(popularmovie));
      }
      return popularMovieInstances;
    } else {
      throw Error();
    }
  }

  static Future<List<MovieModel>> getComingMovie() async {
    List<MovieModel> comingMovieInstances = [];
    final comingSoonUrl = Uri.parse('$baseUrl/$comingSoon');
    final comingResponse = await http.get(comingSoonUrl);
    if (comingResponse.statusCode == 200) {
      final Map<String, dynamic> comingMovies = jsonDecode(comingResponse.body);
      final List<dynamic> comingMovieList = comingMovies['results'];
      for (var comingMovie in comingMovieList) {
        print(comingMovie);
        comingMovieInstances.add(MovieModel.fromJson(comingMovie));
      }
      return comingMovieInstances;
    } else {
      throw Error();
    }
  }

  static Future<List<MovieModel>> getPlayingMovie() async {
    List<MovieModel> nowPlayMovieInstances = [];
    final nowPlayingUrl = Uri.parse('$baseUrl/$nowPlaying');

    final nowPlayResponse = await http.get(nowPlayingUrl);
    if (nowPlayResponse.statusCode == 200) {
      final Map<String, dynamic> nowPlayMovies =
          jsonDecode(nowPlayResponse.body);
      final List<dynamic> nowPlayMovieList = nowPlayMovies['results'];
      for (var nowPlayMovie in nowPlayMovieList) {
        print(nowPlayMovie);
        nowPlayMovieInstances.add(MovieModel.fromJson(nowPlayMovie));
      }
      return nowPlayMovieInstances;
    } else {
      throw Error();
    }
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
