// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:film_fusion/view/movies_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
        return MoviesScreen();
      }), (route) => false);
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(child: Center(child: Icon(Icons.movie_filter_outlined,size: 50,color: Colors.red,))),
          Text("Film Fusion",style: TextStyle(color: Colors.white,fontFamily: "poppins",fontSize: 24),)
        ],
      ),
    );
  }
}