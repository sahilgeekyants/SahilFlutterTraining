import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  double screenHeight, sceenWidth;
  List<File> images;
  bool listOrGridView; // used to Toggle between listview and gridview

  // Function to show dialog to choose between Camera & Gallery.
  Future<File> createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: Center(
            child: Text(
              'Select Option',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Center(
                child: Text(
                  'Choose in Gallery',
                  style: TextStyle(
                      fontFamily: 'DancingScript',
                      fontSize: 25,
                      color: Colors.teal),
                ),
              ),
              onPressed: () async {
                File image = await ImagePicker.pickImage(
                    source: ImageSource.gallery); // opens gallery
                Navigator.of(context)
                    .pop(image); // returns image File to FloatingActionButton()
              },
            ),
            MaterialButton(
              elevation: 5.0,
              child: Center(
                child: Text(
                  'Click with Camera',
                  style: TextStyle(
                      fontFamily: 'IndieFlower',
                      fontSize: 25,
                      color: Colors.teal),
                ),
              ),
              onPressed: () async {
                File image = await ImagePicker.pickImage(
                    source: ImageSource.camera); // opens camera
                Navigator.of(context)
                    .pop(image); // returns image File to FloatingActionButton()
              },
            )
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    images = List();
    listOrGridView = true;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    sceenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text(
            listOrGridView ? 'Tap for Grid View' : 'Tap for List View',
          ),
          // toggle between listview and gridview by cliking on appBar.
          onTap: () {
            setState(() {
              listOrGridView = !listOrGridView;
            });
          },
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context).then((onValue) {
            if (onValue != null) {
              setState(() {
                images.add(onValue); // Adding image File to the list
              });
            }
          });
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      body: SafeArea(
        child: Container(
          height: screenHeight,
          width: sceenWidth,
          child: listOrGridView /* Decides ListView or GridView here */
              ? ListView.builder(
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: <Widget>[
                            Image.file(
                              images.elementAt(index),
                            ),
                            Container(
                              height: 40,
                              alignment: Alignment.center,
                              width: sceenWidth,
                              child: FlatButton(
                                onPressed: () async {
                                  var path = images.elementAt(index).path;
                                  var text = path
                                      .split('/')[path.split('/').length - 1];
                                  // Function used to share data with other apps
                                  await FlutterShare.shareFile(
                                      text: 'Shared $text',
                                      title: 'Image',
                                      filePath: path);
                                },
                                child: Icon(
                                  Icons.share,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(0.5),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: sceenWidth / 2 - 39,
                              child: Image.file(
                                images.elementAt(index),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              height: 30,
                              alignment: Alignment.center,
                              width: sceenWidth,
                              child: FlatButton(
                                onPressed: () async {
                                  var path = images.elementAt(index).path;
                                  var text = path
                                      .split('/')[path.split('/').length - 1];
                                  await FlutterShare.shareFile(
                                      text: 'Shared $text',
                                      title: 'Image',
                                      filePath: path);
                                },
                                child: Icon(
                                  Icons.share,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
