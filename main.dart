import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Calculator(),
    debugShowCheckedModeBanner: false,);
  }
}
