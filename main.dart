import 'package:flutter/material.dart';
import 'pavlova.dart';
import 'health.dart';
import 'gradient.dart';
import 'login_page.dart';
import 'statefull.dart';
import 'calculator.dart';
import 'home_page.dart';
import 'larggestnum.dart';
import 'form.dart';
import 'w_login.dart';
import 'w_chat.dart';
import 'insta_logo.dart';
import 'BMI.dart';
import 'Sharedpref.dart';
void main() {
  runApp(Main());
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:insta_logo(),
    debugShowCheckedModeBanner: false,);
  }
}
