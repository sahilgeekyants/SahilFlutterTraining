import 'package:drag_quiz/model/quiz_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Quiz extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizState();
  }
}

class QuizState extends State<Quiz> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); // key
  Data data;
  List<Map<int, String>> quizImages;
  List<Map<int, Color>> quizColors;
  List<String> rightWrongImages;
  List<int> scoreList; // Initial State: -1, Correct: 1, Wrong: 0
  int correctCount = 0;
  int incorrectCount = 0;

  @override
  void initState() {
    data = Data();
    quizImages = data.imageData;
    quizColors = data.colorData;
    rightWrongImages = data.rightWrongImageData;
    scoreList = [-1, -1, -1, -1, -1, -1, -1];
    quizImages.shuffle();
    quizColors.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //counting the correct and incorrect responses
          for (int item in scoreList) {
            if (item == 1) {
              correctCount++;
            } else if (item == 0) {
              incorrectCount++;
            }
          }
          // Showing scoreCard in SnackBar
          scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(
                'Correct: $correctCount  Incorrect: $incorrectCount',
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 2),
            ),
          );
          //Game Reset
          setState(() {
            quizImages.shuffle();
            quizColors.shuffle();
            scoreList = [-1, -1, -1, -1, -1, -1, -1];
            correctCount = 0;
            incorrectCount = 0;
          });
        },
        child: Icon(Icons.rotate_left),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: quizImages.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 7,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 2.5, 10, 2.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 9,
                        //show Draggable if not attempted otherwise show Tick/cross image
                        child: (scoreList[index] == -1)
                            ? Draggable(
                                data: [
                                  index,
                                  quizImages.elementAt(index).keys.elementAt(0),
                                ],
                                child: Image.asset(
                                  quizImages
                                      .elementAt(index)
                                      .values
                                      .elementAt(0),
                                  fit: BoxFit.fitHeight,
                                ),
                                feedback: Image.asset(
                                  quizImages
                                      .elementAt(index)
                                      .values
                                      .elementAt(0),
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  fit: BoxFit.fitHeight,
                                ),
                                childWhenDragging: Container(),
                              )
                            : (scoreList[index] == 1)
                                ? Image.asset(
                                    rightWrongImages[0],
                                    fit: BoxFit.fitHeight,
                                  )
                                : Image.asset(
                                    rightWrongImages[1],
                                    fit: BoxFit.fitHeight,
                                  ),
                      ),
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.5,
                        color: quizColors.elementAt(index).values.elementAt(0),
                        child: DragTarget(
                          builder: (context, List<List<int>> candidateData,
                              rejectedData) {
                            return Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.4,
                            );
                          },
                          onWillAccept: (data) {
                            return true;
                          },
                          onAccept: (List<int> data) {
                            //Updating the scores - 1 for correct & 0 for incorrect
                            scoreList[data[0]] = (data[1] ==
                                    quizColors
                                        .elementAt(index)
                                        .keys
                                        .elementAt(0))
                                ? 1
                                : 0;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
