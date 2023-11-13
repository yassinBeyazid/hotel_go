import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_go_app/view/home/home_view.dart';

import 'controller/reservation/bloc/reservation_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => ReservationBloc(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}


