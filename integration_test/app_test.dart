import 'package:ejara_test/app.dart';
import 'package:ejara_test/models/payment_type.dart';
import 'package:ejara_test/ui/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test/helpers/test_helpers.dart';
import '../test/helpers/test_helpers.mock.dart';

void main() {
  late MockServiceApi mockServiceApi;
  setUp(() {
    getAndRegisterAppLevelRouter();
    mockServiceApi = getAndRegisterServiceApi();
  });

  final paymentList = [
    PaymentType(descriptionEn: "english", titleEn: "French"),
    PaymentType(descriptionEn: "description", titleEn: "francois"),
  ];

  void arrangeSuccessResponseFromServiceApi() {
    when(() => mockServiceApi.login()).thenAnswer((_) async => true);
    when(() => mockServiceApi.fetchPaymentMethods()).thenAnswer((_) async => paymentList);
  }

  testWidgets("tapping on the first payment type brings open the bottom sheet", (widgetTester) async {
    arrangeSuccessResponseFromServiceApi();

    await widgetTester.pumpWidget(const EjaraApp());
    await widgetTester.pump();

    await widgetTester.tap(find.text("French"));

    await widgetTester.pumpAndSettle();

    expect(find.text("Choose a payment \nmethod"), findsNothing);
    expect(find.text("Select the mobile money method"), findsOneWidget);

    await widgetTester.tap(find.byKey(const Key("text-button")));

    await widgetTester.pumpAndSettle();

    expect(find.text("Select the mobile money method"), findsNothing);
    expect(find.text("New mobile money"), findsOneWidget);
    expect(find.byType(CustomDropDown), findsOneWidget);
  });
}
