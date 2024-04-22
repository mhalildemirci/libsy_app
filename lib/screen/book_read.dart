import 'package:flutter/material.dart';
import 'package:flip_widget/flip_widget.dart';
import 'dart:math' as math;

class BookRead extends StatefulWidget {
  final String description;

  const BookRead({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  _BookReadState createState() => _BookReadState();
}

const double _MinNumber = 0.008;

double _clampMin(double v) {
  if (v < _MinNumber && v > -_MinNumber) {
    if (v >= 0) {
      v = _MinNumber;
    } else {
      v = -_MinNumber;
    }
  }
  return v;
}

class _BookReadState extends State<BookRead> {
  GlobalKey<FlipWidgetState> _flipKey = GlobalKey();

  Offset _oldPosition = Offset.zero;
  bool _visible = true;

  late List<String> texts;
  int textIndex = 0;

  @override
  void initState() {
    super.initState();
    texts = widget.description.split('|');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size boxSize = Size(screenSize.width, screenSize.height);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                child: Container(
                  width: boxSize.width,
                  height: boxSize.height,
                  child: GestureDetector(
                    child: FlipWidget(
                      key: _flipKey,
                      textureSize: boxSize * 3,
                      child: Container(
                        color: Color.fromARGB(255, 235, 237, 192),
                        child: Center(
                          child: Text(
                            texts[textIndex],
                          ),
                        ),
                      ),
                    ),
                    onHorizontalDragStart: (details) {
                      _oldPosition = details.globalPosition;
                      _flipKey.currentState?.startFlip();
                    },
                    onHorizontalDragUpdate: (details) {
                      Offset off = details.globalPosition - _oldPosition;
                      double tilt = 1 / _clampMin((-off.dy + 20) / 100);
                      double percent =
                          math.max(0, -off.dx / boxSize.width * 1.4);
                      percent = percent - percent / 2 * (1 - 1 / tilt);
                      _flipKey.currentState?.flip(percent, tilt);
                    },
                    onHorizontalDragEnd: (details) {
                      _flipKey.currentState?.stopFlip();
                      setState(() {
                        textIndex = (textIndex + 1) % texts.length;
                      });
                    },
                    onHorizontalDragCancel: () {
                      _flipKey.currentState?.stopFlip();
                    },
                  ),
                ),
                visible: _visible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
