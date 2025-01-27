import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int _initialSeconds = 1500;
  int _totalPomodoros = 0;
  int _totalSeconds = _initialSeconds;
  late Timer _timer;
  bool _isRunning = false;

  void _onStartPressed() {
    setState(() {
      _isRunning = true;
    });

    _timer = Timer.periodic(
      Duration(seconds: 1),
      _onTick,
    );
  }

  void _onPausePressed() {
    setState(() {
      _isRunning = false;
    });
    _timer.cancel();
  }

  void _onTick(Timer timer) {
    setState(() {
      _totalSeconds -= 1;
    });

    if (_totalSeconds <= 0) {
      _onComplete();
    }
  }

  void _onComplete() {
    setState(() {
      _totalPomodoros += 1;
      _totalSeconds = _initialSeconds;
    });
  }

  String formatMinutesAndSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String formattedMinutes = minutes.toString().padLeft(2, '0');
    String formattedSeconds = remainingSeconds.toString().padLeft(2, '0');
    return '$formattedMinutes:$formattedSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7626C),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                formatMinutesAndSeconds(_totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 88,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Center(
                child: IconButton(
                  iconSize: 120,
                  onPressed: _isRunning ? _onPausePressed : _onStartPressed,
                  icon: Icon(
                    _isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodoros',
                          style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          _totalPomodoros.toString(),
                          style: TextStyle(
                            fontSize: 48,
                            color:
                                Theme.of(context).textTheme.displayLarge?.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
