import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

void main() {
  runApp(const MovmentImage());
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Text('Hello World!'),
//         ),
//       ),
//     );
//   }
// }

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int _timer = 0;
  bool _isLiked = false;
  Random random = Random();
  Color _currentColor = Colors.white;

  List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange, Colors.purple, Colors.pink, Colors.brown, Colors.grey, Colors.black, Colors.indigo, Colors.lime, Colors.teal, Colors.cyan, Colors.amber, Colors.deepOrange];

  void changeColor() {
    setState(() {
      _currentColor = colors[random.nextInt(colors.length)];
    });
  }
  void resetColor() {
    setState(() {
      _currentColor = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _currentColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Text("Timer: ${_timer} seconds",
              style: TextStyle(fontSize: 24)
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _timer++;
                    });
                  },
                  child: const Text("Start timer")
              ),

              SizedBox(height: 60,),
              IconButton(
                  onPressed: (){
                    setState((){
                      _isLiked = !_isLiked;
                    });
                  },
                  icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : Colors.black,
                  size: 40,
                  )
              ),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    changeColor();
                  });
                },
                child: Text("Change color"),

              ),

              ElevatedButton(
                onPressed: (){
                  setState(() {
                    resetColor();
                  });
                },
                child: Text("Reset color"),

              ),

              SizedBox(height: 60,),

              Card(
                child: GestureDetector(
                  // onTap: (){
                  //   setState(() {
                  //     _timer += 1;
                  //   });
                  // },
                  // onDoubleTap: (){
                  //   setState(() {
                  //     _timer += 100;
                  //   });
                  // },
                  //   onLongPress: (){
                  //   setState(() {
                  //     _timer = 0;
                  //   });
                  // },
                  onVerticalDragUpdate: (details){
                    if (details.delta.dy > 0){
                      setState(() {
                        _currentColor = Colors.green;
                      });
                      print("Down");
                    }else if (details.delta.dy < 0){
                      setState(() {
                        _currentColor = Colors.yellow;
                      });
                      print("Up");
                    }
                  },
                  onHorizontalDragUpdate: (details){
                    if (details.delta.dx > 0){
                      setState(() {
                        _currentColor = Colors.cyanAccent;
                      });
                      print("Left");
                    }else if (details.delta.dx < 0) {
                      setState(() {
                        _currentColor = Colors.red;
                      });
                      print("Right");
                    }
                  },
                  // splashColor: Colors.blue,

                  child: Container(
                    width: 300,
                    height: 300,
                    child: Text(""),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MovmentImage extends StatefulWidget {
  const MovmentImage({super.key});

  @override
  State<MovmentImage> createState() => _MovmentImageState();
}

class _MovmentImageState extends State<MovmentImage> {
  double _xPosition = 200;
  double _yPosition = 200;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: _yPosition,
              left: _xPosition,
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    _xPosition += details.delta.dx;
                    _yPosition += details.delta.dy;
                  });
                },
                child: Image.network('https://i.pinimg.com/736x/e0/92/f2/e092f2af33ae07240bd78ad00f2a46d6.jpg',width: 200,height: 100,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



