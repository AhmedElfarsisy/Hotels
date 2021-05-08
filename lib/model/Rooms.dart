

import 'dart:convert';

List<Rooms> roomsFromJson(String str) => List<Rooms>.from(json.decode(str).map((x) => Rooms.fromJson(x)));

String roomsToJson(List<Rooms> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Rooms {
  Rooms({
    this.id,
    this.image,
    this.title,
    this.price,
    this.sale,
    this.rating,
    this.location,
    this.description,
    this.img,
  });

  String id;
  String image;
  String title;
  String price;
  String sale;
  double rating;
  String location;
  String description;
  String img;

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
    id: json["id"],
    image: json["image"] == null ? null : json["image"],
    title: json["title"],
    price: json["price"] == null ? null : json["price"],
    sale: json["sale"] == null ? null : json["sale"],
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    location: json["location"] == null ? null : json["location"],
    description: json["description"] == null ? null : json["description"],
    img: json["img"] == null ? null : json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image == null ? null : image,
    "title": title,
    "price": price == null ? null : price,
    "sale": sale == null ? null : sale,
    "rating": rating == null ? null : rating,
    "location": location == null ? null : location,
    "description": description == null ? null : description,
    "img": img == null ? null : img,
  };
}
