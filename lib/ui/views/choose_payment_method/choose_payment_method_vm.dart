import 'package:ejara_test/navigation/app_routes.dart';
import 'package:ejara_test/ui/base/base_view_model.dart';

class ChoosePaymentMethodVM extends BaseViewModel {
  void routeToNextScreen() {
    router.pushNamed(AppRoutes.addMobileMoney);
  }
}
