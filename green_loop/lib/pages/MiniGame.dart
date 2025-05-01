import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}

class Landing extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Landing> {
  int score = 0;
  List<int> snakePosition = [45, 65, 85, 105, 125];
  int numberOfSquares = 760;
  var randomNumber = Random();
  int food = 300;
  String direction = 'down';
  Timer? timer;
void resetGame() {
  score = 0;
  timer?.cancel();
  snakePosition = [45, 65, 85, 105, 125];
  direction = 'down';
  generateNewFood();
  startGame();
  setState(() {});
}
void showWinDialog(){
  showDialog(
    context : context,
    builder: (context){
      return AlertDialog(
        title: Text('You Win!'),
        content: Text('Congratulations, you reached 100 points!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              resetGame();

            },
            child: Text('Play Again'),
          )
        ],
      );
    },
  );
}
  @override
  void initState() {
    super.initState();
    generateNewFood();
    startGame();
  }
  

  void startGame() {
    timer = Timer.periodic(Duration(milliseconds: 300), (Timer timer) {
      updateSnake();
    });
  }
  void generateNewFood(){
    food = randomNumber.nextInt(numberOfSquares);
  }
  
  void updateSnake() {

    //showGameOverDialog(context);

    setState(() {
      switch (direction) {
        case 'down':
          if (snakePosition.last > numberOfSquares - 20) {
            snakePosition.add(snakePosition.last + 20 - numberOfSquares);
          } else {
            snakePosition.add(snakePosition.last + 20);
          }
          break;

        case 'up':
          if (snakePosition.last < 20) {
            snakePosition.add(snakePosition.last - 20 + numberOfSquares);
          } else {
            snakePosition.add(snakePosition.last - 20);
          }
          break;

        case 'left':
          if (snakePosition.last % 20 == 0) {
            snakePosition.add(snakePosition.last - 1 + 20);
          } else {
            snakePosition.add(snakePosition.last - 1);
          }
          break;

        case 'right':
          if ((snakePosition.last + 1) % 20 == 0) {
            snakePosition.add(snakePosition.last + 1 - 20);
          } else {
            snakePosition.add(snakePosition.last + 1);
          }
          break;
      }

      if (snakePosition.last == food) {
        generateNewFood();
        score += 10;
        if(score >= 100){
          timer?.cancel();
          showWinDialog();
        }
      } else {
        snakePosition.removeAt(0);
      }
    //});
    if(snakePosition.sublist(0, snakePosition.length - 1).contains(snakePosition.last)){
      timer?.cancel();
      showGameOverDialog();
    }
    });
  }
    void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Game Over'),
          content: Text('You crashed into yourself!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: Text('Restart'),
            )
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    Padding(
      padding: const EdgeInsets.all(16.0),
      child : Text(
        'Score: $score',
        style: TextStyle(color: Colors.green, fontSize: 18),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
            body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                //var direction;
                if (details.delta.dy > 0 && direction != 'up') {
                  direction = 'down';
                } else if (details.delta.dy < 0 && direction != 'down') {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx > 0 && direction != 'left') {
                  direction = 'right';
                } else if (details.delta.dx < 0 && direction != 'right') {
                  direction = 'left';
                }
              },
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: numberOfSquares,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  if (snakePosition.contains(index)) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  } else if (index == food) {
                    return Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Swipe to move',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        ),
     
    );
  }
}
