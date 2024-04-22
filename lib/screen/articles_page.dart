import 'package:flutter/material.dart';
import 'package:libsy_app/screen/Home_Page.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  late double screenWidth;

  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 1.0),
              Color.fromRGBO(69, 60, 60, 1.0),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.04,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: screenWidth * 0.06,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Container(
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/pics/nothing.png'),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            Center(
              child: Text(
                ' Burada henuz bir sey yok ama\nmerak etme cok yakinda olacak',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
