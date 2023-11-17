import 'package:ejara_test/models/login_response.dart';
import 'package:ejara_test/models/payment_type.dart';
import 'package:ejara_test/services/exceptions/token_expiry_exception.dart';
import 'package:ejara_test/services/network_service.dart';
import 'package:ejara_test/services/secure_storage_service.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:logging/logging.dart';

class ServiceApi {
  final _networkService = serviceLocator.get<NetworkService>();
  final _secureStorage = serviceLocator.get<SecureStorageService>();
  final _logger = Logger("ServiceApi");

  Future<bool> login() async {
    _logger.info('login tiggered');

    Map<String, dynamic> body = {"log": "ejaraTests", "password": "CmKVGexi%REJjn!u65BI7PlR5"};
    try {
      final response = await _networkService.post(
        "/auth/login",
        data: body,
      );
      final res = LoginResponse.fromJson(response);
      await _secureStorage.writeAccessToken(token: res.token);
      return res.token != null;
    } on TokenExpiryException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PaymentType>> fetchPaymentMethods() async {
    _logger.info('fetch payment methods tiggered');

    Map<String, dynamic> queryParams = {
      "countryCode": "CM",
      "transactionType": "buy",
    };
    try {
      final response = await _networkService.get(
        "/marketplace/payment-types-per-country",
        queryParameters: queryParams,
      );

      return List<PaymentType>.from(response["data"].map((e) => PaymentType.fromJson(e)));
    }  on TokenExpiryException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
