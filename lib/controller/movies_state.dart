import 'package:film_fusion/model/movie_response.dart';

class MoviesState {
  MoviesResponse? moviesData;
  MoviesState({this.moviesData});
  MoviesState copyWith({MoviesResponse? moviesData}){
    return MoviesState(
      moviesData: moviesData ?? this.moviesData
    );
  }
}

class MoviesLoading extends MoviesState{}