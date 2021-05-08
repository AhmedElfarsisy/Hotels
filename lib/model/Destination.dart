import 'dart:convert';

List<Destination> destinationFromJson(String str) => List<Destination>.from(json.decode(str).map((x) => Destination.fromJson(x)));

String destinationToJson(List<Destination> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Destination {
  Destination({
    this.title,
    this.image,
  });

  String title;
  String image;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
  };
}

