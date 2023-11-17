import 'package:ejara_test/models/payment_type.dart';
import 'package:ejara_test/services/exceptions/token_expiry_exception.dart';
import 'package:ejara_test/services/service_locator.dart';
import 'package:ejara_test/ui/views/choose_payment_method/choose_payment_method_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mock.dart';

void main() {
  late ChoosePaymentMethodVM viewModel;
  late MockServiceApi mockServiceApi;
  group('ChoosePaymentMethodVM Tests -', () {
    setUp(() {
      getAndRegisterAppLevelRouter();
      mockServiceApi = MockServiceApi();
      viewModel = ChoosePaymentMethodVM(mockServiceApi);
      
    });
    tearDown(() => serviceLocator.reset());

    group('initial values', () {
      test("test that list is empty at the start", () {
        expect(viewModel.paymentTypeList, []);
      });

      test("test that view model was not busy at the start", () {
        expect(viewModel.isBusy, isFalse);
      });

      test("test that init returns payment method successfully", () async {
        when(() => mockServiceApi.login()).thenAnswer((_) async => true);

        when(() => mockServiceApi.fetchPaymentMethods())
            .thenAnswer((_) async => [PaymentType(id: 1, code: "Momo", descriptionEn: "english", titleEn: "French")]);

        await viewModel.init();
        expect(viewModel.paymentTypeList, isNotEmpty);
      });

      test("test that init fails when login fails", () async {
        when(() => mockServiceApi.login()).thenAnswer((_) async => false);

        await viewModel.init();
        expect(viewModel.paymentTypeList, isEmpty);
        expect(viewModel.isBusy, isFalse);
      });

      test("test that init fails when fetch payment fails", () async {
        when(() => mockServiceApi.login()).thenAnswer((_) async => true);

        when(() => mockServiceApi.fetchPaymentMethods()).thenAnswer((_) async {
          throw TokenExpiryException();
        });

        await viewModel.init();
        expect(viewModel.paymentTypeList, isEmpty);
        expect(viewModel.isBusy, isFalse);
      });
    });
  });
}
