import 'package:flutter/material.dart';
class CustomFontTexts extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Fonts'),
        backgroundColor: Colors.indigo,
      ),
      body: SafeArea(
        child: Container(
            color: Colors.lime[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Text( 'This is Default Font',style: TextStyle(fontSize: 25),),
                ),
                Center(
                  child: Text( 'This is DancingScript Font',
                    style: TextStyle(fontFamily: 'DancingScript',fontSize: 25),
                  ),
                ),
                Center(
                  child: Text( 'This is IndieFlower Font',
                    style: TextStyle(fontFamily: 'IndieFlower',fontSize: 25),
                  ),
                ),
                Center(
                  child: Text( 'This is JimNightshade Font',
                    style: TextStyle(fontFamily: 'JimNightshade',fontSize: 25),
                  ),
                ),
                Center(
                  child: Text( 'This is MaShanZheng Font',
                    style: TextStyle(fontFamily: 'MaShanZheng',fontSize: 25),
                  ),
                ),
                Center(
                  child: Text( 'This is Montserrat Font',
                    style: TextStyle(fontFamily: 'Montserrat',fontSize: 25),
                  ),
                ),
                
              ],
              
            ),
        ),
      ),
    );
  }
}