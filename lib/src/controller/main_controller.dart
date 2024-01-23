import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
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
