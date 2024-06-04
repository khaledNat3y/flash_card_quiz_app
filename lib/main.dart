import 'dart:ui';

import 'package:flash_card_quiz_app/ui/widgets/flashcard_view.dart';
import 'package:flash_card_quiz_app/ui/screens/home_screen.dart';
import 'package:flash_card_quiz_app/utils/app_colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
