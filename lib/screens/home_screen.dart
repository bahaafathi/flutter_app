import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// A screen that displays a randomly changing background color and
/// text that changes language when tapped.
class HomeScreen extends StatefulWidget {
  /// The route name for this screen.
  static const String routeName = "homeScreen";

  /// The list of supported languages.
  static const List<String> supportedLanguages = [
    "Привіт!",
    "Hello there",
    "¡Hola!",
    "Bonjour",
    "مرحبا!",
  ];

  /// Creates a new instance of the [HomeScreen] widget.
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  final int _maximumRgbValue = 255;
  final double _brightnessLevel = 0.5;
  final fontSize = 35.0;
  Color _backgroundColor = Colors.black;
  Color _textColor = Colors.white;

  int _langIndex = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _changeBackgroundColor();
      _changeLanguage();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  /// Changes the background color of the screen to a random color
  /// and adjusts the text color based on the luminance of the
  /// background color.
  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        _random.nextInt(_maximumRgbValue),
        _random.nextInt(_maximumRgbValue),
        _random.nextInt(_maximumRgbValue),
        1,
      );

      _textColor = _backgroundColor.computeLuminance() > _brightnessLevel
          ? Colors.black
          : Colors.white;
    });
  }

  /// Changes the language of the displayed text to the next language
  /// in the list of supported languages.
  void _changeLanguage() {
    setState(() {
      if (_langIndex < HomeScreen.supportedLanguages.length - 1) {
        _langIndex++;
      } else {
        _langIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: _backgroundColor,
        child: InkWell(
          onTap: () {
            _changeLanguage();
            _changeBackgroundColor();
          },
          child: Center(
            child: Text(
              HomeScreen.supportedLanguages[_langIndex],
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: _textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
