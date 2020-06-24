import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feedback Dialog',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DialogScreen(),
    );
  }
}

class _DialogScreenState extends State<DialogScreen> {
  var rating= 0.0;

  void _showRatingDialog() {
    // We use the built in showDialog function to show our Rating Dialog
    showDialog(
        context: context,
       // barrierDismissible: true, // set to false if you want to force a rating
        builder: (BuildContext context) {
          return Center(
            child: Dialog(
              shape:  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: SingleChildScrollView(
                child:  Wrap(
                  // height:530,
                  // width:300,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.values[0
                      ],


                      children: <Widget>[

                        Stack(
                          alignment: Alignment.topRight,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.close),
                            ),

                            Padding(
                                padding: EdgeInsets.only(top: 30),
                                child:  Center(
                                  child: Text("Thanks for availing service from", textAlign: TextAlign.center),
                                )
                            ),
                          ],
                        ),



                        Padding(
                            padding: EdgeInsets.only(top:5),
                            child: Center(
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage('assets/image.jpeg'),
                                )
                            )
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child:  Center(
                            child: Text("Dr. Nupur Garg", textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child:  Center(
                            child: Text("Rate your experience", textAlign: TextAlign.center),
                          ),
                        ),


                        Padding(
                          padding: EdgeInsets.only(top:10),
                          child: Center(
                            child: SmoothStarRating(
                              rating: rating,
                              color: Colors.green,
                              isReadOnly: false,
                              size: 30,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border,
                              starCount: 5,
                              allowHalfRating: false,
                              borderColor: Colors.green,
                              spacing: 0.0,

                              onRated: (value){

                              },

                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left:28,top: 18),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Leave your comments",textAlign: TextAlign.left,

                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top:0,left: 20,right:20),
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(bottom:10.0),
                            child: TextField(
                              maxLines: 5,
                              inputFormatters: [LengthLimitingTextInputFormatter(250)],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder()
                              ),
                            ),

                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top:0,bottom: 20),
                          child: Center(
                            child: RaisedButton(

                              child: Text('Submit',
                                style: TextStyle(
                                    color: Colors.white
                                ),),
                              color: Colors.lightGreen,
                              disabledColor: Colors.lightGreen,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),


                            ),
                          ),
                        )



                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  });}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Feedback Dialog"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Show Feedback Dialog"),
            onPressed: _showRatingDialog,
          ),
        ),
      ),
    );
  }
}

class DialogScreen extends StatefulWidget {
  DialogScreen();

  @override
  _DialogScreenState createState() => new _DialogScreenState();
}
