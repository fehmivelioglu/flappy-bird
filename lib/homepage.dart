import 'dart:async';

import 'package:flappy_bird/barries.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });
      if (birdYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 2,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => gameHasStarted ? jump() : startGame(),
                  child: AnimatedContainer(
                    alignment: Alignment(0, birdYaxis),
                    duration: const Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: const MyBird(),
                  ),
                ),
                Container(
                  alignment: const Alignment(0, -0.3),
                  child: gameHasStarted
                      ? const Text('')
                      : const Text(
                          'T A P  T O  P L A Y',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                ),
                AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(0, 1),
                    child: const MyBarrier(200))
              ],
            )),
        Container(
          height: 15,
          color: Colors.green,
        ),
        Expanded(
            child: Container(
          color: Colors.brown,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'SCORE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '0',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'BEST',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '10',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )
              ],
            )
          ]),
        ))
      ]),
    );
  }
}
