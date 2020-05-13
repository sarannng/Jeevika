import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Prebidwait extends StatefulWidget {

  final int doc;

  const Prebidwait({Key key, this.doc}) : super(key: key);
  @override
  _PrebidwaitState createState() => _PrebidwaitState();


}



class _PrebidwaitState extends State<Prebidwait> {


 int _doc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  setdoc(){
    setState(() {
      _doc= widget.doc;
    });
  }
 
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
      body:  Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
        color: Color.fromRGBO(21, 14, 51, 1),
        ),
        child: Center(
      
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('We are contacting workers,\n please wait for a moment..',
            textAlign: TextAlign.center,
            

            style: GoogleFonts.lato(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,
            ), 
             ),
  
             Text(_doc.toString(),
             textAlign: TextAlign.center,
            

            style: GoogleFonts.lato(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold,
            ),
             ),

            // Image.asset('assests/images/wait.gif') 
            new Image(image: new AssetImage("assets/images/wait.gif"))
          ],
        ),
      ),
      ),
    );
  }
}