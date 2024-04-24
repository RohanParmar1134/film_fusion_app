import 'package:film_fusion/controller/movies_cubit.dart';
import 'package:film_fusion/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'di/get_it.dart';
import 'global_variable.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => getIt<MoviesCubit>(),
      ),
    ], child: Builder(
      builder: (context) {
        navigationContext = context;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: "poppins",
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red,background: Colors.black),
            useMaterial3: true,
          ),
          home: SplashScreen(),
        );
      }
    ));
  }
}
