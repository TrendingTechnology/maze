import 'package:flutter/material.dart';
import 'package:maze_game/maze.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MazeScreen());
  }
}

class MazeScreen extends StatefulWidget {
  @override
  _MazeScreenState createState() => _MazeScreenState();
}

class _MazeScreenState extends State<MazeScreen> {
  final MazePainter _mazePainter = MazePainter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: GestureDetector(
            onVerticalDragUpdate: (info) =>
                _mazePainter.updatePosition(info.localPosition),
            child: CustomPaint(
                painter: _mazePainter,
                size: Size(context.width, context.height))));
  }
}

extension ScreenSize on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}