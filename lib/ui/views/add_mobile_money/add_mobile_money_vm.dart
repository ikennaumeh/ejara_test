import 'package:ejara_test/ui/base/base_view_model.dart';

class AddMobileMoneyVM extends BaseViewModel {
  bool value = false;

  void toggleSwitch(bool _value) {
    value = _value;
    notifyListeners();
  }
}
