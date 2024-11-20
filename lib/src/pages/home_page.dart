import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  width: size.height * 0.5,
                  child: const FadeInImage(
                    placeholder: AssetImage('assets/img/footstep.png'),
                    fadeInDuration: Duration(milliseconds: 200),
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/cat_shape.png'),
                  ),
                ),
                const Text('Catbreeds',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            right: 20,
            child: TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'landing'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xfffa7c5d),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/img/footstep.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
