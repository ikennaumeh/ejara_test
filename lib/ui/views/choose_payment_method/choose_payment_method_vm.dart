import 'package:ejara_test/models/payment_type.dart';
import 'package:ejara_test/navigation/app_routes.dart';
import 'package:ejara_test/services/service_api.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:ejara_test/ui/base/base_view_model.dart';
import 'package:logging/logging.dart';

class ChoosePaymentMethodVM extends BaseViewModel {
  final _logger = Logger("ChoosePaymentMethodVM");
  final _serviceApi = serviceLocator.get<ServiceApi>();

  List<PaymentType> paymentTypeList = [];

  Future<void> getStarted() async {
    _logger.info("initializing");
    setBusy(true);
    try {
      final isSuccessful = await _serviceApi.login();

      if (isSuccessful) {
        final response = await _serviceApi.fetchPaymentMethods();
        paymentTypeList = response;
        notifyListeners();
      }
    } catch (e) {
      setError("Error occured at this time");
      _logger.severe("Error happened at this time");
    }
  }

  void routeToNextScreen() {
    router.pushNamed(AppRoutes.addMobileMoney);
  }
}
