import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jeevika/customer/home.dart';
import 'package:jeevika/customer/test2.dart';
import 'package:jeevika/customer/test3.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer start
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: ((MediaQuery.of(context).size.height)/2),
              child: DrawerHeader(
              
              decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              colors: [
                Colors.orange[900], 
                Colors.orange[800],
                Colors.orange[400],
              ],
            ),),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.account_circle,
                            size:150,
                            color: Colors.white,),

                            SizedBox(height: 20,),

                            Text('Sarang Pal',
                            
                            style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30), ),

                            SizedBox(height: 10,),

                            Text('235653313665',
                            style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
           
            ),
          
            ListTile(
              title: Text('Previous Orders'),
              trailing: Icon(Icons.add_circle),
            ),
             Divider(),
            ListTile(
              title: Text('Current Order'),
              trailing: Icon(Icons.add_circle),
            ),
            Divider(),
            ListTile(
              title: Text('FAQ'),
              trailing: Icon(Icons.add_circle),
            ),
            Divider(),
            ListTile(
              title: Text('Logout'),
              trailing: Icon(Icons.add_circle),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/');
              },
              
            ),
            Divider(),
          ],
        ),
      ),
      //Drawer ends
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' Welcome Sarang!',
          style: TextStyle(
            fontFamily: 'montserrat',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange[900],
                Colors.orange[800],
                Colors.orange[400],
              ],
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (newIndex) => setState((){ _currentIndex= newIndex;}) ,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text("Home"),
      //       ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.book),
      //       title: Text("Issue")
      //       ),

      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.monetization_on),
      //       title: Text("Payment")
      //       ),
      //   ],
      //   ),

      //   body: new IndexedStack(
      //     index: _currentIndex,
      //     children: <Widget>[
      //       // new Home(),
      //       // new Issue(),
      //       // new Payment(),
      //     ],
      //   ),

      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        animationDuration: Duration(milliseconds: 300),
        color: Colors.green[800],
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.compare_arrows,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.compare_arrows,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          //Handle button tap
          setState(() {
            _page = index;
          });
        },
      ),
      body: new IndexedStack(
        index: _page,
        children: <Widget>[
          new Home(),
          new Test2(),
          new Test3(),
        ],
      ),
    );
  }
}
