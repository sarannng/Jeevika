import 'package:flutter/material.dart';

class SsignupDetails2 extends StatefulWidget {
  @override
  _SsignupDetails2State createState() => _SsignupDetails2State();
}

class _SsignupDetails2State extends State<SsignupDetails2> {
  @override
    Widget build(BuildContext context) {
    TextEditingController _email = new TextEditingController();
    TextEditingController _pass = new TextEditingController();
    ;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        // padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400],

              // Color.fromRGBO(0, 0, 0, 1),
              // Color.fromRGBO(20, 19, 19, 1),
              // Color.fromRGBO(41, 39, 39, 1),
            ],
          ),
        ),

        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            // Text(
            //   'Jeevika',
            //   style: TextStyle(
            //       fontSize: 40,
            //       color: Colors.white,
            //       fontWeight: FontWeight.w500),
            // ),

            Image.asset(
              'assets/images/logo3.png',
              width: 150,
              height: 150,
            ),
            // SizedBox(
            //   height: 50,
            // ),
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    // color:  Color.fromRGBO(115, 101, 101,  1),
                    // gradient: LinearGradient(
                    //     colors: [Colors.orange[200], Colors.orange[100]]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      // bottomLeft: Radius.circular(60),
                      // bottomRight: Radius.circular(60)
                    )),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Signup Details 2!',
                        style: TextStyle(
                            fontFamily: 'lato',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                       
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(225, 97, 27, 0.3),
                                offset: Offset(10, 10),
                                blurRadius: 5)
                          ],
                        ),
                        child: Container(
                          //padding: EdgeInsets.only(left: 12),
                          child: TextField(
                            controller: _pass,
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromRGBO(255, 199, 115, 0.2),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(225, 97, 27, 0.3),
                                offset: Offset(10, 10),
                                blurRadius: 5)
                          ],
                        ),
                        child: Container(
                          //padding: EdgeInsets.only(left: 12),
                          child: TextField(
                            controller: _pass,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Address',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromRGBO(255, 199, 115, 0.2),
                            ),
                          ),
                        ),
                      ),

                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, '/ssignupdetails');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.red, Colors.redAccent],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 150.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Signup as worker",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   height: 50.0,
                      //   child: RaisedButton(
                      //     onPressed: () {
                      //       // Navigator.pushNamed(context, '/sbidlost');
                      //       Navigator.pushNamed(context, '/cpostbid');
                      //     },
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(80.0)),
                      //     padding: EdgeInsets.all(0.0),
                      //     child: Ink(
                      //       decoration: BoxDecoration(
                      //           gradient: LinearGradient(
                      //             colors: [Colors.black54, Colors.black26],
                      //             begin: Alignment.centerLeft,
                      //             end: Alignment.centerRight,
                      //           ),
                      //           borderRadius: BorderRadius.circular(30.0)),
                      //       child: Container(
                      //         constraints: BoxConstraints(
                      //             maxWidth: 150.0, minHeight: 50.0),
                      //         alignment: Alignment.center,
                      //         child: Text(
                      //           "Testing Route",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(color: Colors.white),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}