import 'package:yalla_travel/data/remote/APIRequest.dart';
import 'package:yalla_travel/model/Destination.dart';
import 'package:yalla_travel/model/Rooms.dart';

class Repository {
  static Repository _INSTANCE;
  final _apiRequest = APIRequest();

  static getInstance() {
    if (_INSTANCE == null) {
      _INSTANCE = Repository();
    }
    return _INSTANCE;
  }
  Future<List<Destination>> fetchPopularDestination() {
    return _apiRequest.fetchPopular();
  }

  Future<List<Rooms>> fetchRooms() {
    return _apiRequest.fetchRooms();
  }
}
