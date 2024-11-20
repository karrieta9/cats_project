import 'package:cats_project/src/pages/home_page.dart';
import 'package:cats_project/src/routes/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        scaffoldBackgroundColor: const Color(0xffE9E8CD)
      ),
      debugShowCheckedModeBanner: false,
      title: 'Catbreeds App',
      initialRoute: 'home',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return HomePage();
        });
      },
    );
  }
}
