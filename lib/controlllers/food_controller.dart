import 'dart:math';

import 'package:chopnow_restaurant/models/additive_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  String _category = "";
  String get category => _category;

  set setCategory(String newValue) {
    _category = newValue;
  }

  RxList<String> _types = <String>[].obs;
  RxList<String> get types => _types;

  set setTypes(String newVale) {
    _types.add(newVale);
  }


  int generateId () {
    int min = 0;
    int max = 1000000;

    final _random = Random();
    return min + Random().nextInt(max - min);
  }

  RxList<AdditiveModel> _additiveList = <AdditiveModel>[].obs;
  RxList<AdditiveModel> get additiveList => _additiveList;

  set addAdditive(AdditiveModel newValue) {
    _additiveList.add(newValue);
  }

  void clearAdditives() {
    _additiveList.clear();
  }


}