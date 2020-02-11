import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final String destinationImagePath;
  final String destinationLocation;
  HomeWidget(
      {@required this.destinationImagePath,
      @required this.destinationLocation});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image.asset(
                destinationImagePath,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.teal,
                    ),
                    Text(
                      destinationLocation,
                      style: TextStyle(
                          fontFamily: 'DancingScript',
                          fontSize: 25,
                          color: Colors.teal),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  final String destinationLocation;
  final String destinationDetail;
  DetailWidget(
      {@required this.destinationLocation, @required this.destinationDetail});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 30),
        color: Colors.lime[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.teal,
                      size: 23,
                    ),
                    Text(
                      destinationLocation,
                      style: TextStyle(
                        fontFamily: 'IndieFlower',
                        fontSize: 23,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text(
                  destinationDetail,
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListWidget extends StatefulWidget {
  final Map allDestinationsData;
  ListWidget({@required this.allDestinationsData});
  @override
  State<StatefulWidget> createState() {
    return ListWidgetState(allDestinationsData);
  }
}

class ListWidgetState extends State<ListWidget> {
  final Map allDestinationsData;
  ListWidgetState(this.allDestinationsData);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.lime[100],
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  'Destinations',
                  style: TextStyle(
                    fontFamily: 'DancingScript',
                    fontSize: 35.0,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: allDestinationsData.length,
                itemBuilder: (BuildContext context, int _itemIndex) {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          width: MediaQuery.of(context).size.width * 0.785,
                          child: Image.asset(
                            allDestinationsData[_itemIndex].elementAt(0),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Container(
                          child: Text(
                            allDestinationsData[_itemIndex].elementAt(1),
                            style: TextStyle(
                              fontFamily: 'IndieFlower',
                              fontSize: 21.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
