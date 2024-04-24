// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:film_fusion/controller/movies_cubit.dart';
import 'package:film_fusion/controller/movies_state.dart';
import 'package:film_fusion/utils/app_colors.dart';
import 'package:film_fusion/view/movie_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    moviesCubit.getMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Film Fusion",style: TextStyle(color: AppColor.descTextColor,fontSize: 16),),
      ),
      body: BlocBuilder<MoviesCubit,MoviesState>(
        builder: (context,state) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                    //     color: Colors.white.withOpacity(0.1),
                    //   ),
                    //   height: 50,
                    //   width: MediaQuery.of(context).size.width,
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      decoration: BoxDecoration(

                      // color: Colors.white.withOpacity(0.1),
                      ),
                      child:
                      (state is MoviesLoading)
                          ? Center(
                        child: CircularProgressIndicator(),
                      )
                          : ((state.moviesData!.results??[]).isEmpty)?
                          Center(child: Text("No Movies Available"),)
                          :ListView.builder(
                          itemCount: (state.moviesData!.results??[]).length,
                          itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: Colors.blue.withOpacity(0.3),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_){
                                return MovieDetailScreen(index: index);
                              }));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(state.moviesData!.results![index].posterPath??""),fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    // child: Image.network(state.moviesData!.results![index].posterPath??"",fit: BoxFit.cover)\
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                                    child: Container(
                                      height: 100,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                      color: Colors.grey.shade900.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.2)
                                        )
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Hero(
                                              tag: state.moviesData!.results![index].id??"",
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  image: DecorationImage(image: NetworkImage(state.moviesData!.results![index].posterPath!),fit: BoxFit.cover)
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 10,right: 10),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top: 20,bottom: 10,right: 10),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(state.moviesData!.results![index].title??"",style: TextStyle(color: AppColor.mainTextColor),),
                                                            Text(state.moviesData!.results![index].overview??"",style: TextStyle(fontSize: 12,color: AppColor.descTextColor),overflow: TextOverflow.ellipsis,maxLines: 1,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(Icons.arrow_forward_ios_outlined,color: AppColor.mainTextColor,)
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}