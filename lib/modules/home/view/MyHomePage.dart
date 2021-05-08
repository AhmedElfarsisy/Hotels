import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:yalla_travel/data/remote/APIRequest.dart';
import 'package:yalla_travel/modules/detail/DetailsScreen.dart';
import 'package:yalla_travel/model/Destination.dart';
import 'package:yalla_travel/model/Rooms.dart';
import 'package:yalla_travel/modules/home/provider/HomeProvider.dart';
import 'package:yalla_travel/util/SharedWidgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final sharedWidgets = SharedWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          titleSpacing: 0.0,
          title: _homeScreenAppbarItems()),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20.0, right: 20.0),
              child: _listViewHeader("Destination Popular", "See More")),
          Container(
              height: MediaQuery.of(context).size.height * 0.30,
              margin: EdgeInsets.only(left: 20),
              child: ChangeNotifierProvider<HomeProvider>(
                create: (context) => HomeProvider(),
                child: Consumer<HomeProvider>(
                  builder: (buildContext, homeProvider, _) {
                    return (homeProvider.destinationsList != null)
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: homeProvider.destinationsList.length,
                            itemBuilder: (context, index) {
                              final item = homeProvider.destinationsList[index];
                              return _getPopularCardView(
                                  item.image, item.title);
                            })
                        : sharedWidgets.buildProgressIndicator();
                  },
                ),
              )),
          Container(
              margin: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 20.0, right: 20.0),
              child: _listViewHeader("Recommended Rooms", "")),
          Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ChangeNotifierProvider<HomeProvider>(
                create: (context) => HomeProvider(),
                child: Consumer<HomeProvider>(
                  builder: (buildContext, homeProvider, _) {
                    return (homeProvider.roomsList != null)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: homeProvider.roomsList.length,
                            itemBuilder: (context, index) {
                              final item = homeProvider.roomsList[index];
                              return _buildRoomCardView(item.image, item.title,
                                  item.price, item.rating, item);
                            })
                        : sharedWidgets.buildProgressIndicator();
                  },
                ),
              )),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: sharedWidgets.buildBottomAppBar(),
    );
  }

  Widget _homeScreenAppbarItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            margin: const EdgeInsets.only(left: 15.0, right: 20.0),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            )),
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(shape: BoxShape.circle),
          margin: const EdgeInsets.only(top: 10.0, right: 20.0),
          child: Image.asset('assets/profile/avater.png'),
        )
      ],
    );
  }

  Widget _listViewHeader(String destination, String seeMore) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          destination,
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        Text(
          seeMore,
          style: TextStyle(color: Colors.black12, fontSize: 22),
        ),
      ],
    );
  }

  Widget _getPopularCardView(String imagePath, String title) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.40,
              height: MediaQuery.of(context).size.height * 0.30,
              child: sharedWidgets.clipRRectImageChildPopular(
                  imagePath, 20, 20, 20, 20)),
          Center(child: Text(title,
                style: TextStyle(color: Colors.white, fontSize: 36)),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomCardView(
      String imagePath, String title, String price, double rate, Rooms item) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: sharedWidgets.cardViewDecoration(),
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              child: Hero(
                tag: item.id,
                child: sharedWidgets.clipRRectImageChildPopular(
                    imagePath, 20, 20, 0, 0),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailsScreen(item)));
            },
          ),
          buildTextPartInRoomsCard(title, price, rate),
        ],
      ),
    );
  }

  Column buildTextPartInRoomsCard(String title, String price, double rate) {
    return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: Text(
                title,
                style: TextStyle(color: Colors.black38, fontSize: 22),
              ),
              alignment: Alignment.centerLeft,
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
              child: Text(
                "\$$price/night",
                style: TextStyle(color: Colors.black38, fontSize: 18),
              ),
              alignment: Alignment.centerLeft,
            ),
            Row(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  child: sharedWidgets.ratingBar(rate, Colors.amberAccent),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  child: Text(
                    rate.toString(),
                    style: TextStyle(color: Colors.black38, fontSize: 18),
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ],
        );
  }
}
