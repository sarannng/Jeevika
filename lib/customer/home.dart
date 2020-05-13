import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jeevika/customer/description.dart';
 

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          CarouselSlider(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            height: 170.0,
            items: [124, 123, 125].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      //decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset('assets/images/$i.jpeg'),
                      );
                },
              );
            }).toList(), 
          ),
          Container(
            child: Expanded(child: Column(
            children: <Widget>[

             // SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  
                  Text(
                    'Select the service you want',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'lato',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                ],
              ),

              // SizedBox(height: 20,),

              Container(
                height: 320,
                decoration: BoxDecoration(
                    // color: Colors.blueAccent[100]
                    ),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),

                  children: <Widget>[
                    InkWell(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/plumber.png',
                              height: 90,
                              width: 90,
                            ),
                            Text('Plumber')
                          ],
                        ),
                      ),
                      onTap: () {
                        print("tapped o n container");
                            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Description()),
            );

           // Navigator.pushReplacementNamed(context, "/description");
                      },
                    ),

                    // plumber wala column

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/mechanic.png',
                            height: 90,
                            width: 90,
                          ),
                          Text('Mechanic')
                        ],
                      ),
                    ),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/elec.png',
                            height: 80,
                            width: 80,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Plumber')
                        ],
                      ),
                    ),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/carpenter.png',
                            height: 90,
                            width: 90,
                          ),
                          Text('Carpenter')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
          ),
          )        
        
        ],
      ),
    );
  }
}
