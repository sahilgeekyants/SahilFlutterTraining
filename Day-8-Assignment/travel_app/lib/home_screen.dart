import 'dart:math';
import 'package:flutter/material.dart';
import 'package:Travel_India/data.dart';
import 'package:Travel_India/navigation_widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  static Map destinations = Data.getDestinationsData();
  int destinationsCount = destinations.length;
  static int _index = 0;
  int selectedBottomNavigationTab = 0;
  var random = Random();

  List<Widget> navigationWidgetTabs = [
    HomeWidget(
      destinationImagePath: destinations[_index].elementAt(0),
      destinationLocation: destinations[_index].elementAt(1),
    ),
    DetailWidget(
      destinationLocation: destinations[_index].elementAt(1),
      destinationDetail: destinations[_index].elementAt(2),
    ),
    ListWidget(
      allDestinationsData: destinations,
    ),
  ];
  _onNavigationTabClicked(int index) {
    setState(() {
      selectedBottomNavigationTab = index;
    });
  }

  _update(int newIndex) {
    setState(() {
      _index = newIndex;
      navigationWidgetTabs[0] = HomeWidget(
        destinationImagePath: destinations[_index].elementAt(0),
        destinationLocation: destinations[_index].elementAt(1),
      );
      navigationWidgetTabs[1] = DetailWidget(
        destinationLocation: destinations[_index].elementAt(1),
        destinationDetail: destinations[_index].elementAt(2),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomNavigationTab, // change on tapping
        //onTap: (int i) {},
        onTap: _onNavigationTabClicked,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.teal,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.teal),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.details,
              color: Colors.teal,
            ),
            title: Text(
              'Detail',
              style: TextStyle(color: Colors.teal),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              //Icons.info,
              Icons.list,
              color: Colors.teal,
            ),
            title: Text(
              'List',
              style: TextStyle(color: Colors.teal),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'Travel India',
          textAlign: TextAlign.right,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: navigationWidgetTabs.elementAt(selectedBottomNavigationTab),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _update(random.nextInt(destinationsCount));
        },
        label: Text(
          'Next',
          style: TextStyle(
              fontFamily: 'Montserrat', fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        tooltip: 'Next',
        icon: Icon(Icons.forward),
      ),
      drawer: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.80, //drawerWidth according to device
          child: Drawer(
            child: Container(
              color: Colors.teal,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: DrawerHeader(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Image.asset(
                          destinations[_index].elementAt(0),
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: destinations.length,
                      itemBuilder: (BuildContext context, int _itemIndex) {
                        return ListTile(
                          dense: true,
                          onTap: () {
                            _update(_itemIndex);
                          },
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 23,
                          ),
                          title: Text(
                            destinations[_itemIndex].elementAt(1),
                            style: TextStyle(
                              fontFamily: 'IndieFlower',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
