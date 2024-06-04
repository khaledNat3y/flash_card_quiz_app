import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flash_card_quiz_app/utils/app_colors.dart';
import 'package:flash_card_quiz_app/utils/app_theme.dart';
import 'package:flip_card/flip_card.dart';
import '../widgets/flashcard_view.dart';
import 'home_screen_view_model/home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          centerTitle: true,
          title: Text(
            "FlashCard Quiz App",
            style: AppTheme.font20WhiteRegular,
          ),
        ),
        body: Consumer<HomeScreenViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 250,
                      height: 250,
                      child: FlipCard(
                        front: FlashcardView(
                          text: viewModel.localDatabase.flashcards[viewModel.currentIndex].question,
                          title: "Question:",
                          backgroundColor: Colors.black,
                        ),
                        back: FlashcardView(
                          text: viewModel.localDatabase.flashcards[viewModel.currentIndex].answer,
                          title: "Answer:",
                          backgroundColor: AppColors.green,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.black),
                          ),
                          onPressed: viewModel.previousCard,
                          icon: const Icon(
                            Icons.chevron_left,
                            color: AppColors.white,
                          ),
                          label: Text(
                            "Prev",
                            style: AppTheme.font20WhiteRegular,
                          ),
                        ),
                        OutlinedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(AppColors.black),
                          ),
                          onPressed: viewModel.nextCard,
                          icon: const Icon(
                            Icons.chevron_right,
                            color: AppColors.white,
                          ),
                          label: Text(
                            "Next",
                            style: AppTheme.font20WhiteRegular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Score: ${viewModel.score}/${viewModel.localDatabase.flashcards.length}",
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.black),
                      ),
                      onPressed: () => viewModel.showAddFlashcardDialog(context),
                      child: const Text("Add Flashcard", style: TextStyle(color: AppColors.white),),
                    ),
                    const SizedBox(height: 10),
                    if (viewModel.showScoreInput)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            TextField(
                              controller: viewModel.answerInputController,
                              decoration: const InputDecoration(labelText: "Your Answer",
                                labelStyle: TextStyle(color: AppColors.black),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 1, color: AppColors.black)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(width: 1, color: AppColors.black)
                                ),
                                enabled: true,

                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(AppColors.black),
                              ),
                              onPressed: viewModel.checkAnswer,
                              child: const Text("Submit Answer", style: TextStyle(color: AppColors.white),),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
