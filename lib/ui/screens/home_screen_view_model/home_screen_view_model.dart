import 'package:flutter/material.dart';

import '../../../data/local_database/local_database.dart';
import '../../../data/model/flash_card.dart';


class HomeScreenViewModel extends ChangeNotifier {
  LocalDatabase localDatabase = LocalDatabase();
  int currentIndex = 0;
  int score = 0;
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final TextEditingController answerInputController = TextEditingController();
  bool showScoreInput = false;

  void nextCard() {
    if (currentIndex < localDatabase.flashcards.length - 1) {
      currentIndex++;
    } else {
      return;
    }
    showScoreInput = true;
    answerInputController.clear();
    notifyListeners();
  }

  void previousCard() {
    if (currentIndex != 0) {
      currentIndex--;
    }
    notifyListeners();
  }

  void showAddFlashcardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Flashcard"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: InputDecoration(labelText: "Question"),
              ),
              TextField(
                controller: answerController,
                decoration: InputDecoration(labelText: "Answer"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _addFlashcard();
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _addFlashcard() {
    localDatabase.flashcards.add(
      FlashCard(
        question: questionController.text,
        answer: answerController.text,
      ),
    );
    questionController.clear();
    answerController.clear();
    notifyListeners();
  }

  void checkAnswer() {
    if (answerInputController.text.toLowerCase() == localDatabase.flashcards[currentIndex].answer.toLowerCase()) {
      score++;
    }
    showScoreInput = false;
    notifyListeners();
  }
}
