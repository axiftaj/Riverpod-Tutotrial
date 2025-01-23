import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/post_screen.dart';
import 'package:riverpod_tutorial/slider_screen.dart';
import 'package:riverpod_tutorial/stream_provider_example.dart';

import 'favourite_screen.dart';
import 'future_provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',

        home:  PostScreen(),
      ),
    );
  }
}

