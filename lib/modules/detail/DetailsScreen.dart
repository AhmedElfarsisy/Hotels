import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:yalla_travel/util/SharedWidgets.dart';

import '../../model/Rooms.dart';

class DetailsScreen extends StatefulWidget {
  Rooms selectedRoom;

  DetailsScreen(this.selectedRoom);

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  final sharedWidgets = SharedWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GestureDetector(
            child: Center(
              child: Hero(
                tag: widget.selectedRoom.id,
                child: _buildImageContainer(widget.selectedRoom.image),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Positioned(
            child: _buildCardView(),
            bottom: 20,
            right: 20,
            left: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.network(
        imagePath,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  Widget _buildCardView() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: sharedWidgets.cardViewDecoration(),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      alignment: Alignment.bottomCenter,
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.40,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    widget.selectedRoom.title,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Family Comping",
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child:sharedWidgets.ratingBar(widget.selectedRoom.rating,Colors.purple) ,
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.pin_drop_outlined,
                        color: Colors.black38,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        widget.selectedRoom.location,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Spacer(),
          ),
          Container(
            child: Column(
              children: [
                Spacer(),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    "\$${widget.selectedRoom.price}",
                    style: TextStyle(color: Colors.deepPurple, fontSize: 24),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 5, right: 20),
                  child: Text(
                    "/per night",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  alignment: Alignment.topLeft,
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    size: 48,
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }




}
// Future<List<Rooms>> fetchRooms() as
