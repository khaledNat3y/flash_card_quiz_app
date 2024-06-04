import 'package:flash_card_quiz_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;
  final String title;
  final Color backgroundColor;
  const FlashcardView({super.key, required this.text, required this.backgroundColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      surfaceTintColor: Colors.green,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, textAlign: TextAlign.center, style: AppTheme.font20WhiteRegular,),
          Text(text, textAlign: TextAlign.center, style: AppTheme.font20WhiteRegular,),
        ],
      ),
    );
  }
}
