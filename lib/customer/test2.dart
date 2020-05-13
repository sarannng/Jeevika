 
import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  AppBar(
      //   centerTitle: true,
      //     title: Text(
      //   'Jeevika',
      //   style: TextStyle(
      //     fontFamily: 'montserrat',
      //     fontSize: 18,
      //     fontWeight: FontWeight.bold,
          
      //   ),
      // ),
      
      // flexibleSpace: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.orange[900],
      //         Colors.orange[800],
      //         Colors.orange[400],

      //       ],

      //     ),
      //   ),
      // ),
      
      // ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('We are contacting workers,\n please wait for a moment.',
            style: TextStyle(),),

            Image.asset('assests/images/wait.gif') 
          ],
        ),
      ),
    );
  }
}