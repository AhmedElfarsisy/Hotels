import 'package:yalla_travel/model/Destination.dart';
import 'package:yalla_travel/model/Rooms.dart';
import 'package:http/http.dart' as http;

class APIRequest {

  Future<List<Destination>> fetchPopular() async {
    List<Destination> destinationList;
    var url =
        Uri.parse('https://608d4294fe2e9c00171e16f1.mockapi.io/destination');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      destinationList = destinationFromJson(response.body);
      print("my Destination List ${destinationList[0].title}");
    } else {
      throw Exception("Failed to load data");
    }
    return destinationList;
  }

  Future<List<Rooms>> fetchRooms() async {
    List<Rooms> roomsList;
    var url = Uri.parse('https://608d4294fe2e9c00171e16f1.mockapi.io/rooms');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      roomsList = roomsFromJson(response.body);
      print("my Rooms List ${roomsList[0].title}");
    } else {
      throw Exception("Failed to load data");
    }
    return roomsList;
  }
}
