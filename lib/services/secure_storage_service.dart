import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';

class SecureStorageService {
  final _logger = Logger('SecureStorageService');
  final String _accesskey = 'access_token';
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  Future<void> deleteAccessToken() async {
    try {
      await _flutterSecureStorage.delete(key: _accesskey);
    } catch (e, s) {
      _logger.severe('error trying to delete access token', e, s);
    }
  }

  Future<String?> readAccessToken() async {
    try {
      return await _flutterSecureStorage.read(key: _accesskey);
    } catch (e, s) {
      _logger.severe('error trying to read access token', e, s);
      return null;
    }
  }

  Future<void> writeAccessToken({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _accesskey, value: token);
    } catch (e, s) {
      _logger.severe('error trying to write access token', e, s);
    }
  }

}
