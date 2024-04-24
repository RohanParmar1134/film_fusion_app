import 'package:film_fusion/controller/movies_cubit.dart';
import 'package:film_fusion/controller/movies_state.dart';
import 'package:film_fusion/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatefulWidget {
  int index;
  MovieDetailScreen({super.key, required this.index});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      stackImage(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  state.moviesData!.results![widget.index]
                                          .originalTitle ??
                                      "",
                                  style: TextStyle(
                                      color: AppColor.mainTextColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                    state.moviesData!.results![widget.index].overview ??
                                        "",
                                    style: TextStyle(
                                        color: AppColor.mainTextColor, fontSize: 12)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        // Positioned(
        // top: 40,
        // left: 10,
        // child: IconButton(onPressed: (){
        //   Navigator.pop(context);
        // }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,))),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text("Buy",style: TextStyle(color: AppColor.descTextColor),)),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget stackImage() {
    return BlocBuilder<MoviesCubit, MoviesState>(builder: (context, state) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.01),
                    Colors.grey.withOpacity(0.3),
                    Colors.black,
                  ],
                ),
              ),
              child: Image.network(
                  state.moviesData!.results![widget.index].backdropPath ?? "",
                  fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Hero(
                    tag: state.moviesData!
                        .results![widget.index].id??"",
                    child: Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(state.moviesData!
                                      .results![widget.index].posterPath ??
                                  ""),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Release Date",
                            style: TextStyle(color: AppColor.mainTextColor)),
                        Text(
                            state.moviesData!.results![widget.index]
                                    .releaseDate ??
                                "",
                            style: TextStyle(color: AppColor.mainTextColor))
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      );
    });
  }
}
