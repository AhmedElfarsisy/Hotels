import 'package:flutter/cupertino.dart';
import 'package:yalla_travel/data/Repository.dart';
import 'package:yalla_travel/model/Destination.dart';
import 'package:yalla_travel/model/Rooms.dart';

class HomeProvider extends ChangeNotifier {
  List<Destination> destinationsList;
  List<Rooms> roomsList;
  final _repository = Repository.getInstance();

  HomeProvider() {
    getPopularDestination();
    getRooms();
  }

  void getPopularDestination() {
    _repository.fetchPopularDestination().then((value) {
      destinationsList = value;
      notifyListeners();
    });
  }

  void getRooms() {
    _repository.fetchRooms().then((newRooms) => roomsList = newRooms);
    notifyListeners();
  }
}
