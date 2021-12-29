import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/enum/viewstate.dart';



class BaseProvider extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;




  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

}
