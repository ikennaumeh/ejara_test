import 'package:ejara_test/services/service_locator.dart';
import 'package:ejara_test/ui/bottomsheets/app_bottom_sheet_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mock.dart';

void main() {
  late AppBottomSheetVM viewModel;
  late MockServiceApi mockServiceApi;
  group('AppBottomSheetVM Tests -', () {
    setUp(() {
      getAndRegisterAppLevelRouter();
      mockServiceApi = MockServiceApi();
      viewModel = AppBottomSheetVM(1, mockServiceApi);
    });
    tearDown(() => serviceLocator.reset());

    test("payment settings method list initial value is empty ", () {
      expect(viewModel.paymentSettingsMethods, isEmpty);
    });

    test("test that fetch payment method is successful", () async {
      when(() => mockServiceApi.fetchPaymentSettingsPerMethod(1)).thenAnswer((_) async => ["dynamic data"]);

      await viewModel.fetchMethods();

      expect(viewModel.paymentSettingsMethods, isNotEmpty);
      expect(viewModel.isBusy, isFalse);
    });
  });
}
