import 'package:ejara_test/services/service_api.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:ejara_test/ui/base/base_view_model.dart';
import 'package:logging/logging.dart';

class AppBottomSheetVM extends BaseViewModel {
  final _logger = Logger("AppBottomSheetVM");
  final  ServiceApi _serviceApi = serviceLocator.get<ServiceApi>();

  List paymentSettingsMethods = [];
  final int? id;

  AppBottomSheetVM([this.id]) {
    _init();
  }

  void _init() async {
    setBusy(true);
    _logger.info("fetching payment settings method");
    try {
      // firstly run the login function to
      //generate bearer token
      final res = await _serviceApi.fetchPaymentSettingsPerMethod(id);
      paymentSettingsMethods = res;
      notifyListeners();
    } catch (e) {
      setError("Error occured at this time");
      _logger.severe("Error happened at this time");
    } finally {
      setBusy(false);
    }
  }
}
