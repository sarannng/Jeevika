import 'package:flutter/material.dart';
import 'package:jeevika/main.dart';

import 'customer/first.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {

    TextEditingController _email= new TextEditingController();
    TextEditingController _pass= new TextEditingController();;

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
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Signup here!',
                        style: TextStyle(
                            fontFamily: 'lato',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(225, 97, 27, 0.3),
                              blurRadius: 5,
                              offset: Offset(10, 10),
                            )
                          ],
                        ),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                //padding: EdgeInsets.all(4),

                                child: TextField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    hintText: 'Enter email or phone',
                                    border: InputBorder.none,
                                    filled: true,

                                    // fillColor: Color.fromRGBO(199, 193, 193, 1),
                                    fillColor:
                                        Color.fromRGBO(255, 199, 115, 0.2),
                                  ),
                                ),
                              ),
                            ],
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
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Enter password',
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color.fromRGBO(255, 199, 115, 0.2),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            child: RaisedButton(
                              onPressed: () {
                                // Navigator.pushReplacementNamed(context, '/first');
                                   Navigator.pushReplacement(context,  MaterialPageRoute(builder: (BuildContext context) => MyHomePage()));
                                // String keyid = _email.text;
                                // print(_email.text);
                                // print(_pass.text);
                                // // _handleSignIn();
                                // signin();



                        
                                 
                                  // var check = Firestore.instance
                                  //     .collection('workers')
                                  //     .where(
                                  //       'email',
                                  //       isEqualTo: '$keyid',
                                  //     )
                                  //     .getDocuments();
                                  // check.then((onData) {
                                  // if(onData.documents.first.exists){
                                  //    print(onData.documents.first.data);
                                  // }
                                  // else{
                                  //   print('notfound');
                                  // }
                                      
                                   
                               
                                  // });
                                  
                               

                                  //Navigator.pushReplacement(context,  MaterialPageRoute(builder: (BuildContext context) => First()));
                              
                              
                              //_auth.verifyPhoneNumber(phoneNumber: _email.text, timeout:null, verificationCompleted: null, verificationFailed: null, codeSent: null, codeAutoRetrievalTimeout: null);
                            
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xff374ABE),
                                        Color(0xff64B6FF)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 150.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Sign up as customer",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ), 
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/ssignupdetails');
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
                                "Server Signup",
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