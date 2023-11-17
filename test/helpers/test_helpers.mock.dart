import 'package:ejara_test/navigation/router.dart';
import 'package:ejara_test/services/network_service.dart';
import 'package:ejara_test/services/secure_storage_service.dart';
import 'package:ejara_test/services/service_api.dart';
import 'package:mocktail/mocktail.dart';

class MockAppLevelRouter extends Mock implements AppLevelRouter {}
class MockSecureStorageService extends Mock implements SecureStorageService {}
class MockNetworkService extends Mock implements NetworkService{}
class MockServiceApi extends Mock implements ServiceApi{}