import 'package:ejara_test/models/payment_type.dart';
import 'package:ejara_test/navigation/app_routes.dart';
import 'package:ejara_test/services/service_api.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:ejara_test/ui/base/base_view_model.dart';
import 'package:logging/logging.dart';

class ChoosePaymentMethodVM extends BaseViewModel {
  final _logger = Logger("ChoosePaymentMethodVM");
  late ServiceApi _serviceApi;

  ChoosePaymentMethodVM([ServiceApi? api]) {
    _serviceApi = api ?? serviceLocator.get<ServiceApi>();
  }

  List<PaymentType> paymentTypeList = [];

  Future<void> init() async {
    setBusy(true);
    _logger.info("initializing");
    try {
      // firstly run the login function to
      //generate bearer token
      final res = await _serviceApi.login();
      if (!res) return;

      // when login is successfully, fetch payment methods
      final response = await _serviceApi.fetchPaymentMethods();
      // assign your response to the paymentTypeList
      paymentTypeList = response;
      notifyListeners();
    } catch (e) {
      setError("Error occured at this time");
      _logger.severe("Error happened at this time");
    } finally {
      setBusy(false);
    }
  }

  void routeToNextScreen() {
    router.pushNamed(AppRoutes.addMobileMoney);
  }
}
