import 'package:flutter/cupertino.dart';

class IndexProvider extends ChangeNotifier {
  int pos = 0;
  void setPostion(int val) {
    pos = val;
    notifyListeners();
  }
}
