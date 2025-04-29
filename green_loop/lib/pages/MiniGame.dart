/*import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main () => runApp(MyApp());
class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home : landing(),
    );
    
  }
}
class landing extends StatefulWidget{

  @override
  //List<int> snakePosition = [45, 65, 85]; 
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  static List<int> snakePosition = [45, 65, 85, 105, 125];
  int numberOfSquares = 760;

  static var randomNumber = Random();
  int food = randomNumber.nextInt(700);
  void generateNewFood();
  food = randomNumber.nextInt(700);
}

void startGame() {
  List<int> snakePosition = [45, 65, 85, 105, 125];
  const duration = const Duration(millieseconds: 300);
  Timer.periodic(duration, (Timer timer){
    updateSnake();
    //if (gameOver()) {
    // timer.cancel();
    //_showGameOverScreen();
    //}
  });
}

var direction = 'down';
void updateSnake() {
  setState(() {
    switch (direction) {
      case 'down':
      if (snakePosition.last > 740) {
        snakePosition.add(snakePosition.last + 20 - 760);

      } else {
        snakePosition.add(snakePosition.last + 20);
      }

      break;

      case 'up':
      if (snakePosition.last < 20){
        snakePosition.add(snakePosition.last - 20 + 760);
      } else {
        snakePosition.add(snakePosition.last - 20);
      }

      break;

      case 'left':
      if(snakePosition.last % 20 == 0 ){
        snakePosition.add(snakePosition.last - 1 + 20);
      } else {
        snakePosition.add(snakePosition.last - 1);
      }

      break;

      case 'right' :
      if ( (snakePosition.last +1) % 20 == 0){
        snakePosition.add(snakePosition.last + 1 - 20);
      } else {
        snakePosition.add(snakePosition.last + 1);
      }
      break;
      default:
    }
    if (snakePosition.last == food){
      generateNewFood();
    } else {
      snakePosition.removeAt(0);
    }
  });
}


/* 
bool GameOver() {
for (int i = 0; i < snakePosition.length; i++){
int count = 0;
for (int j = 0; j < snakePosition.length; j++) {
  if (snakePosition[i] == snakePosition[j]) {
  count += 1;
  }
  if (count == 2){
  return true;
  }
  }
}
return false;
} */


/*
void _showGameOverScreen(){
showDialog(context: context,
builder: (BuildContext context){
return AlertDialog})
} */

*/



///////NEW VERSION
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
  List<int> snakePosition = [45, 65, 85, 105, 125];
  int numberOfSquares = 760;
  var randomNumber = Random();
  int food = 300;
  String direction = 'down';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    generateNewFood();
    startGame();
  }

  void generateNewFood() {
    setState(() {
      food = randomNumber.nextInt(numberOfSquares);
    });
  }

  void startGame() {
    timer = Timer.periodic(Duration(milliseconds: 300), (Timer timer) {
      updateSnake();
    });
  }

  
  void updateSnake() {
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
      } else {
        snakePosition.removeAt(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Snake Game UI Coming Soon...',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
