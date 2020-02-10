import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  static Map<int, List<String>> destinations = {
    0: [
      'assets/Hampi.jpg',
      'Hampi (Karnataka)',
      'This was the capital of the Vijayanagar empire and a visit to the ruins of this majestic marvel will take you back in time.'
    ],
    1: [
      'assets/Lachen.jpg',
      'Lachen (Sikkim)',
      'This place experiences light snowfall and this makes the appearance of the place even more surreal.'
    ],
    2: [
      'assets/Mysore-Dussehra.jpg',
      'Mysore (Karnataka)',
      'Mysore turns into such a divine spectacle with all the grand celebrations of Dussehra going around.'
    ],
    3: [
      'assets/Navaratri-in-Vadodara.jpg',
      'Vadodara (Gujarat)',
      'When you are in Vadodara in October, you will witness the grand celebration of Navratri.'
    ],
    4: [
      'assets/Shillong.jpg',
      'Shillong (Meghalaya)',
      'A visit will help you witness the place thriving with greenery and giving away a divine feeling.'
    ],
    5: [
      'assets/Srinagar.jpg',
      'Srinagar (Kashmir)',
      'The beauty of this place is the snow-covered Himalayan range, the flourishing valley, delectable food and the traditional attires.'
    ],
    6: [
      'assets/Tawang-Gate.jpg',
      'Tawang (Arunachal Pradesh)',
      'It is a 17-century monastery which was founded by the contemporary of the fifth Dalai Lama. This monastery is also the birthplace of the sixth Dalai Lama.'
    ],
    7: [
      'assets/Sundarbans.jpg',
      'Sundarbans (West Bengal)',
      'The main attraction of this place has always been this majestic creature and the fine beauty of this place.'
    ],
  };
  int destinationsCount = destinations.length;
  int _index = 0;
  var random = Random();
  _update(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // change on tapping
        onTap: (int i) {},
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
              Icons.info,
              color: Colors.teal,
            ),
            title: Text(
              'About',
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
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Image.asset(
                  destinations[_index].elementAt(0),
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
                        destinations[_index].elementAt(1),
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18.0,
                            color: Colors.teal),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                              fontFamily: 'Montserrat',
                              fontSize: 16,
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
