import 'package:flutter/material.dart';

class Sbidlost extends StatefulWidget {
  @override
  _SbidlostState createState() => _SbidlostState();
}

class _SbidlostState extends State<Sbidlost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

                Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR5xrjKY2ZDRYoT7C6cAloOvTOxJDko2bF7PAElNPRXjtlZRW4Z'),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have lost the bid!',
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.w400),
                ),
              ],
            ),

SizedBox(height: 13,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'The winning bid was:',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
              ],
            ),

            SizedBox(height: 13,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '545',
                  style: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
