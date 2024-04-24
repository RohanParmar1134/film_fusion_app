import 'dart:convert';

import 'package:film_fusion/controller/movies_state.dart';
import 'package:film_fusion/global_variable.dart';
import 'package:film_fusion/model/movie_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

MoviesCubit moviesCubit = navigationContext.read<MoviesCubit>();

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesLoading());

  void getMovies() async{
    var res = await http.get(
        Uri.parse(
          "https://firebasestorage.googleapis.com/v0/b/whisper---chatbot.appspot.com/o/movie.json",
        ).replace(queryParameters: {
          "alt": "media",
          "token": "5de86663-f437-48a0-acbf-415e6f9980fa"
        }));
    MoviesResponse moviesResponse =  MoviesResponse.fromJson(jsonDecode(res.body));
    emit(state.copyWith(moviesData: moviesResponse));
    print(moviesResponse);
  }
}
