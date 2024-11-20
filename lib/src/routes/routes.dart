import 'package:flutter/material.dart';
import 'package:cats_project/src/pages/home_page.dart';
import 'package:cats_project/src/pages/landing_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'landing': (BuildContext context) => LandingPage()
  };
}
