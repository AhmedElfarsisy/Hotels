import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class SharedWidgets {
  BoxDecoration cardViewDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 1))
        ]);
  }


  RatingBar ratingBar(double rate, Color color) {
    return RatingBar.readOnly(
      initialRating: rate,
      isHalfAllowed: true,
      filledColor: color,
      halfFilledIcon: Icons.star_half,
      filledIcon: Icons.star,
      size: 25,
      emptyIcon: Icons.star_border,
    );
  }

  Center buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blue,
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.home),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.mode_comment_outlined),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.airplanemode_active),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.star),
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }



  ClipRRect clipRRectImageChildPopular(String imagePath,double topLeft, double topRight , double bottomLeft , double bottomRight) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(topLeft), topRight: Radius.circular(topRight),bottomLeft: Radius.circular(bottomLeft),bottomRight:  Radius.circular(bottomRight) ),
      child: Image.network(
        imagePath,
        fit: BoxFit.fill,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

}
