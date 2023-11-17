import 'package:ejara_test/app.dart';
import 'package:ejara_test/models/payment_type.dart';
import 'package:ejara_test/ui/widgets/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mock.dart';

void main() {
  late MockServiceApi mockServiceApi;
  setUp(() {
    getAndRegisterAppLevelRouter();
    mockServiceApi = getAndRegisterServiceApi();
  });

  final paymentList = [
    PaymentType(descriptionEn: "english", titleEn: "French"),
    PaymentType( descriptionEn: "description", titleEn: "francois"),
  ];

  void arrangeSuccessResponseFromServiceApiAfter2Seconds() {
    when(() => mockServiceApi.login()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 1));
      return true;
    });

    when(() => mockServiceApi.fetchPaymentMethods()).thenAnswer((_) async {
      await Future.delayed(const Duration(seconds: 1));
      return paymentList;
    });
  }

  void arrangeSuccessResponseFromServiceApi() {
    when(() => mockServiceApi.login()).thenAnswer((_) async => true);
    when(() => mockServiceApi.fetchPaymentMethods()).thenAnswer((_) async => paymentList);
  }

  testWidgets("title is displayed", (widgetTester) async {
    await widgetTester.pumpWidget(const EjaraApp());
    expect(find.text("Choose a payment \nmethod"), findsOneWidget);
  });

  testWidgets("wallet card is in the widget tree ", (widgetTester) async {
    await widgetTester.pumpWidget(const EjaraApp());
    expect(find.byType(WalletCard), findsOneWidget);
  });

  testWidgets("select payment method in the widget tree can be found by key", (widgetTester) async {
    await widgetTester.pumpWidget(const EjaraApp());
    expect(find.byKey(const Key("select-a-payment-method")), findsOneWidget);
  });

  testWidgets("loading indicator is displayed while waiting for articles", (widgetTester) async {
    arrangeSuccessResponseFromServiceApiAfter2Seconds();

    await widgetTester.pumpWidget(const EjaraApp());
    await widgetTester.pump(const Duration(milliseconds: 500));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await widgetTester.pumpAndSettle();
  });

  testWidgets("payment type lists are displayed", (widgetTester) async {
     arrangeSuccessResponseFromServiceApi();

    await widgetTester.pumpWidget(const EjaraApp());

    await widgetTester.pump();

    for (final item in paymentList) {
      expect(find.text(item.titleEn!), findsOneWidget);
      expect(find.text(item.descriptionEn!), findsOneWidget);
    }
  });
}
