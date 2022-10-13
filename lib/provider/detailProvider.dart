import 'package:flutter/foundation.dart';

class DetailProvider extends ChangeNotifier {
  bool fevorite = true;

  like() {
    fevorite = !fevorite;
    notifyListeners();
  }
}
