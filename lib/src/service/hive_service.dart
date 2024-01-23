import 'package:hive/hive.dart';

import '../data/model/favorite_model.dart';

class HiveService {
  static Box? box;

  static void openBox() async {
    box = await Hive.openBox("favorite");
  }

  static void writeToBox(List<FavoriteModel> favoriteList) async {
    for (var item in favoriteList) {
      await box!.get(item);
    }
  }

}
