import 'package:flutter/material.dart';
import 'package:stroll_interview/configs/assets.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _body();
  }

  Widget _body() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          Assets.images.background,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        )
      ],
    );
  }
}
