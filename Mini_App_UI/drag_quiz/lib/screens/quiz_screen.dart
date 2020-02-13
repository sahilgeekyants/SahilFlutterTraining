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
  List<String> quizImages = Data().imageData;
  List<Color> quizColors = Data().colorData;
  List<int> answers = Data().answersequence;
  List<String> rightWrongImages = Data().rightWrongImageData;
  List<int> imageScores = [
    -1,
    -1,
    -1,
    -1,
    -1,
    -1,
    -1
  ]; // Initial State: -1, Correct: 1, Wrong: 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            imageScores = [-1, -1, -1, -1, -1, -1, -1];
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
                        child: (imageScores[index] == -1)
                            ? Draggable(
                                data: [
                                  index,
                                  answers.elementAt(index),
                                ],
                                child: Image.asset(
                                  quizImages.elementAt(index),
                                  fit: BoxFit.fitHeight,
                                ),
                                feedback: Image.asset(
                                  quizImages.elementAt(index),
                                  height:
                                      MediaQuery.of(context).size.height / 9,
                                  fit: BoxFit.fitHeight,
                                ),
                                childWhenDragging: Container(),
                              )
                            : (imageScores[index] == 1)
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
                        constraints: BoxConstraints(),
                        color: quizColors[index],
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
                            //print(data);
                            imageScores[data[0]] = (data[1] == index) ? 1 : 0;
                            // if (data[1] == index) {
                            //   imageScores[data[0]] = 1;
                            // } else {
                            //   imageScores[data[0]] = 0;
                            // }
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
