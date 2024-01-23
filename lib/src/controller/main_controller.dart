import 'package:breaking_news/src/data/model/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainController extends ChangeNotifier {
  final List<FavoriteModel> _favoriteList = [];

  List<FavoriteModel> get getFavoriteList => _favoriteList;

  void addFavoriteList(FavoriteModel model) {
    final hive = Hive.box("favorite");
    hive.add(_favoriteList);
    _favoriteList.add(model);
    notifyListeners();
  }

  void deleteFavoriteList(int index) {
    _favoriteList.removeAt(index);
    notifyListeners();
  }

  Future navigatorScreen(BuildContext context, Widget widget) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  void navigationPageBuilder(int index, values, PageController pageController) {
    pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 250),
      curve: Curves.linear,
    );
    index = values;
    notifyListeners();
  }
}
